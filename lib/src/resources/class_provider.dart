import 'package:cloud_firestore/cloud_firestore.dart';

class ClassProvider {
  Firestore _firestore = Firestore.instance;

  Future<List<String>> getClassAttendees() async {
    var res = await _firestore.collection('class').getDocuments();

    return res.documents.map<String>((document) => document.data['name']).toList();
  }

  Future<void> attendClass(String name) async {
    await _firestore.collection('class').add({'name': name });
  }

  Future<void> clearClass() async {
    var res = await _firestore.collection('class').getDocuments();

    for (DocumentSnapshot ds in res.documents){
      ds.reference.delete();
    }
  }
}
