import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final AnalyticsRepository _analyticsRepository;
  final LocalStorageRepository _localStorageRepository;
  final UserRepository _userRepository;
  StreamSubscription _authSub;
  StreamSubscription _referredGymSub;

  AuthBloc({
    @required AuthRepository authRepository,
    @required AnalyticsRepository analyticsRepository,
    @required LocalStorageRepository localStorageRepository,
    @required UserRepository userRepository,
  })  : assert(authRepository != null &&
            analyticsRepository != null &&
            localStorageRepository != null &&
            userRepository != null),
        _authRepository = authRepository,
        _analyticsRepository = analyticsRepository,
        _localStorageRepository = localStorageRepository,
        _userRepository = userRepository,
        super(AuthUninitialized());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      _authSub?.cancel();
      try {
        _authSub = this._authRepository.getAuthState().listen(
            (loggedUser) async => add(AuthUpdated(loggedUser: loggedUser)));
      } catch (e) {
        debugPrint(
            'Error occurred when checking for auth state:' + e.toString());
        yield AuthUnauthenticated();
      }
    }

    if (event is AuthUpdated) {
      debugPrint(
          'add AuthUpdated with user: ${event.loggedUser ?? "Unauthenticated"}');
      if (event.loggedUser != null) {
        try {
          await _analyticsRepository.setUserProperties(event.loggedUser.uid);
          await _analyticsRepository.logUserLocale();
          await _setReferredGymForUser(event.loggedUser.email);
        } finally {
          yield AuthAuthenticated(loggedUser: event.loggedUser);
        }
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LogOut) {
      try {
        debugPrint('Attempting to LogOut...');
        await this._authRepository.signOut();
      } catch (e) {
        debugPrint('Error occurred trying to signOut:' + e.toString());
      }
    }
  }

  Future<void> _setReferredGymForUser(String userEmail) async {
    await _referredGymSub?.cancel();
    _referredGymSub = _localStorageRepository
        .getReferredGymId()
        .listen((referredGymId) async {
      print("Setting referredGym [$referredGymId] for user [$userEmail]");
      await _userRepository.updateSelectedGymId(userEmail, referredGymId);
      await _localStorageRepository.removeReferredGym();
      await _referredGymSub.cancel();
    });
  }

  @override
  Future<void> close() {
    _authSub?.cancel();
    _referredGymSub?.cancel();
    return super.close();
  }
}
