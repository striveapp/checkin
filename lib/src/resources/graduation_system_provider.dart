import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/graduation_system.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GraduationSystemProvider implements GraduationSystemRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String gymPath = "gyms";
  static const String path = 'graduation_system';

  @override
  Stream<GraduationSystem> getGraduationSystem(String gymId, Grade grade) {
    final String gradeName = grade.name.toLowerCase();
    Logger.log.i("Retrieve graduationSystem for gym [$gymId] and grade [$grade]");

    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(gradeName)
        .snapshots()
        .where((snapshot) => snapshot.exists)
        .map(
            (graduationSystem) => toGraduationSystem(graduationSystem.id, graduationSystem.data()));
  }

  GraduationSystem toGraduationSystem(String grade, Map<String, dynamic> data) {
    data.putIfAbsent("grade", () => grade);
    return GraduationSystem.fromJson(data);
  }
}
