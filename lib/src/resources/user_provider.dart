import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  //@TODO: Rename rank in grade
  Firestore _firestore = Firestore.instance;
  static const String path = 'users';

  createUser(
      String name, String email, String imageUrl, int counter, String rank, bool isOwner) async {
    _firestore.collection(path).document(email).setData({
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'counter': counter,
      'rank': rank,
      'isOwner': isOwner
    });
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
        .where("email", isEqualTo: email)
        .snapshots()
        .map((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var doc = snapshot.documents.first;
        return User(
          name: doc.data['name'],
          email: doc.data['email'],
          imageUrl: doc.data['imageUrl'],
          counter: doc.data['counter'],
          rank: doc.data['rank'],
          isOwner: doc.data['isOwner'],
          isDev: doc.data['isDev'] ?? false,
        );
      }
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

  incrementUserCounter(User currentUser) {
    _firestore
        .collection(path)
        .document(currentUser.email)
        .updateData({"counter": currentUser.counter + 1});
  }
}
