import 'package:checkin/src/models/user.dart';

import '../resources/user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  Stream<User> getUserByEmail(String email) =>
      _userProvider.getUserByEmail(email);


  Stream<List<User>> getAllUsers() =>
      _userProvider.getAllUsers();

  Future<void> createUser(User newUser) => _userProvider.createUser(newUser);

  Future<void> updateUserGrade(String userEmail, String newGrade) =>
      _userProvider.updateUserGrade(userEmail, newGrade);

  Future<void> updateUserName(String userEmail, String newName) =>
      _userProvider.updateUserName(userEmail, newName);

  Future<void> updateUserImageUrl(String userEmail, String newImageUrl) =>
      _userProvider.updateUserImageUrl(userEmail, newImageUrl);

  Future<void> updateUserFcmToken(String userEmail, String newToken) =>
      _userProvider.updateUserFcmToken(userEmail, newToken);

  Future<void> updateSelectedGymId(String userEmail, String newSelectedGym) =>
      _userProvider.updateSelectedGymId(userEmail, newSelectedGym);
}
