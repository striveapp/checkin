import 'package:checkin/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthProvider({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  Stream<String> getAuthState() {
    return _firebaseAuth.onAuthStateChanged
        .map((firebaseUser) => firebaseUser?.email);
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
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

  Future<User> loginWithTestUser(test, owner) async {
    if(test == 1) {
      await this._firebaseAuth.signInWithEmailAndPassword(email: "test@test.com", password: "test123");
    }
    if(test == 2) {
      await this._firebaseAuth.signInWithEmailAndPassword(email: "test-two@test.com", password: "test123");
    }
    if(owner) {
      await this._firebaseAuth.signInWithEmailAndPassword(email: "test-owner@test.com", password: "test123");
    }
    var firebaseUser = await _firebaseAuth.currentUser();
    debugPrint("test firebaseUser is [$firebaseUser]");

    return User.fromFirebaseUser(firebaseUser);
  }
}
