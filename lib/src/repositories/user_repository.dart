import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:pub_semver/pub_semver.dart';

abstract class UserRepository {
  Stream<User> getUserByEmail(String email);

  Future<void> createUser(User newUser);

  Future<void> updateGrade(String userEmail, Grade newGrade);

  Future<void> updateUserName(String userEmail, String newName);

  Future<void> updateUserImageUrl(String userEmail, String newImageUrl);

  Future<void> updateUserFcmToken(String userEmail, String newToken);

  Future<void> updateSelectedGymId(String userEmail, String newSelectedGym);

  Future<void> updateKnownGymIds(String userEmail, String newGymId);

  Future<void> updateUserAppVersion(String userEmail, Version newVersion);
}
