import 'package:checkin/src/models/user.dart';

abstract class UserRepository {
  Stream<User> getUserByEmail(String email);

  Future<void> createUser(User newUser);

  Future<void> updateUserGrade(String userEmail, String newGrade);

  Future<void> updateUserName(String userEmail, String newName);

  Future<void> updateUserImageUrl(String userEmail, String newImageUrl);

  Future<void> updateUserFcmToken(String userEmail, String newToken);

  Future<void> updateSelectedGymId(String userEmail, String newSelectedGym);

  void setDefaultGym(String defaultGym);

}
