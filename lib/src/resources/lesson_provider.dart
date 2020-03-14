import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LessonProvider implements LessonRepository {
  static const String path = 'lessons';

  //TODO: use only a single instance of firestore
  Firestore _firestore = Firestore.instance;

  String _formatDate(DateTime day) => DateFormat('EEEE', 'en_US').format(day);

  Stream<List<Lesson>> getLessonsForToday() {
    var today = isInDebugMode ? DateTime(2020, 2, 17) : DateTime.now();

    return getLessonsForDay(today);
  }

  Stream<List<Lesson>> getLessonsForDay(DateTime day) => _firestore
      .collection(path)
      .where('weekDay', isEqualTo: _formatDate(day))
      .snapshots()
      .map((snapshot) => snapshot.documents
          .where((doc) => doc.data['masters'] != null)
          .map((doc) => Lesson(
              id: doc.documentID,
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

  Stream<Lesson> getLesson(String lessonId) => _firestore
      .collection(path)
      .document(lessonId)
      .snapshots()
      .where((doc) => doc.data['masters'] != null)
      .map((doc) => Lesson(
          id: doc.documentID,
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

  Future<void> register(String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] attends lesson with id [$lessonId]");
    await _firestore.collection(path).document(lessonId).updateData({
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

  Future<void> unregister(String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] removed from lesson with id [$lessonId]");
    await _firestore.collection(path).document(lessonId).updateData({
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
