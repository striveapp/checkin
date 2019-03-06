import 'package:cloud_firestore/cloud_firestore.dart';
import 'team_provider.dart';

class TeamRepository {
  final _teamProvider = TeamProvider();

  Future<DocumentReference> addTeam(String teamName) => _teamProvider.addTeam(teamName);

  Stream<QuerySnapshot> getTeamList() => _teamProvider.getTeamList();
}