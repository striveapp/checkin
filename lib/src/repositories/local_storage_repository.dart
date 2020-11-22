abstract class LocalStorageRepository {
  Future<void> setItem(String key, dynamic value);

  Future<dynamic> getItem(String key);

  Future<bool> containsItem(String key);
}
