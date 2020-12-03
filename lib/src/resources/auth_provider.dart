import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../app_config.dart';

class AuthProvider implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  final AppConfig appConfig;

  AuthProvider({
    @required AppConfig this.appConfig,
  });

  Stream<User> getAuthState() {
    return _firebaseAuth
        .authStateChanges()
        .map((firebaseUser) => User.fromFirebaseUser(firebaseUser));
  }

  Future<String> getIdToken() async => await _firebaseAuth.currentUser.getIdToken();

  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleUser;
    GoogleSignInAuthentication googleAuth;
    OAuthCredential credential;

    try {
      googleUser = await _googleSignIn.signIn();
    } catch (err, stackTrace) {
      await _crashlytics.recordError(err, stackTrace, reason: "login error (signIn)");
      throw err;
    }

    ///NOTE: this can be null when the user cancel in the native modal
    if (googleUser == null) {
      return null;
    }

    try {
      googleAuth = await googleUser.authentication;
    } catch (err, stackTrace) {
      await _crashlytics.recordError(err, stackTrace, reason: "login error (authentication)");
      throw err;
    }

    try {
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    } catch (err, stackTrace) {
      await _crashlytics.recordError(err, stackTrace, reason: "login error (getCredential)");
      throw err;
    }

    return await _getAuthenticatedUserFromFirebase(credential,
        displayName: googleUser.displayName, photoUrl: googleUser.photoUrl);
  }

  Future<User> _getAuthenticatedUserFromFirebase(OAuthCredential credential,
      {String displayName, String photoUrl}) async {
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    final user = userCredential.user;

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

    final OAuthCredential credential = OAuthProvider('apple.com').credential(
      idToken: appleAuth.identityToken,
      accessToken: appleAuth.authorizationCode,
    );

    return await _getAuthenticatedUserFromFirebase(
      credential,
      displayName: "${appleAuth.givenName} ${appleAuth.familyName}",
    );
  }

  @override
  Future<void> signInPasswordless(String userEmail) {
    ActionCodeSettings actionCodeSettings = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be in the authorized domains list in the Firebase Console.
      // todo https://trello.com/c/f01A8c2R
        url: 'https://checkin-test-fba3d.web.app',
        handleCodeInApp: true,
        iOSBundleId: appConfig.appUniqueIdentifier,
        androidPackageName: appConfig.appUniqueIdentifier,
        androidInstallApp: true,
        // todo should be release version of passwordless auth
        androidMinimumVersion: '1.0.0',
        dynamicLinkDomain: appConfig.dynamicLinkDomain);
    return _firebaseAuth.sendSignInLinkToEmail(
        email: userEmail, actionCodeSettings: actionCodeSettings);
  }

  @override
  Future<void> completeSignInPasswordless(String userEmail, Uri emailLink) {
    if(_firebaseAuth.currentUser == null) {
      return _firebaseAuth.signInWithEmailLink(email: userEmail, emailLink: emailLink.toString());
    } else {
      throw UserAlreadyLoggedInException("user [$userEmail] already logged in");
    }

  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.disconnect(),
    ]);
  }

  @override
  Future<User> loginWithTestUser({test = 0, owner = false, master = false}) async {
    if (test == 1) {
      await this
          ._firebaseAuth
          .signInWithEmailAndPassword(email: "test@test.com", password: "test123");
    }
    if (test == 2) {
      await this
          ._firebaseAuth
          .signInWithEmailAndPassword(email: "test-two@test.com", password: "test123");
    }
    if (owner) {
      await this
          ._firebaseAuth
          .signInWithEmailAndPassword(email: "test-owner@test.com", password: "test123");
    }
    if (master) {
      await this
          ._firebaseAuth
          .signInWithEmailAndPassword(email: "test-master@test.com", password: "test123");
    }
    var firebaseUser = _firebaseAuth.currentUser;
    debugPrint("test firebaseUser is [$firebaseUser]");

    return User.fromFirebaseUser(firebaseUser);
  }
}

class AppleSignInNotSupportedException implements Exception {
  String _message;

  AppleSignInNotSupportedException(
      [String message = 'Sign in with Apple is not supported for your version of IOS']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class UserAlreadyLoggedInException implements Exception {
  String _message;

  UserAlreadyLoggedInException(String message) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
