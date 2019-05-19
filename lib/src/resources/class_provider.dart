import 'package:checkin/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ClassProvider {
  static const String path = 'class';

  //@TODO: use only a single instance of firestore
  Firestore _firestore = Firestore.instance;

  Stream<List<User>> getClassAttendees() {
    return _firestore
        .collection(path)
        .snapshots()
        .map((snapshot) => snapshot.documents.map((doc) {
              return User(
                name: doc.data['name'],
                email: doc.data['email'],
                imageUrl: doc.data['imageUrl'],
                counter: doc.data['counter'],
                rank: doc.data['rank'],
                isOwner: doc.data['isOwner'],
              );
            }).toList());
  }

  Future<void> attendClass(User attendee) async {
    debugPrint("attendClass [$attendee]");
    await _firestore.collection(path).add({
      'name': attendee.name,
      'imageUrl': attendee.imageUrl,
      'grade': attendee.rank,
      'email': attendee.email,
      'counter': attendee.counter
    });
  }

  Future<void> clearClass() async {
    var res = await _firestore.collection(path).getDocuments();

    for (DocumentSnapshot ds in res.documents) {
      ds.reference.delete();
    }
  }
}
