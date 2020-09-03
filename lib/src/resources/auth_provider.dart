import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthProvider implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final Crashlytics _crashlytics = Crashlytics.instance;

  AuthProvider({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Stream<User> getAuthState() {
    return _firebaseAuth.onAuthStateChanged
        .map((firebaseUser) => User.fromFirebaseUser(firebaseUser));
  }

  Future<String> getIdToken() async {
    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    IdTokenResult idToken = await firebaseUser.getIdToken();

    return idToken.token;
  }

  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleUser;
    GoogleSignInAuthentication googleAuth;
    AuthCredential credential;

    try {
      googleUser = await _googleSignIn.signIn();
    } catch (err, stackTrace) {
      await _crashlytics.recordError(err, stackTrace,
          context: "login error (signIn)");
      throw err;
    }

    ///NOTE: this can be null when the user cancel in the native modal
    if (googleUser == null) {
      return null;
    }

    try {
      googleAuth = await googleUser.authentication;
    } catch (err, stackTrace) {
      await _crashlytics.recordError(err, stackTrace,
          context: "login error (authentication)");
      throw err;
    }

    try {
      credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    } catch (err, stackTrace) {
      await _crashlytics.recordError(err, stackTrace,
          context: "login error (getCredential)");
      throw err;
    }

    return await _getAuthenticatedUserFromFirebase(credential,
        displayName: googleUser.displayName, photoUrl: googleUser.photoUrl);
  }

  Future<User> _getAuthenticatedUserFromFirebase(AuthCredential credential,
      {String displayName, String photoUrl}) async {
    final AuthResult authResult =
        await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    final FirebaseUser currentUser = await _firebaseAuth.currentUser();

    assert(user.uid == currentUser.uid);

    return User.fromFirebaseUser(
      user,
      displayName: displayName,
      photoUrl: photoUrl,
    );
  }

  Future<User> signInWithApple() async {
    if (!await SignInWithApple.isAvailable()) {
      throw AppleSignInNotSupportedException();
    }

    final appleAuth = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final AuthCredential credential =
        OAuthProvider(providerId: 'apple.com').getCredential(
      idToken: appleAuth.identityToken,
      accessToken: appleAuth.authorizationCode,
    );

    return await _getAuthenticatedUserFromFirebase(
      credential,
      displayName: "${appleAuth.givenName} ${appleAuth.familyName}",
    );
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<User> loginWithTestUser({test = 0, owner = false}) async {
    if (test == 1) {
      await this._firebaseAuth.signInWithEmailAndPassword(
          email: "test@test.com", password: "test123");
    }
    if (test == 2) {
      await this._firebaseAuth.signInWithEmailAndPassword(
          email: "test-two@test.com", password: "test123");
    }
    if (owner) {
      await this._firebaseAuth.signInWithEmailAndPassword(
          email: "test-owner@test.com", password: "test123");
    }
    var firebaseUser = await _firebaseAuth.currentUser();
    debugPrint("test firebaseUser is [$firebaseUser]");

    return User.fromFirebaseUser(firebaseUser);
  }
}

class AppleSignInNotSupportedException implements Exception {

  String _message;

  AppleSignInNotSupportedException([String message = 'Sign in with Apple is not supported for your version of IOS']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
