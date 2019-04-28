import 'package:checkin/src/models/user.dart';
import 'user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  createUser(
          String displayName, String email, String rank, bool isOwner) =>
      _userProvider.createUser(displayName, email, rank, isOwner);

  Stream<User> getUserByEmail(String email) => _userProvider.getUserByEmail(email);

  updateUserGrade(User currentUser, String grade) => _userProvider.updateUserGrade(currentUser, grade);

}
