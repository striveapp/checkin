import 'package:checkin/src/models/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeamProvider {
  Firestore _firestore = Firestore.instance;

  Future<DocumentReference> addTeam(String teamName) async {
    return await _firestore
        .collection('teams')
        .add({'name': teamName });
  }

  //@TODO: fix this method to handle deletions properly
  Stream<List<Team>> getTeamList() {
    return _firestore.collection('teams').snapshots()
        .map((snapshot) => snapshot.documents.map((document) => Team(document.data['name'])).toList());
  }
}
