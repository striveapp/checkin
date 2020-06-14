import 'dart:io';

import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:checkin/src/resources/stats_provider.dart';

class UserProvider {
  Firestore _firestore = Firestore.instance;
  StatsProvider statsProvider = StatsProvider();
  static const String path = 'users';

  Stream<User> getUserByEmail(String email) => _firestore
      .collection(path)
      .document(email)
      .snapshots()
      .map((user) => User(
            name: user.data['name'],
            email: user.data['email'],
            imageUrl: user.data['imageUrl'],
            // TODO: remove rank when all users have grade https://trello.com/c/d26R05mY
            grade:
                ((user.data['grade'] ?? user.data['rank']) as String)?.toGrade(),
            isOwner: user.data['isOwner'] ?? false,
            hasActivePayments: user.data['hasActivePayments'] ?? false,
            selectedGymId: user.data['selectedGymId']
          ));

  Stream<List<User>> getAllUsers() => _firestore
      .collection(path)
      .snapshots()
      .map((snapshot) => snapshot.documents
          .map((doc) => User(
                name: doc.data['name'],
                email: doc.data['email'],
                imageUrl: doc.data['imageUrl'],
                // TODO: remove rank when all users have grade https://trello.com/c/d26R05mY
                grade: ((doc.data['grade'] ?? doc.data['rank']) as String)
                    .toGrade(),
                isOwner: doc.data['isOwner'] ?? false,
                hasActivePayments: doc.data['hasActivePayments'] ?? false,
              ))
          .toList());

  Future<void> createUser(User newUser) async {
    await _firestore.collection(path).document(newUser.email).setData({
      'name': newUser.name,
      'email': newUser.email,
      'imageUrl': newUser.imageUrl,
    }, merge: true);
  }

  Future<void> updateUserGrade(String userEmail, String newGrade) async {
    await _firestore
        .collection(path)
        .document(userEmail)
        .updateData({"grade": newGrade});
  }

  Future<void> updateUserName(String userEmail, String newName) async {
    print("here");
    await _firestore
        .collection(path)
        .document(userEmail)
        .updateData({"name": newName});
  }

  Future<void> updateUserFcmToken(String userEmail, String newFcmToken) async {
    var tokens = _firestore
        .collection(path)
        .document(userEmail)
        .collection("tokens")
        .document(newFcmToken);

    await tokens.setData({
      'token': newFcmToken,
      'createdAt': FieldValue.serverTimestamp(), // optional
      'platform': Platform.operatingSystem // optional
    });
  }

  Future<void> updateSelectedGymId(String userEmail, String newSelectedGym) async {
    await _firestore
        .collection(path)
        .document(userEmail)
        .updateData({"selectedGymId": newSelectedGym});
  }

  Future<void> updateUserImageUrl(String userEmail, String newImageUrl) async {
    await _firestore
        .collection(path)
        .document(userEmail)
        .updateData({"imageUrl": newImageUrl});
  }
}
