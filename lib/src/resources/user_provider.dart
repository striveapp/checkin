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
              isDev: user.data['isDev'] ?? false,
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

  // todo a volte rompe i test perchè non fa in tempo ad aggiornarsi
  incrementUserCounter(String email) {
    _firestore
        .collection(path)
        .document(email)
        .updateData({"counter": FieldValue.increment(1)});
  }
}
