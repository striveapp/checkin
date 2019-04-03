import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:checkin/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth;

  AuthBloc({
    @required this.auth
  });

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthState currentState, AuthEvent event) async* {
    var currentUser = null;
    if (event is AppStarted || event is LoggedIn ) {
      currentUser = await this.auth.currentUser();
    }

    if (currentUser != null) {
      yield AuthAuthenticated(user: User(currentUser.displayName,
          currentUser.email, "white", false));
    } else {
      yield AuthUnauthenticated();
    }

    if (event is LoggedOut) {
      this.auth.signOut();
      yield AuthUnauthenticated();
    }
  }
}