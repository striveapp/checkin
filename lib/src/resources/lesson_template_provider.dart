import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_template_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonTemplateProvider extends LessonTemplateRepository {
  static const String gymPath = "gyms";
  static const String path = 'lesson_template';
  static const String sub_collection_path = 'instances';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> applyTemplate(String gymId, String initDate, String endDate) async {
    Logger.log.i("Updating class calendar starting FROM $initDate TO $endDate");
    var querySnapshot = await _firestore
        .collectionGroup(sub_collection_path)
        .where("gymId", isEqualTo: gymId)
        .where("date", isGreaterThanOrEqualTo: initDate, isLessThan: endDate)
        .get();

    List<LessonTemplate> newTemplates =
        querySnapshot.docs.map((doc) => LessonTemplate.fromJson(doc.data())).toList();

    var batch = _firestore.batch();
    await _cleanTemplates(batch, gymId);
    await _setTemplates(batch, gymId, newTemplates);
    batch.commit();
  }

  Future<void> _setTemplates(
      WriteBatch batch, String gymId, List<LessonTemplate> newTemplates) async {
    for (LessonTemplate template in newTemplates) {
      var documentReference =
          await _firestore.collection(gymPath).doc(gymId).collection(path).doc(template.id);
      batch.set(documentReference, template.toJson());
    }
  }

  Future<void> _cleanTemplates(WriteBatch batch, String gymId) async {
    var querySnapshot = await _firestore.collection(gymPath).doc(gymId).collection(path).get();

    for (DocumentSnapshot ds in querySnapshot.docs) {
      batch.delete(ds.reference);
    }
  }
}
