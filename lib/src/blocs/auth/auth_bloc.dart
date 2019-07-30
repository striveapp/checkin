import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth;
  StreamSubscription authSub;
  
  AuthBloc({
    @required this.auth,
  }) {
    authSub = this.auth.onAuthStateChanged.listen((currentUser){
      dispatch(AuthUpdated(currentUserEmail: currentUser?.email));
    });
  }

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {

    if(event is AuthUpdated) {
      debugPrint('dispatched AuthUpdated with user: ${event.currentUserEmail ?? "Unauthenticated"}');
      yield event.currentUserEmail != null
          ? AuthAuthenticated(currentUserEmail: event.currentUserEmail, isFirstLogin: false)
          : AuthUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthAuthenticated(
          currentUserEmail: event.currentUserEmail,
          isFirstLogin: event.isFirstLogin
      );
    }

    if (event is LogOut) {
      try {
        await this.auth.signOut();
        yield AuthUnauthenticated();
      } catch(e) {
        debugPrint('Error ocurred trying to signOut:' + e.toString());
      }
    }
  }

  @override
  void dispose() {
    authSub.cancel();
    super.dispose();
  }
}
