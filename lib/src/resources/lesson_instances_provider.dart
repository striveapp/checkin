import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class LessonInstancesProvider implements LessonRepository {
  static const String gymPath = "gyms";
  static const String path = 'lesson_instances';
  static const String sub_collection_path = 'instances';

  //TODO: use only a single instance of firestore https://trello.com/c/LZ79VvWa
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
      .map((doc) => Lesson.fromJson(doc.data()));

  @override
  //TODO: collectionGroups are not currently supporting our multi gym model,
  // so in doing that we are running a query on all the instances in all the gyms
  // it's not causing any bug as of now, but might not be ideal in the long term (ie: query performance)
  // https://trello.com/c/Qz2hbweo
  Stream<List<Lesson>> getLessonsByMasterAndTimespan(Master master, Timespan timespan) => _firestore
      .collectionGroup(sub_collection_path)
      .where("masters", arrayContains: {
        "name": master.name,
        "email": master.email,
        "imageUrl": master.imageUrl,
      })
      .where("date",
          isGreaterThanOrEqualTo:
              DateFormat('yyyy-MM-dd').format(DateUtil.getFirstDayOfTimespan(timespan)))
      .snapshots()
      .map((snapshot) => snapshot.docs
          .where((doc) => doc.data()['masters'] != null)
          .map((doc) => Lesson.fromJson(doc.data()))
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

  Future<void> cleanLessonAttendees(String gymId, String date, String lessonId) async {
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({"attendees": FieldValue.delete(), "acceptedAttendees": FieldValue.delete()});
  }

  Future<void> openLesson(String gymId, String date, String lessonId) async {
    Logger.log.i("Close lesson with id [$lessonId]");
    await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(date)
        .collection(sub_collection_path)
        .doc(lessonId)
        .update({
      'isClosed': false,
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
}
