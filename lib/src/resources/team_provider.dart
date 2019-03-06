import 'package:cloud_firestore/cloud_firestore.dart';

class TeamProvider {
  Firestore _firestore = Firestore.instance;

  Future<DocumentReference> addTeam(String teamName) async {
    return await _firestore
        .collection('teams')
        .add({'name': teamName });
  }

  Stream<QuerySnapshot> getTeamList() {
    return _firestore.collection('teams').snapshots();
  }
}
