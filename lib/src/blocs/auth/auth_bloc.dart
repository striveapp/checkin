import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:checkin/src/resources/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription _authSub;

  AuthBloc({@required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository;


  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is AppStarted) {
      _authSub?.cancel();
      try {
        _authSub = this._authRepository.getAuthState().listen((loggedUserEmail){
          add(AuthUpdated(loggedUserEmail: loggedUserEmail));
        });
      } catch(e) {
        debugPrint('Error ocurred when checking for auth state:' + e.toString());
        yield AuthUnauthenticated();
      }
    }

    if(event is AuthUpdated) {
      debugPrint('add AuthUpdated with user: ${event.loggedUserEmail ?? "Unauthenticated"}');
      yield event.loggedUserEmail != null
          ? AuthAuthenticated(loggedUserEmail: event.loggedUserEmail)
          : AuthUnauthenticated();
    }

    if (event is LoggedIn) {
      debugPrint('LoggedIn with user: ${event.currentUser}');
      yield AuthAuthenticated(
          loggedUserEmail: event.currentUser.email,
      );
    }

    if (event is LogOut) {
      try {
        debugPrint('Attempting to LogOut...');
        yield AuthUnauthenticated();
        await this._authRepository.signOut();
      } catch(e) {
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
