import 'dart:async';

import 'package:checkin/src/api/api.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';

import 'lesson_provider.dart';

class LessonRepository {
  final _lessonProvider = LessonProvider();
  final _lessonApi = LessonApi();

  Stream<List<Lesson>> getLessonsForToday() =>
      _lessonProvider.getLessonsForToday();

  Stream<Lesson> getLesson(String lessonId) =>
      _lessonProvider.getLesson(lessonId);

  Future<void> register(String lessonId, Attendee attendee) =>
      _lessonProvider.register(lessonId, attendee);

  Future<void> unregister(String lessonId, Attendee attendee) =>
      _lessonProvider.unregister(lessonId, attendee);

  Future<void> acceptAll(Lesson lesson) =>
      _lessonApi.acceptAll(lesson);
}
