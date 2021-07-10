// @dart=2.9

import 'dart:convert';

import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart' hide Logger;
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageProvider implements LocalStorageRepository {
  static final String REFERRED_GYM_ID = "referredGym";
  static final String USER_EMAIL = "userEmail";
  static final String USER = "user";
  static final String GYM = "gym";

  final rxPrefs = RxSharedPreferences(SharedPreferences.getInstance());

  Future<void> setReferredGymId(String gymId) async {
    await rxPrefs.setString(
      REFERRED_GYM_ID,
      gymId,
    );
  }

  Stream<String> getReferredGymId() {
    return rxPrefs.getStringStream(REFERRED_GYM_ID).skipWhile((element) => element == null);
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

  @override
  Stream<User> getUser() => rxPrefs.getStringStream(USER).map((userJson) {
        var decodedUser = json.decode(userJson);
        var userBirthday = decodedUser["birthday"];
        return User.fromJson(decodedUser)
            .copyWith(birthday: userBirthday != null ? DateTime.parse(userBirthday) : null);
      });

  @override
  Future<void> setUser(User user) async {
    var jsonUser = user.toJson();
    jsonUser["birthday"] = user.birthday?.toIso8601String();
    await rxPrefs.setString(
      USER,
      json.encode(jsonUser),
    );
  }

  @override
  Stream<Gym> getGym() {
    return rxPrefs.getStringStream(GYM).map((gymJson) => Gym.fromJson(json.decode(gymJson)));
  }

  @override
  Future<void> setGym(Gym gym) async {
    await rxPrefs.setString(
      GYM,
      json.encode(gym.toJson()),
    );
  }
}
