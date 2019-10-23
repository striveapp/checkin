import 'dart:io';

import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserProvider {
  //@TODO: Rename rank in grade
  Firestore _firestore = Firestore.instance;
  static const String path = 'users';

  createUser(String name, String email, String imageUrl, int counter,
      String rank, bool isOwner) async {
    _firestore.collection(path).document(email).setData({
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
    }, merge: true );
  }

  updateUserGrade(User currentUser, String grade) async {
    _firestore
        .collection(path)
        .document(currentUser.email)
        .updateData({"rank": grade});
  }

  updateUserName(User currentUser, String name) async {
    _firestore
        .collection(path)
        .document(currentUser.email)
        .updateData({"name": name});
  }

  updateUserFcmToken(User currentUser, String fcmToken) async {
    var tokens = _firestore
        .collection(path)
        .document(currentUser.email)
        .collection("tokens")
        .document(fcmToken);

    await tokens.setData({
      'token': fcmToken,
      'createdAt': FieldValue.serverTimestamp(), // optional
      'platform': Platform.operatingSystem // optional
    });

  }

  Stream<User> getUserByEmail(String email) {
    return _firestore
        .collection(path)
        .document(email)
        .snapshots()
        .map((user) => User(
              name: user.data['name'],
              email: user.data['email'],
              imageUrl: user.data['imageUrl'],
              counter: user.data['counter'] ?? 0,
              rank: user.data['rank'],
              isOwner: user.data['isOwner'] ?? false,
            ));
  }

  //@TODO: this might be trashable
  Future<bool> isNewUser(String email) async {
    debugPrint("isNewUser started");

    var user = await _firestore
        .collection(path)
        .document(email)
        .get();

    if( ! user.exists ) {
      return true;
    }

    return user.data['rank'] == null;
  }

  Future<void> incrementUserCounter(String email) async {
    await _firestore
        .collection(path)
        .document(email)
        .updateData({"counter": FieldValue.increment(1)});
  }
}
