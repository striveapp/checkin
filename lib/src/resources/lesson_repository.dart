import 'dart:async';

import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';

import 'lesson_provider.dart';

class LessonRepository {
  final _lessonProvider = LessonProvider();

  Future<void> register(String lessonId, Attendee attendee) => _lessonProvider.register(lessonId, attendee);

  Stream<List<Lesson>> getLessonsForToday() => _lessonProvider.getLessonsForToday();

  Future<void> clearLesson(String lessonId) => _lessonProvider.clearLesson(lessonId);

  Future<void> unregister(String lessonId, Attendee attendee) => _lessonProvider.unregister(lessonId, attendee);

  Stream<Lesson> getLesson(String lessonId) => _lessonProvider.getLesson(lessonId);
}