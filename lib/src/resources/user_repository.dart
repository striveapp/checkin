import 'package:checkin/src/models/user.dart';
import 'user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  Future<User> createUser(
          String displayName, String email, String rank, bool isOwner) =>
      _userProvider.createUser(displayName, email, rank, isOwner);

  Stream<User> getUserByEmail(String email) => _userProvider.getUserByEmail(email);

  Future<bool> isNewUser(String email) => _userProvider.isNewUser(email);

  Future<User> update(String grade) => _userProvider.update(grade);

}
