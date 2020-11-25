import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageProvider implements LocalStorageRepository {
  static final String REFERRED_GYM_ID = "referredGym";
  static final String USER_EMAIL = "userEmail";
  final rxPrefs = RxSharedPreferences(SharedPreferences.getInstance());

  Future<void> setReferredGymId(String gymId) async {
    await rxPrefs.setString(
      REFERRED_GYM_ID,
      gymId,
    );
  }

  Stream<String> getReferredGymId() {
    return rxPrefs
        .getStringStream(REFERRED_GYM_ID)
        .skipWhile((element) => element == null);
  }

  Future<void> removeReferredGym() async {
    await rxPrefs.remove(REFERRED_GYM_ID);
  }

  @override
  Future<String> getUserEmail() async {
    return rxPrefs.getString(USER_EMAIL);
  }

  @override
  Future<void> removeUserEmail() async {
    await rxPrefs.remove(USER_EMAIL);
  }

  @override
  Future<void> setUserEmail(String userEmail) async {
    await rxPrefs.setString(
      USER_EMAIL,
      userEmail,
    );
  }
}
