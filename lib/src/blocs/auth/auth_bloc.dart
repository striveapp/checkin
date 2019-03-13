
import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;

  AuthBloc({
    @required this.googleSignIn,
    @required this.auth
  });

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthState currentState, AuthEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SignIn && currentState is AuthUninitialized) {
      AuthState stateResult = await _signIn()
          .then((FirebaseUser user) => AuthSuccess(user: user))
          .catchError((e) => AuthError(error: e));

      yield stateResult;
    } else {
      Error error = StateError("Bad State");
      yield AuthError(error: error);
    }
  }

  Future<FirebaseUser> _signIn() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await auth.signInWithCredential(credential);
  }
}