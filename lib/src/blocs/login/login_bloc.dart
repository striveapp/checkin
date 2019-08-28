import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/login/login_event.dart';
import 'package:checkin/src/blocs/login/login_state.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization_strings.dart';
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
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    debugPrint('Processing event [$event], currentState [$currentState]');
    bool isNewUser;

    if (event is LoginWithGoogle) {
      debugPrint('Display loading spinner');
      yield LoginLoading();
      try {
        //@TODO: this should be refactored
        var error;
        await _googleSignIn().then((user) async {
          isNewUser = await this.userRepository.isNewUser(user.email);

          debugPrint('Dispatch Create user [$user]');
          this.userBloc.dispatch(Create(user: user));

          debugPrint('User successfully logged in as [$user]');
          debugPrint('isFirstLogin: $isNewUser');
          this.authBloc.dispatch(
              LoggedIn(currentUserEmail: user.email, isFirstLogin: isNewUser));
        }).catchError((err) {
          print('Error during googleSignIn: ' + err.toString());
          error = err;
        });

        if(error != null) {
          yield LoginFailure(errorMessage: LoginFailed);
        }
      } catch (e) {
        print('unexpected error during googleSignIn: ' + e.toString());
        yield LoginFailure(errorMessage: LoginFailed);
      }
    }

    //TODO: We put this because we have no way to test google auth for now.
    if (event is LoginWithTestUser) {
      yield LoginLoading();
      final firebaseTestUser = await this.auth.signInWithEmailAndPassword(
          email: "test@test.com", password: "test123");
      debugPrint('Logged with test user [$firebaseTestUser]');
      this.authBloc.dispatch(LoggedIn(
          currentUserEmail: firebaseTestUser.email, isFirstLogin: false));
    }

    if (event is LoginWithTestUserTwo) {
      yield LoginLoading();
      final firebaseTestUser = await this.auth.signInWithEmailAndPassword(
          email: "test-two@test.com", password: "test123");
      debugPrint('Logged with test user [$firebaseTestUser]');
      this.authBloc.dispatch(LoggedIn(
          currentUserEmail: firebaseTestUser.email, isFirstLogin: false));
    }

    if (event is LoginWithTestUserOwner) {
      yield LoginLoading();
      final firebaseTestUser = await this.auth.signInWithEmailAndPassword(
          email: "test-owner@test.com", password: "test123");
      debugPrint('Logged with test user owner [$firebaseTestUser]');
      this.authBloc.dispatch(LoggedIn(
          currentUserEmail: firebaseTestUser.email, isFirstLogin: false));
    }
  }

  Future<User> _googleSignIn() async {
    FirebaseUser firebaseUser;
    try {
      debugPrint("attempt to login");
      final GoogleSignInAccount googleUser = await this.googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      firebaseUser = await this.auth.signInWithCredential(credential);
    } catch (err) {
      debugPrint("${err.toString()}");
      firebaseUser = null;
    }

    return firebaseUser != null
        ? Future.value(User(
            name: firebaseUser.displayName,
            email: firebaseUser.email,
            imageUrl: firebaseUser.photoUrl))
        : Future.error("User is null");
  }
}
