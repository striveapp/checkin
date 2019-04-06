import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/login/login_event.dart';
import 'package:checkin/src/blocs/login/login_state.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;
  final AuthBloc authenticationBloc;
  final UserRepository userRepository;

  LoginBloc(
      {@required this.googleSignIn,
      @required this.auth,
      @required this.authenticationBloc,
      @required this.userRepository});

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async* {
    LoginState stateResult;
    debugPrint('Processing event [$event], currentState [$currentState]');

    if (event is LoginWithGoogle) {
      debugPrint('Display loading spinner');
      yield LoginLoading();
      try {
        stateResult = await _googleSignIn().then((FirebaseUser user) async {
          final isNewUser = await this.userRepository.isNewUser(user.email);
          if (isNewUser) {
            debugPrint('Creating new user [$user]');
            await userRepository.createUser(user.displayName, user.email, "white", false);
          }
          debugPrint('User successfully logged in as [$user]');

          //@TODO: this can be removed
          return LoginSuccess(user: user) as LoginState;
        }).catchError((e) {
          print('Error during googleSignIn: ' + e.toString());
          //@TODO: this can be removed
          return LoginFailure();
        });
      } catch (e) {
        print('unexpected error during googleSignIn: ' + e.toString());
      }
      yield stateResult;
    }

    if (stateResult is LoginSuccess) {
      authenticationBloc.dispatch(LoggedIn());
    }
    debugPrint('Finally resetting login state to LoginInitial');

    yield LoginInitial();
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
