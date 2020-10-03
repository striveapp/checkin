import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:checkin/src/config.dart' as config;


import '../constants.dart';

class LessonInstancesProvider implements LessonRepository {
  static const String gymPath = "gyms";
  static const String path = 'lesson_instances';
  static const String sub_collection_path = 'instances';

  //TODO: use only a single instance of firestore https://trello.com/c/LZ79VvWa
  Firestore _firestore = Firestore.instance;

  String _formatDate(DateTime day) => DateFormat("yyyy-MM-dd").format(day);

  Lesson _toLesson(DocumentSnapshot lesson) => Lesson(
      id: lesson.documentID,
      date: lesson.data['date'],
      name: lesson.data['name'],
      timeStart: lesson.data['timeStart'],
      timeEnd: lesson.data['timeEnd'],
      weekDay: lesson.data['weekDay'],
      classCapacity: lesson.data['classCapacity'] ?? config.DEFAULT_CLASS_CAPACITY, // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
      masters: (lesson.data['masters'] as List)
          ?.map((master) => Master(
                name: master['name'],
                email: master['email'],
                imageUrl: master['imageUrl'],
              ))
          ?.toList(),
      attendees: (lesson.data['attendees'] as List)
              ?.map((attendee) => _toAttendee(attendee))
              ?.toList() ??
          [],
      acceptedAttendees: (lesson.data['acceptedAttendees'] as List)
              ?.map((attendee) => _toAttendee(attendee))
              ?.toList() ??
          []);

  Attendee _toAttendee(Map<dynamic, dynamic> attendee) => Attendee(
      name: attendee['name'],
      grade: (attendee["grade"] as String).toGrade(),
      imageUrl: attendee["imageUrl"],
      email: attendee["email"],);

  @override
  Stream<List<Lesson>> getLessonsForToday(String gymId) {
    if (isInDebugMode) {
      return getLessonsForDay(gymId, testDate);
    }

    return getLessonsForDay(gymId, DateTime.now());
  }

  @override
  Stream<List<Lesson>> getLessonsForDay(String gymId, DateTime day) {
    var formattedDate = _formatDate(day);
    return _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document(formattedDate)
        .collection("instances")
        .snapshots()
        .map((snapshot) => snapshot.documents
            .where((doc) => doc.data['masters'] != null)
            .map((doc) => _toLesson(doc))
            .toList());
  }

  @override
  Stream<Lesson> getLesson(String gymId, String date, String lessonId) => _firestore
      .collection(gymPath)
      .document(gymId)
      .collection(path)
      .document(date)
      .collection(sub_collection_path)
      .document(lessonId)
      .snapshots()
      .where((doc) => doc.data['masters'] != null)
      .map((doc) => _toLesson(doc));

  @override
  //TODO: collectionGroups are not currently supporting our multi gym model,
  // so in doing that we are running a query on all the instances in all the gyms
  // it's not causing any bug as of now, but might not be ideal in the long term (ie: query performance)
  // https://trello.com/c/Qz2hbweo
  Stream<List<Lesson>> getLessonsByMasterAndTimespan(Master master, String timespan) => _firestore
        .collectionGroup(sub_collection_path)
        .where("masters", arrayContains: {
          "name": master.name,
          "email": master.email,
          "imageUrl": master.imageUrl,
        })
        .where("date", isGreaterThanOrEqualTo: DateFormat('yyyy-MM-dd').format(DateUtil.getFirstDayOfTimespan(timespan)))
        .snapshots()
        .map((snapshot) => snapshot.documents
            .where((doc) => doc.data['masters'] != null)
            .map((doc) => _toLesson(doc))
            .toList());

  @override
  Future<void> register(String gymId, String date, String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] attends lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document(date)
        .collection(sub_collection_path)
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

  @override
  Future<void> unregister(String gymId,
      String date, String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] removed from lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document(date)
        .collection(sub_collection_path)
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

  Future<void> cleanLessonAttendees(String gymId, String date, String lessonId) async {
    await _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document(date)
        .collection(sub_collection_path)
        .document(lessonId)
        .updateData({
      "attendees": FieldValue.delete(),
      "acceptedAttendees": FieldValue.delete()
    });
  }
}
