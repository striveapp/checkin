import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

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
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    ///NOTE: this can be null when the user cancel in the native modal
    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    var firebaseUser = await _firebaseAuth.currentUser();

    return User.fromFirebaseUser(firebaseUser);
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
