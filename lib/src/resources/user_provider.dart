import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  Firestore _firestore = Firestore.instance;

  Future<User> createUser(String name, String email, String rank, bool isOwner) async {
    return await _firestore.collection('users').add({
      'name': name,
      'email': email,
      'rank': rank,
      'isOwner': isOwner
    }).then((val) {
      print(val);
      return User(
          name: "test",
          email: "test@test",
          rank: "white",
          isOwner: false
      );
    });
  }

  Future<User> getUserByEmail(String email) async {
    var documents = await _firestore.collection('users')
        .where("email", isEqualTo: email)
        .getDocuments();

    return User(
      name: documents.documents.first.data['name'],
      email: documents.documents.first.data['email'],
      rank: documents.documents.first.data['rank'],
      isOwner: documents.documents.first.data['isOwner'],
    );
  }

  //@TODO: this might be trashable
  Future<bool> isNewUser(String email) async {
    var documents = await _firestore.collection('users')
        .where("email", isEqualTo: email)
       .getDocuments();

    return documents.documents.isEmpty;
  }

  Future<User> update(String grade) async {
    return null;
  }
}
