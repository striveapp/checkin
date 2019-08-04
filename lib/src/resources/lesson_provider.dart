import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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
                  excludedGrades: doc.data['excludedGrades']);
            }).toList());
  }

  Stream<List<Lesson>> getLessonsForToday() {
    var today = isInDebugMode ? 'Monday'
    : DateFormat('EEEE', 'en_US').format(DateTime.now());

    return _firestore
        .collection(path)
        .where('weekDay', isEqualTo: today)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((doc) => Lesson(
                id: doc.documentID,
                name: doc.data['name'],
                timeStart: doc.data['timeStart'],
                timeEnd: doc.data['timeEnd'],
                weekDay: doc.data['weekDay'],
                excludedGrades: doc.data['excludedGrades'],
                attendees: (doc.data['attendees'] as List)
                    ?.map((attendee) => Attendee(
                        name: attendee['name'],
                        rank: attendee["rank"],
                        imageUrl: attendee["imageUrl"],
                        email: attendee["email"]))
                    ?.toList()))
            .toList());
  }

  Future<void> register(String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] attends lesson with id [$lessonId]");
    await _firestore.collection(path).document(lessonId).updateData({
      'attendees': FieldValue.arrayUnion([
        {
          'name': attendee.name,
          'imageUrl': attendee.imageUrl,
          'grade': attendee.rank,
          'email': attendee.email
        }
      ])
    });
  }

  Future<void> unregister(String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] removed from lesson with id [$lessonId]");
    await _firestore.collection(path).document(lessonId).updateData({
      'attendees': FieldValue.arrayRemove([
        {
          'name': attendee.name,
          'imageUrl': attendee.imageUrl,
          'grade': attendee.rank,
          'email': attendee.email
        }
      ])
    });
  }
  Future<void> clearLesson(String lessonId) async {
    await _firestore
        .collection(path)
        .document(lessonId)
        .updateData({"attendees": FieldValue.delete()});
  }

}
