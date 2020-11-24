abstract class LocalStorageRepository {
  Stream<String> getReferredGymId();

  Future<void> setReferredGymId(String gymId);

  Future<void> removeReferredGym();
}
