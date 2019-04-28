import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  //@TODO: Rename rank in grade
  Firestore _firestore = Firestore.instance;
  static const String path = 'users';

  createUser(String name, String email, String rank, bool isOwner) async {
    _firestore.collection(path).document(email).setData(
        {'name': name, 'email': email, 'rank': rank, 'isOwner': isOwner});
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
        .map((snapshot) => User(
              name: snapshot.data['name'],
              email: snapshot.data['email'],
              rank: snapshot.data['rank'],
              isOwner: snapshot.data['isOwner'],
            ));
  }
}
