import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatsProvider {
  static const String gymPath = "gyms";
  static const String path = 'users_history';

  Firestore _firestore = Firestore.instance;

  Stream<UserHistory> getUserStats(String gymId, String email, String timespan) {
    return _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path).document(email).snapshots().map((doc) =>
        UserHistory(
            email: doc.documentID,
            attendedLessons:
                (doc.data != null ? doc.data['attendedLessons'] as List : [])
                    ?.where((lesson) => lesson['timestamp'] > DateUtil.getFirstDayOfTimespan(timespan).millisecondsSinceEpoch)
                    ?.map(getLesson)
                    ?.toList()));
  }

  Lesson getLesson(lesson) => Lesson(
      id: lesson['id'],
      name: lesson['name'],
      weekDay: lesson['weekDay'],
      timeStart: lesson['timeStart'],
      timeEnd: lesson['timeEnd'],
      timestamp: lesson['timestamp'],
      attendees: [],
      masters: (lesson['masters'] as List)
              ?.map((master) => Master(
                    name: master['name'],
                    email: master['email'],
                    imageUrl: master['imageUrl'],
                  ))
              ?.toList() ??
          []);

  Stream<List<UserHistory>> getAllUserStats(String gymId) => _firestore
      .collection(gymPath)
      .document(gymId)
      .collection(path)
      .snapshots()
      .map((snapshot) => snapshot.documents
          .map((doc) => UserHistory(
              email: doc.documentID,
              attendedLessons: (doc.data['attendedLessons'] as List)
                  .map(getLesson)
                  .toList()))
          .toList());

  Future<void> cleanUserHistory(String gymId, String email) async {
    await _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document(email)
    // .delete(); todo https://trello.com/c/oXkaXNqb
        .updateData({"attendedLessons": []});
  }
}
