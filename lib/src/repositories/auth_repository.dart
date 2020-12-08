import 'package:checkin/src/models/user.dart';

abstract class AuthRepository {
  Stream<User> getAuthState();

  Future<String> getIdToken();

  Future<void> signOut();

  Future<User> signInWithGoogle();

  Future<User> signInWithApple();

  Future<void> signInPasswordless(String userEmail);

  Future<User> completeSignInPasswordless(String userEmail, Uri emailLink);

  Future<User> loginWithTestUser({test = 0, owner = false, master = false});
}