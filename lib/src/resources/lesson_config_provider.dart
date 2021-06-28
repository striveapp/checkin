// @dart=2.9

import 'package:checkin/src/models/lesson_config.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonConfigProvider implements LessonConfigRepository {
  static const String gymPath = "gyms";
  static const String path = 'lesson_config';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<Set<String>> getAvailableLessonTypes(String gymId) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .snapshots()
        .map((snapshots) => snapshots.docs)
        .map((lessonConfigDocList) => _toAvailableLessonTypes(lessonConfigDocList));
  }

  Set<String> _toAvailableLessonTypes(List<QueryDocumentSnapshot> lessonConfigDocList) {
    return lessonConfigDocList
        .where((lessonConfigDoc) => lessonConfigDoc.exists)
        .map((lessonConfigDoc) => LessonConfig.fromJson(lessonConfigDoc.data()))
        .map((lessonConfig) => lessonConfig.type)
        .toSet();
  }
}
