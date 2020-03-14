import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class LessonInstancesProvider implements LessonRepository {
  static const String path = 'lesson_instances';

  //TODO: use only a single instance of firestore
  Firestore _firestore = Firestore.instance;

  String _formatDate(DateTime day) => DateFormat("yyyy-MM-dd").format(day);

  Stream<List<Lesson>> getLessonsForToday() {
    return getLessonsForDay(DateTime.now());
  }

  Stream<List<Lesson>> getLessonsForDay(DateTime day) {
    var formattedDate = _formatDate(day);
    return _firestore
        .collection(path)
        .document(formattedDate)
        .collection("instances")
        .snapshots()
        .map((snapshot) => snapshot.documents
            .where((doc) => doc.data['masters'] != null)
            .map((doc) => Lesson(
                id: doc.documentID,
                date: doc.data['date'],
                name: doc.data['name'],
                timeStart: doc.data['timeStart'],
                timeEnd: doc.data['timeEnd'],
                weekDay: doc.data['weekDay'],
                masters: (doc.data['masters'] as List)
                    ?.map((master) => Master(
                          name: master['name'],
                          email: master['email'],
                          imageUrl: master['imageUrl'],
                        ))
                    ?.toList(),
                attendees: (doc.data['attendees'] as List)
                        ?.map((attendee) => Attendee(
                            name: attendee['name'],
                            grade: (attendee["grade"] as String).toGrade(),
                            imageUrl: attendee["imageUrl"],
                            email: attendee["email"]))
                        ?.toList() ??
                    []))
            .toList());
  }

  Stream<Lesson> getLesson(String date, String lessonId) => _firestore
      .collection(path)
      .document(date)
      .collection("instances")
      .document(lessonId)
      .snapshots()
      .where((doc) => doc.data['masters'] != null)
      .map((doc) => Lesson(
          id: doc.documentID,
          date: doc.data['date'],
          name: doc.data['name'],
          timeStart: doc.data['timeStart'],
          timeEnd: doc.data['timeEnd'],
          weekDay: doc.data['weekDay'],
          masters: (doc.data['masters'] as List)
              ?.map((master) => Master(
                    name: master['name'],
                    email: master['email'],
                    imageUrl: master['imageUrl'],
                  ))
              ?.toList(),
          attendees: (doc.data['attendees'] as List)
                  ?.map((attendee) => Attendee(
                      name: attendee['name'],
                      grade: (attendee["grade"] as String).toGrade(),
                      imageUrl: attendee["imageUrl"],
                      email: attendee["email"]))
                  ?.toList() ??
              []));

  Future<void> register(String date, String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] attends lesson with id [$lessonId]");
    await _firestore
        .collection(path)
        .document(date)
        .collection("instances")
        .document(lessonId)
        .updateData({
      'attendees': FieldValue.arrayUnion([
        {
          'name': attendee.name,
          'imageUrl': attendee.imageUrl,
          'grade': attendee.grade.name,
          'email': attendee.email
        }
      ])
    });
  }

  Future<void> unregister(
      String date, String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] removed from lesson with id [$lessonId]");
    await _firestore
        .collection(path)
        .document(date)
        .collection("instances")
        .document(lessonId)
        .updateData({
      'attendees': FieldValue.arrayRemove([
        {
          'name': attendee.name,
          'imageUrl': attendee.imageUrl,
          'grade': attendee.grade.name,
          'email': attendee.email
        }
      ])
    });
  }
}
