import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_template_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonTemplateProvider extends LessonTemplateRepository {
  static const String gymPath = "gyms";
  static const String path = 'lesson_template';
  static const String sub_collection_path = 'instances';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> applyTemplate(String gymId, String date) async {
    // todo clean template

    // todo transaction
    var querySnapshot = await _firestore
        .collectionGroup(sub_collection_path)
        .where("date", isGreaterThanOrEqualTo: date)
        // todo and lessThan endDate
        .where("gymId", isEqualTo: gymId)
        .get();

    List<LessonTemplate> newTemplates =
        querySnapshot.docs.map((doc) => LessonTemplate.fromJson(doc.data())).toList();

    newTemplates.forEach((template) async {
      await _firestore
          .collection(gymPath)
          .doc(gymId)
          .collection(path)
          .doc(template.id)
          .set(template.toJson());
    });
  }
}
