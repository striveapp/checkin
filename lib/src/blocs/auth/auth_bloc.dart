import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final AnalyticsRepository _analyticsRepository;
  StreamSubscription _authSub;

  AuthBloc({
    @required AuthRepository authRepository,
    @required AnalyticsRepository analyticsRepository,
  })  : assert(authRepository != null && analyticsRepository != null),
        _authRepository = authRepository,
        _analyticsRepository = analyticsRepository;

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      _authSub?.cancel();
      try {
        _authSub = this._authRepository.getAuthState().listen(
            (loggedUser) async => add(AuthUpdated(loggedUser: loggedUser)));
      } catch (e) {
        debugPrint(
            'Error ocurred when checking for auth state:' + e.toString());
        yield AuthUnauthenticated();
      }
    }

    if (event is AuthUpdated) {
      debugPrint(
          'add AuthUpdated with user: ${event.loggedUser ?? "Unauthenticated"}');
      if(event.loggedUser != null) {
        await _analyticsRepository.setUserProperties(event.loggedUser.uid);
        await _analyticsRepository.logUserLocale();
        yield AuthAuthenticated(loggedUser: event.loggedUser);
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LogOut) {
      try {
        debugPrint('Attempting to LogOut...');
        await this._authRepository.signOut();
      } catch (e) {
        debugPrint('Error ocurred trying to signOut:' + e.toString());
      }
    }
  }

  @override
  Future<void> close() {
    _authSub?.cancel();
    return super.close();
  }
}
