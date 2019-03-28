import 'package:checkin/src/models/user.dart';
import 'user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  Future<User> createUser(
          String displayName, String email, String rank, bool canCreateTeams) =>
      _userProvider.createUser(displayName, email, rank, canCreateTeams);

  Stream<bool> isNewUser(String email) => _userProvider.isNewUser(email);
}
