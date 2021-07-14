// @dart=2.9

import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class StatsProvider implements StatsRepository {
  static const String gymPath = "gyms";
  static const String path = 'users_history';

  final DateUtil dateUtil;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  StatsProvider({@required this.dateUtil});

  Lesson getLesson(lesson) => Lesson.fromJson(lesson);

  @override
  Stream<UserHistory> getUserStats(String gymId, String email, Timespan timespan) => _firestore
      .collection(gymPath)
      .doc(gymId)
      .collection(path)
      .doc(email)
      .snapshots()
      .map((doc) => UserHistory(
          email: doc.id,
          attendedLessons: (doc.data() != null ? doc.data()['attendedLessons'] as List : [])
              ?.where((lesson) {
                return lesson['timestamp'] >
                    dateUtil.getFirstDayOfTimespan(timespan).millisecondsSinceEpoch;
              })
              ?.map(getLesson)
              ?.toList()));

  @override
  Stream<List<UserHistory>> getAllUserStats(String gymId, Timespan timespan) => _firestore
      .collection(gymPath)
      .doc(gymId)
      .collection(path)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => UserHistory(
              email: doc.id,
              attendedLessons: (doc.data()['attendedLessons'] as List)
                  .where((lesson) => lesson['timestamp'] != null)
                  .where((lesson) =>
                      lesson['timestamp'] >
                      dateUtil.getFirstDayOfTimespan(timespan).millisecondsSinceEpoch)
                  .map(getLesson)
                  .toList()))
          .toList());

  Stream<UserHistory> getUserStatsByGrade(String gymId, String email, Grade grade) {
    return _firestore.collection(gymPath).doc(gymId).collection(path).doc(email).snapshots().map(
        (doc) => UserHistory(
            email: doc.id,
            attendedLessons: (doc.data() != null ? doc.data()['attendedLessons'] as List : [])
                ?.where((lesson) =>
                    (lesson['attendedAsGrade'] as String)?.toLowerCase() ==
                    grade.name.toLowerCase())
                ?.map(getLesson)
                ?.toList()));
  }

  Future<void> cleanUserHistory(String gymId, String email) async {
    await _firestore.collection(gymPath).doc(gymId).collection(path).doc(email).delete();
  }
}
