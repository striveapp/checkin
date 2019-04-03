import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  //@TODO: this should be instanciated only ones?
  Firestore _firestore = Firestore.instance;

  Future<User> createUser(String name, String email, String rank, bool isOwner) async {
    return _firestore.collection('users').add({
      'name': name,
      'email': email,
      'rank': rank,
      'isOwner': isOwner
    }).then((val) {
      print(val);
      return User("test", "test@test","white", false);
    });
  }

  Stream<bool> isNewUser(String email) {
    return _firestore.collection("users")
        .where("email", isEqualTo: email)
        .snapshots()
        .map((snapshot) => snapshot.documents.isEmpty);
  }
}
