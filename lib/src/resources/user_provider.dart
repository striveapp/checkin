import 'dart:io';

import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/stats_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider implements UserRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StatsProvider statsProvider = StatsProvider();
  static const String path = 'users';

  Stream<User> getUserByEmail(String email) => _firestore
      .collection(path)
      .doc(email)
      .snapshots()
      .map((user) => toUser(user));

  User toUser(DocumentSnapshot user) {
    final data = user.data();
    return User(
        name: data['name'],
        email: data['email'],
        imageUrl: data['imageUrl'],
        // TODO: remove rank when all users have grade https://trello.com/c/d26R05mY
        grade: ((data['grade'] ?? data['rank']) as String)?.toGrade(),
        isOwner: data['isOwner'] ?? false,
        hasActivePayments: data['hasActivePayments'],
        selectedGymId: data['selectedGymId']);
  }

  Future<void> createUser(User newUser, String referredGym) async {
    var userData = {
      'name': newUser.name,
      'email': newUser.email,
      'imageUrl': newUser.imageUrl,
    };

    if(referredGym != null) {
      userData = {
        ...userData,
        'selectedGymId': referredGym
      };
    }

    await _firestore
        .collection(path)
        .doc(newUser.email)
        .set(userData, SetOptions(merge: true));
  }

  Future<void> updateGrade(String userEmail, Grade newGrade) async {
    await _firestore
        .collection(path)
        .doc(userEmail)
        .update({"grade": newGrade.name.toLowerCase()});
  }

  Future<void> updateUserName(String userEmail, String newName) async {
    await _firestore.collection(path).doc(userEmail).update({"name": newName});
  }

  Future<void> updateUserFcmToken(String userEmail, String newFcmToken) async {
    var tokens = _firestore
        .collection(path)
        .doc(userEmail)
        .collection("tokens")
        .doc(newFcmToken);

    await tokens.set({
      'token': newFcmToken,
      'createdAt': FieldValue.serverTimestamp(), // optional
      'platform': Platform.operatingSystem // optional
    });
  }

  Future<void> updateSelectedGymId(
      String userEmail, String newSelectedGym) async {
    await _firestore
        .collection(path)
        .doc(userEmail)
        .update({"selectedGymId": newSelectedGym});
  }

  Future<void> updateReferredGymId(
      String userEmail, String referredGymId) async {
    await _firestore
        .collection(path)
        .doc(userEmail)
        .update({"selectedGymId": referredGymId});
  }

  Future<void> updateUserImageUrl(String userEmail, String newImageUrl) async {
    await _firestore
        .collection(path)
        .doc(userEmail)
        .update({"imageUrl": newImageUrl});
  }

  Future<void> updateUserVersion(String userEmail, String newVersion) async {
    await _firestore
        .collection(path)
        .doc(userEmail)
        .update({"appVersion": newVersion});
  }
}
