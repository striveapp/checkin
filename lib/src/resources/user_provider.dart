import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  Firestore _firestore = Firestore.instance;
  static const String path = 'users';

  Future<User> createUser(
      String name, String email, String rank, bool isOwner) async {
    return await _firestore.collection(path).add({
      'name': name,
      'email': email,
      'rank': rank,
      'isOwner': isOwner
    }).then((val) {
      print(val);
      return User(
          name: "test", email: "test@test", rank: "white", isOwner: false);
    });
  }

  Stream<User> getUserByEmail(String email) {
    return _firestore
        .collection(path)
        .where("email", isEqualTo: email)
        .snapshots()
        .map((snapshot) {
      var doc = snapshot.documents.first;
      return User(
        name: doc.data['name'],
        email: doc.data['email'],
        rank: doc.data['rank'],
        isOwner: doc.data['isOwner'],
      );
    });
  }

  //@TODO: this might be trashable
  Future<bool> isNewUser(String email) async {
    var documents = await _firestore
        .collection(path)
        .where("email", isEqualTo: email)
        .getDocuments();

    return documents.documents.isEmpty;
  }

  Future<User> update(String grade) async {
    return null;
  }
}
