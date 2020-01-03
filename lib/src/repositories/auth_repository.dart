import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/auth_provider.dart';

class AuthRepository {
  final _authProvider = AuthProvider();

  Stream<String> getAuthState() => _authProvider.getAuthState();

  Future<void> signOut() => _authProvider.signOut();

  Future<User> signInWithGoogle() => _authProvider.signInWithGoogle();

  Future<User> loginWithTestUser({test=0, owner=false}) => _authProvider.loginWithTestUser(test, owner);

}