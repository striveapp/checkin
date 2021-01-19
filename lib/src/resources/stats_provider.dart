import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatsProvider implements StatsRepository {
  static const String gymPath = "gyms";
  static const String path = 'users_history';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<UserHistory> getUserStats(String gymId, String email, String timespan) {
    return _firestore.collection(gymPath).doc(gymId).collection(path).doc(email).snapshots().map(
        (doc) => UserHistory(
            email: doc.id,
            attendedLessons: (doc.data() != null ? doc.data()['attendedLessons'] as List : [])
                ?.where((lesson) =>
                    lesson['timestamp'] >
                    DateUtil.getFirstDayOfTimespan(timespan).millisecondsSinceEpoch)
                ?.map(getLesson)
                ?.toList()));
  }

  Lesson getLesson(lesson) => Lesson.fromJson(lesson);

  Stream<List<UserHistory>> getAllUserStats(String gymId, String timespan) => _firestore
      .collection(gymPath)
      .doc(gymId)
      .collection(path)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => UserHistory(
              email: doc.id,
              attendedLessons: (doc.data()['attendedLessons'] as List)
                  .where((lesson) =>
                      lesson['timestamp'] >
                      DateUtil.getFirstDayOfTimespan(timespan).millisecondsSinceEpoch)
                  .map(getLesson)
                  .toList()))
          .toList());

  Stream<UserHistory> getUserStatsByGrade(String gymId, String email, Grade grade) {
    return _firestore.collection(gymPath).doc(gymId).collection(path).doc(email).snapshots().map(
        (doc) => UserHistory(
            email: doc.id,
            attendedLessons: (doc.data() != null ? doc.data()['attendedLessons'] as List : [])
                ?.where((lesson) => lesson['attendedAsGrade'] == grade.name.toLowerCase())
                ?.map(getLesson)
                ?.toList()));
  }

  Future<void> cleanUserHistory(String gymId, String email) async {
    await _firestore.collection(gymPath).doc(gymId).collection(path).doc(email)
        // .delete(); todo https://trello.com/c/oXkaXNqb
        .update({"attendedLessons": []});
  }
}
