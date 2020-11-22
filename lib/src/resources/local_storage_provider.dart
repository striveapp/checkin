import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageProvider implements LocalStorageRepository {
  @override
  Future<void> setItem(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case int:
        await prefs.setInt(key, value);
        break;
      case String:
        await prefs.setString(key, value);
        break;
      case bool:
        await prefs.setBool(key, value);
        break;
      case double:
        await prefs.setDouble(key, value);
        break;
      default:
        throw "Is not possible to store values of type: [${value.runtimeType}] in the local storage";
    }
  }

  @override
  Future<dynamic> getItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.get(key);
  }

  @override
  Future<bool> containsItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.containsKey(key);
  }
}
