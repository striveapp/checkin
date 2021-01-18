import 'dart:async';

import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';

abstract class LessonRepository {
  Stream<List<Lesson>> getLessonsForDay(String gymId, DateTime day, [List<String> filterTypes]);

  Stream<List<Lesson>> getLessonsByMasterAndTimespan(Master master, String timespan);

  Stream<Lesson> getLesson(String gymId, String date, String lessonId);

  Future<void> register(String gymId, String date, String lessonId, Attendee attendee);

  Future<void> unregister(String gymId, String date, String lessonId, Attendee attendee);

  Future<void> closeLesson(String gymId, String date, String lessonId);
}
