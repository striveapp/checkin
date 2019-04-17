import 'package:cloud_firestore/cloud_firestore.dart';

class ClassProvider {
  static const String path = 'class';

  //@TODO: use only a single instance of firestore
  Firestore _firestore = Firestore.instance;

  Stream<List<String>> getClassAttendees() {
    return _firestore.collection(path).snapshots()
        .map((snapshot) => snapshot.documents
        .map((doc) => doc.data['name'] as String)
        .toList());
  }

  Future<void> attendClass(String name) async {
    await _firestore.collection(path).add({'name': name });
  }

  Future<void> clearClass() async {
    var res = await _firestore.collection(path).getDocuments();

    for (DocumentSnapshot ds in res.documents){
      ds.reference.delete();
    }
  }
}
