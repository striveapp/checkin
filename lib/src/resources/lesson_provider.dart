import 'package:checkin/src/models/lesson.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class LessonProvider {
  static const String path = 'lessons';

  //@TODO: use only a single instance of firestore
  Firestore _firestore = Firestore.instance;

  Stream<List<Lesson>> getLessons() {
    return _firestore
        .collection(path)
        .snapshots()
        .map((snapshot) => snapshot.documents.map((doc) {
      return Lesson(
          name: doc.data['name'],
          timeStart: doc.data['timeStart'], 
          timeEnd: doc.data['timeEnd'], 
          weekDay: doc.data['weekDay'], 
          excludedGrades: doc.data['excludedGrades']
      );
    }).toList());
  }

  Stream<List<Lesson>> getLessonsForToday() {
    var today = DateFormat('EEEE', 'en_US').format(DateTime.now());

    return _firestore
        .collection(path)
        .where('weekDay', isEqualTo: today )
        .snapshots()
        .map((snapshot) => snapshot.documents.map((doc) {
      return Lesson(
          name: doc.data['name'],
          timeStart: doc.data['timeStart'],
          timeEnd: doc.data['timeEnd'],
          weekDay: doc.data['weekDay'],
          excludedGrades: doc.data['excludedGrades']
      );
    }).toList());
  }

//  Future<void> attendClass(User attendee) async {
//    debugPrint("attendClass [$attendee]");
//    await _firestore.collection(path).add({
//      'name': attendee.name,
//      'imageUrl': attendee.imageUrl,
//      'grade': attendee.rank,
//      'email': attendee.email,
//      'counter': attendee.counter
//    });
//  }
//
//  Future<void> clearClass() async {
//    var res = await _firestore.collection(path).getDocuments();
//
//    for (DocumentSnapshot ds in res.documents) {
//      ds.reference.delete();
//    }
//  }
}