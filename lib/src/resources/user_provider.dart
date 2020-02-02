import 'dart:io';

import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  Firestore _firestore = Firestore.instance;
  static const String path = 'users';

  Stream<User> getUserByEmail(String email) => _firestore
      .collection(path)
      .document(email)
      .snapshots()
      .map((user) => User(
    name: user.data['name'],
    email: user.data['email'],
    imageUrl: user.data['imageUrl'],
    counter: user.data['counter'] ?? 0,
    // TODO: remove rank when all users have grade
    grade: ((user.data['grade'] ?? user.data['rank']) as String).toGrade(),
    isOwner: user.data['isOwner'] ?? false,
    hasActivePayments: user.data['hasActivePayments'] ?? false,
  ));

  Future<void> createUser(User newUser) async {
    await _firestore.collection(path).document(newUser.email).setData({
      'name': newUser.name,
      'email': newUser.email,
      'imageUrl': newUser.imageUrl,
    }, merge: true );
  }

  Future<void> updateUserGrade(User currentUser, String newGrade) async {
    await _firestore
        .collection(path)
        .document(currentUser.email)
        .updateData({"grade": newGrade});
  }

  Future<void> updateUserName(User currentUser, String newName) async {
    await _firestore
        .collection(path)
        .document(currentUser.email)
        .updateData({"name": newName});
  }

  Future<void> updateUserFcmToken(User currentUser, String newFcmToken) async {
    var tokens = _firestore
        .collection(path)
        .document(currentUser.email)
        .collection("tokens")
        .document(newFcmToken);

    await tokens.setData({
      'token': newFcmToken,
      'createdAt': FieldValue.serverTimestamp(), // optional
      'platform': Platform.operatingSystem // optional
    });
  }
}
