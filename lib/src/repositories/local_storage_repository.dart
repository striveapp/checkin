import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';

abstract class LocalStorageRepository {
  Stream<String> getReferredGymId();

  Future<void> setReferredGymId(String gymId);

  Future<void> removeReferredGym();

  Future<String> getUserEmail();

  Future<void> setUserEmail(String userEmail);

  Future<void> removeUserEmail();

  Future<void> setUser(User user);

  Stream<User> getUser();

  Future<void> setGym(Gym gym);

  Stream<Gym> getGym();
}
