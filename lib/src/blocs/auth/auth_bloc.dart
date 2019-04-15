import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth;

  AuthBloc({
    @required this.auth,
  });

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthState currentState,
      AuthEvent event) async* {
    if (event is AppStarted) {
      try {
        //@TODO: we should take a look at this.auth.onAuthStateChanged
        FirebaseUser currentUser = await this.auth.currentUser();
        yield currentUser != null
            ? AuthAuthenticated(
            currentUserEmail: currentUser.email,
            isFirstLogin: false)
            : AuthUnauthenticated();
      } catch(e) {
        debugPrint('Error ocurred trying to retrieve the currentUser:' + e.toString());
      }
    }

    if (event is LoggedIn) {
      yield AuthAuthenticated(
          currentUserEmail: event.currentUserEmail,
          isFirstLogin: event.isFirstLogin
      );
    }

    if (event is LogOut) {
      try {
        this.auth.signOut();
        yield AuthUnauthenticated();
      } catch(e) {
        debugPrint('Error ocurred trying to signOut:' + e.toString());
      }
    }
  }
}
