import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';

abstract class UserRepository {
  Stream<User> getUserByEmail(String email);

  Future<void> createUser(User newUser);

  Future<void> updateGrade(String userEmail, Grade newGrade);

  Future<void> updateUserName(String userEmail, String newName);

  Future<void> updateUserImageUrl(String userEmail, String newImageUrl);

  Future<void> updateUserFcmToken(String userEmail, String newToken);

  Future<void> updateSelectedGymId(String userEmail, String newSelectedGym);

  Future<void> updateUserVersion(String userEmail, String newVersion);

  void setDefaultGym(String defaultGym);

}
