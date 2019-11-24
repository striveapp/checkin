import 'package:checkin/src/models/user.dart';

import 'user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  Stream<User> getUserByEmail(String email) =>
      _userProvider.getUserByEmail(email);

  Future<void> createUser(User newUser) => _userProvider.createUser(newUser);

  Future<void> updateUserGrade(User currentUser, String newGrade) =>
      _userProvider.updateUserGrade(currentUser, newGrade);

  Future<void> updateUserName(User currentUser, String newName) =>
      _userProvider.updateUserName(currentUser, newName);

  Future<void> updateUserFcmToken(User currentUser, String newToken) =>
      _userProvider.updateUserFcmToken(currentUser, newToken);
  
  Future<void> updateUserIsFirstLogin(User currentUser, bool newIsFirstLogin) =>
      _userProvider.updateUserIsFirstLogin(currentUser, newIsFirstLogin);
}
