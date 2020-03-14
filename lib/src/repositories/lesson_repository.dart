import 'dart:async';

import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';

abstract class LessonRepository {
  Stream<List<Lesson>> getLessonsForToday();

  Stream<List<Lesson>> getLessonsForDay(DateTime day);

  Stream<Lesson> getLesson(String lessonId);

  Future<void> register(String lessonId, Attendee attendee);

  Future<void> unregister(String lessonId, Attendee attendee);
}
