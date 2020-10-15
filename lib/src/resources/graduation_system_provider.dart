import 'package:checkin/src/models/graduation_system.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GraduationSystemProvider implements GraduationSystemRepository {
  Firestore _firestore = Firestore.instance;
  static const String gymPath = "gyms";
  static const String path = 'graduation_system';

  @override
  Stream<GraduationSystem> getGraduationSystem(String gymId) {
    return _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document("bjj")
        .snapshots()
        .where((snapshot) => snapshot.exists)
        .map((graduationSystem) => GraduationSystem(system: toSystem(graduationSystem.data)));
  }

  Map<String, GraduationRequirement> toSystem(Map<String, dynamic> firebaseData) {
    return firebaseData.map((key, value) => MapEntry(key, toGraduationRequirement(key, value)));
  }

  GraduationRequirement toGraduationRequirement(String grade, dynamic graduationRequirement) {
    return GraduationRequirement(grade: grade, forNextLevel: (graduationRequirement["forNextLevel"] as num).toDouble());
  }
}