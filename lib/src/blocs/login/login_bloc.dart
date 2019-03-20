import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/login/login_event.dart';
import 'package:checkin/src/blocs/login/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;
  final AuthBloc authenticationBloc;

  LoginBloc({
    @required this.googleSignIn,
    @required this.auth,
    @required this.authenticationBloc
  });

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async* {
    LoginState stateResult;

    if (event is LoginWithGoogle) {
      yield LoginLoading();
      stateResult = await _googleSignIn()
          .then((FirebaseUser user) => LoginSuccess(user: user))
          .catchError((e) => LoginFailure(error: e));
    }

    if (stateResult is LoginSuccess) {
      authenticationBloc.dispatch(LoggedIn());
      yield LoginInitial();
    }
  }

  Future<FirebaseUser> _googleSignIn() async {
    final GoogleSignInAccount googleUser = await this.googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await this.auth.signInWithCredential(credential);
  }
}