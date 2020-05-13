import 'package:checkin/src/models/user.dart';

import '../resources/user_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  Stream<User> getUserByEmail(String email) =>
      _userProvider.getUserByEmail(email);


  Stream<List<User>> getAllUsers() =>
      _userProvider.getAllUsers();

  Future<void> createUser(User newUser) => _userProvider.createUser(newUser);

  Future<void> updateUserGrade(User currentUser, String newGrade) =>
      _userProvider.updateUserGrade(currentUser, newGrade);

  Future<void> updateUserName(User currentUser, String newName) =>
      _userProvider.updateUserName(currentUser, newName);

  Future<void> updateUserFcmToken(User currentUser, String newToken) =>
      _userProvider.updateUserFcmToken(currentUser, newToken);

  Future<void> updateSelectedGymId(String userEmail, String newSelectedGym) =>
      _userProvider.updateSelectedGymId(userEmail, newSelectedGym);
}
