import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/login/login_event.dart';
import 'package:checkin/src/blocs/login/login_state.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;
  final AuthBloc authBloc;
  final UserBloc userBloc;
  final UserRepository userRepository;

  LoginBloc({
    @required this.googleSignIn,
    @required this.auth,
    @required this.authBloc,
    @required this.userBloc,
    @required this.userRepository,
  });

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async* {
    debugPrint('Processing event [$event], currentState [$currentState]');
    bool isNewUser;

    if (event is LoginWithGoogle) {
      debugPrint('Display loading spinner');
      yield LoginLoading();
      try {
        //@TODO: this should be refactored
        await _googleSignIn().then((user) async {
          isNewUser = await this.userRepository.isNewUser(user.email);
          if (isNewUser) {
            debugPrint('Dispatch Create user [$user]');
            this.userBloc.dispatch(Create(user: user));
          }
          debugPrint('User successfully logged in as [$user]');
          debugPrint('isFirstLogin: $isNewUser');
          this.authBloc.dispatch(LoggedIn(currentUserEmail: user.email, isFirstLogin: isNewUser));
        }).catchError((e) {
          print('Error during googleSignIn: ' + e.toString());
        });
      } catch (e) {
        print('unexpected error during googleSignIn: ' + e.toString());
        yield LoginFailure(errorMessage: "Login Failed. Please try again");
      }
    }
  }

  Future<User> _googleSignIn() async {
    final GoogleSignInAccount googleUser = await this.googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final firebaseUser = await this.auth.signInWithCredential(credential);

    return firebaseUser != null ?
      Future.value(User(
        name: firebaseUser.displayName,
        email: firebaseUser.email
      )) :
      Future.error("User is null");
  }
}
