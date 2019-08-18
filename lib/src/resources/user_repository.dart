import 'package:checkin/src/models/user.dart';

import 'user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  createUser(
          String displayName, String email, String imageUrl, int counter, String rank, bool isOwner) =>
      _userProvider.createUser(displayName, email, imageUrl, counter, rank, isOwner);

  Stream<User> getUserByEmail(String email) => _userProvider.getUserByEmail(email);

  Future<bool> isNewUser(String email) => _userProvider.isNewUser(email);

  updateUserGrade(User currentUser, String grade) => _userProvider.updateUserGrade(currentUser, grade);

  updateUserName(User currentUser, String name) => _userProvider.updateUserName(currentUser, name);

  updateUserFcmToken(User currentUser, String token) => _userProvider.updateUserFcmToken(currentUser, token);

  incrementUserCounter(String email) => _userProvider.incrementUserCounter(email);


}
