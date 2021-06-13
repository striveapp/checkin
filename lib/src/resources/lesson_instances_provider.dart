import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LessonInstancesProvider implements LessonRepository {
  static const String gymPath = "gyms";
  static const String path = 'lesson_instances';
  static const String sub_collection_path = 'instances';

  final DateUtil dateUtil;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LessonInstancesProvider({@required this.dateUtil});

  String _formatDate(DateTime day) => DateFormat("yyyy-MM-dd").format(day);

  @override
  Stream<List<Lesson>> getLessonsForDay(String gymId, DateTime day,
      [List<String> filterTypes = const []]) {
    var formattedDate = _formatDate(day);
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(formattedDate)
        .collection("instances")
        .where("lessonConfig.type", whereIn: filterTypes.isNotEmpty ? filterTypes : null)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Lesson.fromJson(doc.data())).toList());
  }

  @override
  Stream<Lesson> getLesson(String gymId, String date, String lessonId) => _firestore
      .collection(gymPath)
      .doc(gymId)
      .collection(path)
      .doc(date)
      .collection(sub_collection_path)
      .doc(lessonId)
      .snapshots()
      .where((doc) => doc.exists)
      .map((doc) => Lesson.fromJson(doc.data()));

  @override
  Stream<List<Lesson>> getLessonsByMasterAndTimespan(
          Master master, Timespan timespan, String gymId) =>
      _firestore
          .collectionGroup(sub_collection_path)
          .where("gymId", isEqualTo: gymId)
          .where("date",
              isGreaterThanOrEqualTo:
                  DateFormat('yyyy-MM-dd').format(dateUtil.getFirstDayOfTimespan(timespan)))
          .snapshots()
          .map((snapshot) => snapshot.docs
              .where((doc) => doc.data()['masters'] != null)
              .map((doc) => Lesson.fromJson(doc.data()))
              .where((lesson) =>
                  lesson.masters.any((lessonMaster) => lessonMaster.email == master.email))
              .toList());

  @override
  Future<void> register(String gymId, String date, String lessonId, Attendee attendee) async {
    Logger.log.i("User [$attendee] attends lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({
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
  Future<void> unregister(String gymId, String date, String lessonId, Attendee attendee) async {
    Logger.log.i("User [$attendee] removed from lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({
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

  Future<void> cleanLessonAttendees(String gymId, String date) async {
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .get()
        .asStream()
        .forEach((snapshot) async {
      await snapshot.docs.forEach((lesson) async {
        bool isYoga = lesson.data()['name'] == 'Yoga';
        await lesson.reference.update({
          "attendees": FieldValue.delete(),
          "acceptedAttendees": FieldValue.delete(),
          'isClosed': false,
          'classCapacity': isYoga ? 1 : 10
        });
      });
    });
  }

  @override
  Future<void> closeLesson(String gymId, String date, String lessonId) async {
    Logger.log.i("Close lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({
      'isClosed': true,
    });
  }

  @override
  Future<void> deleteLesson(String gymId, String date, String lessonId) async {
    Logger.log.i("Delete lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .delete();
  }

  @override
  Future<void> updateLessonTimeStart(
      String gymId, String date, String lessonId, String newTimeStart) async {
    Logger.log.i("Updating timeStart to [$newTimeStart] for lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({'timeStart': newTimeStart});
  }

  @override
  Future<void> updateLessonTimeEnd(
      String gymId, String date, String lessonId, String newTimeEnd) async {
    Logger.log.i("Updating timeEnd to [$newTimeEnd] for lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({'timeEnd': newTimeEnd});
  }

  @override
  Future<void> updateLessonName(String gymId, String date, String lessonId, String newName) async {
    Logger.log.i("Updating name to [$newName] for lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({'name': newName});
  }

  @override
  Future<void> updateLessonCapacity(
      String gymId, String date, String lessonId, int newCapacity) async {
    Logger.log.i("Updating capacity to [$newCapacity] for lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({'classCapacity': newCapacity});
  }

  @override
  Future<void> updateLessonImage(
      String gymId, String date, String lessonId, String newImageUrl) async {
    Logger.log.i("Updating image to [$newImageUrl] for lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({'imageUrl': newImageUrl});
  }

  @override
  Future<void> updateLessonMasters(
      String gymId, String date, String lessonId, List<Master> newMasters) async {
    Logger.log.i("Updating masters to [$newMasters] for lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({'masters': newMasters.map((master) => master.toJson()).toList()});
  }

  @override
  Future<void> createLesson(String gymId, String date) async {
    var defaultLesson = Lesson.createDefault(date, gymId);
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(defaultLesson.id)
        .set(defaultLesson.toJson());
  }
}
