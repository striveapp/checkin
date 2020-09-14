import 'dart:io';

import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:checkin/src/resources/stats_provider.dart';

class UserProvider implements UserRepository {
  Firestore _firestore = Firestore.instance;
  StatsProvider statsProvider = StatsProvider();
  static const String path = 'users';
  final String defaultGym;

  UserProvider({this.defaultGym});

  Stream<User> getUserByEmail(String email) => _firestore
      .collection(path)
      .document(email)
      .snapshots()
      .map((user) => toUser(user));

  User toUser(DocumentSnapshot user) {
    return User(
        name: user.data['name'],
        email: user.data['email'],
        imageUrl: user.data['imageUrl'],
        // TODO: remove rank when all users have grade https://trello.com/c/d26R05mY
        grade:
        ((user.data['grade'] ?? user.data['rank']) as String)?.toGrade(),
        isOwner: user.data['isOwner'] ?? false,
        hasActivePayments: user.data['hasActivePayments'],
        selectedGymId: user.data['selectedGymId']
    );
  }

  Future<void> createUser(User newUser) async {
    var userData = {
      'name': newUser.name,
      'email': newUser.email,
      'imageUrl': newUser.imageUrl,
    };

    if( defaultGym != null ) {
      userData['selectedGymId'] = defaultGym;
    }

    await _firestore.collection(path).document(newUser.email).setData(userData, merge: true);
  }

  Future<void> updateUserGrade(String userEmail, String newGrade) async {
    await _firestore
        .collection(path)
        .document(userEmail)
        .updateData({"grade": newGrade});
  }

  Future<void> updateUserName(String userEmail, String newName) async {
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
