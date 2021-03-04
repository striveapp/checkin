import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/version_util.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final AnalyticsRepository analyticsRepository;
  final LocalStorageRepository localStorageRepository;
  final UserRepository userRepository;
  final VersionUtil versionUtil;

  StreamSubscription _authSub;
  StreamSubscription _referredGymSub;
  StreamSubscription<User> _userSub;

  AuthBloc(
      {@required this.authRepository,
      @required this.analyticsRepository,
      @required this.localStorageRepository,
      @required this.userRepository,
      @required this.versionUtil,
      User loggedUser})
      : super(loggedUser == null
            ? AuthState.authUnauthenticated()
            : AuthState.authAuthenticated(loggedUser: loggedUser));

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      _authSub?.cancel();
      try {
        _authSub = authRepository
            .getAuthState()
            .listen((loggedUser) async => add(AuthUpdated(loggedUser: loggedUser)));
      } catch (e, st) {
        Logger.log.e('Error occurred when checking for auth state', e, st);
        yield AuthUnauthenticated();
      }
    }

    if (event is AuthUpdated) {
      Logger.log.i('add AuthUpdated with user: ${event.loggedUser ?? "Unauthenticated"}');
      if (event.loggedUser != null) {
        try {
          _userSub?.cancel();
          _userSub = await userRepository.subscribeToUser(event.loggedUser.email);
          await analyticsRepository.setUserProperties(event.loggedUser.uid);
          await analyticsRepository.logUserLocale();
          // we don't wait next call, because it introduces a delay in the emission of the
          // AuthAuthenticated state that allows the splash page to be fully displayed
          // better solution would be to refactor app.dart logic to remove the splash screen
          // by filtering the initState (this is not supported by bloc for now)
          await _setCurrentVersionForUser(event.loggedUser.email);
          await _setReferredGymForUser(event.loggedUser.email);
        } finally {
          await localStorageRepository.removeUserEmail();
          yield AuthAuthenticated(loggedUser: event.loggedUser);
        }
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LogOut) {
      try {
        Logger.log.i('Attempting to logout...');
        await authRepository.signOut();
      } catch (e, st) {
        Logger.log.e('Error occurred trying to signOut', e, st);
      }
    }
  }

  Future<void> _setReferredGymForUser(String userEmail) async {
    await _referredGymSub?.cancel();
    _referredGymSub = localStorageRepository.getReferredGymId().listen((referredGymId) async {
      Logger.log.i("Setting referredGym [$referredGymId] for user [$userEmail]");
      await userRepository.updateSelectedGymId(userEmail, referredGymId);
      await userRepository.updateKnownGymIds(userEmail, referredGymId);
      await localStorageRepository.removeReferredGym();
      await _referredGymSub.cancel();
    });
  }

  Future<void> _setCurrentVersionForUser(String userEmail) async {
    Version currentVersion = await versionUtil.getCurrentVersion();
    await userRepository.updateUserAppVersion(userEmail, currentVersion);
  }

  @override
  Future<void> close() {
    _authSub?.cancel();
    _referredGymSub?.cancel();
    _userSub.cancel();
    return super.close();
  }
}
