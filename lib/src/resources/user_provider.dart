import 'dart:async';
import 'dart:io';

import 'package:checkin/src/config.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/stats_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pub_semver/pub_semver.dart';

import 'local_storage_provider.dart';

class UserProvider implements UserRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  LocalStorageProvider _localStorageProvider = LocalStorageProvider();

  StatsProvider statsProvider = StatsProvider();
  static const String path = 'users';

  Stream<User> getUserByEmail(String email) => _firestore
      .collection(path)
      .doc(email)
      .snapshots()
      .where((snapshot) => snapshot.exists)
      .map((user) => _toUser(user.data()));

  @override
  Stream<User> subscribeToUser(String email) {
    return _firestore
        .collection(path)
        .doc(email)
        .snapshots()
        .where((snapshot) => snapshot.exists)
        .map((user) => toUser(user))
        .map((user) {
          _localStorageProvider.setUser(user);
          return user;
        });
  }

  @override
  Stream<User> getUser() => _localStorageProvider.getUser();

  User toUser(DocumentSnapshot user) {
    final data = user.data();
    return User(
        name: data['name'],
        email: data['email'],
        imageUrl: data['imageUrl'],
        // TODO: remove rank when all users have grade https://trello.com/c/d26R05mY
        knownGymIds: List<String>.from(data['knownGymIds'] ?? []),
        grade: ((data['grade'] ?? data['rank']) as String)?.toGrade(),
        isOwner: data['isOwner'] ?? false,
        hasActivePayments: data['hasActivePayments'] ?? false,
        selectedGymId: data['selectedGymId']);
  }

  User _toUser(Map<String, dynamic> user) {
    user.putIfAbsent("imageUrl", () => DEFAULT_USER_IMAGE_URL);
    return User.fromJson(user);
  }

  Future<void> createUser(User newUser) async {
    var userData = {
      'name': newUser.name,
      'email': newUser.email,
      'imageUrl': newUser.imageUrl,
    };

    await _firestore.collection(path).doc(newUser.email).set(userData, SetOptions(merge: true));
  }

  Future<void> updateGrade(String userEmail, Grade newGrade) async {
    await _firestore.collection(path).doc(userEmail).update({"grade": newGrade.name.toLowerCase()});
  }

  Future<void> updateUserName(String userEmail, String newName) async {
    await _firestore.collection(path).doc(userEmail).update({"name": newName});
  }

  Future<void> updateUserFcmToken(String userEmail, String newFcmToken) async {
    var tokens = _firestore.collection(path).doc(userEmail).collection("tokens").doc(newFcmToken);

    await tokens.set({
      'token': newFcmToken,
      'createdAt': FieldValue.serverTimestamp(), // optional
      'platform': Platform.operatingSystem // optional
    });
  }

  Future<void> updateSelectedGymId(String userEmail, String newSelectedGym) async {
    await _firestore.collection(path).doc(userEmail).update({"selectedGymId": newSelectedGym});
  }

  Future<void> updateKnownGymIds(String userEmail, String newGymId) async {
    await _firestore.collection(path).doc(userEmail).update({
      "knownGymIds": FieldValue.arrayUnion([newGymId])
    });
  }

  Future<void> updateUserImageUrl(String userEmail, String newImageUrl) async {
    await _firestore.collection(path).doc(userEmail).update({"imageUrl": newImageUrl});
  }

  Future<void> updateUserAppVersion(String userEmail, Version newVersion) async {
    await _firestore.collection(path).doc(userEmail).update({"appVersion": newVersion.toString()});
  }

  @override
  Future<bool> isFirstLogin(String email) async {
    var documentSnapshot = await _firestore.collection(path).doc(email).get();
    return !documentSnapshot.exists;
  }
}
