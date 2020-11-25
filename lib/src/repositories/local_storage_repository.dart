abstract class LocalStorageRepository {
  Stream<String> getReferredGymId();

  Future<void> setReferredGymId(String gymId);

  Future<void> removeReferredGym();

  Future<String> getUserEmail();

  Future<void> setUserEmail(String userEmail);

  Future<void> removeUserEmail();
}
