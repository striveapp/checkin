import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class LessonProvider {
  static const String path = 'lessons';

  //TODO: use only a single instance of firestore
  Firestore _firestore = Firestore.instance;

  Stream<List<Lesson>> getLessonsForToday() {
    var today = isInDebugMode
        ? 'Monday'
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
                        rank: attendee["grade"],
                        imageUrl: attendee["imageUrl"],
                        email: attendee["email"]))
                    ?.toList()))
            .toList());
  }

  Stream<Lesson> getLesson(String lessonId) {
    return _firestore.collection(path).document(lessonId).snapshots().map(
        (doc) => Lesson(
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
                    rank: attendee["grade"],
                    imageUrl: attendee["imageUrl"],
                    email: attendee["email"]))
                ?.toList()));
  }

  Stream<List<Lesson>> getLessonsOfMaster(Master currentMaster) {
    return _firestore
        .collection(path)
        .where('masters', arrayContains: currentMaster)
        .snapshots()
        .map((snapshot) => snapshot.documents
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
                        rank: attendee["grade"],
                        imageUrl: attendee["imageUrl"],
                        email: attendee["email"]))
                    ?.toList()))
            .toList());
  }
}
