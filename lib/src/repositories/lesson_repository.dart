import 'dart:async';

import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';

abstract class LessonRepository {
  Stream<List<Lesson>> getLessonsForToday();

  Stream<List<Lesson>> getLessonsForDay(DateTime day);

  Stream<List<Lesson>> getLessonsByMasterAndTimespan(Master master, String timespan);

  Stream<Lesson> getLesson(String date, String lessonId);

  Future<void> register(String date, String lessonId, Attendee attendee);

  Future<void> unregister(String date, String lessonId, Attendee attendee);
}
