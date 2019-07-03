import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';

import 'lesson_provider.dart';

class LessonRepository {
  final _lessonProvider = LessonProvider();

  Stream<List<Lesson>> getLessons() => _lessonProvider.getLessons();

  Future<void> attendLesson(String lessonId, Attendee attendee) => _lessonProvider.attendLesson(lessonId, attendee);

  Stream<List<Lesson>> getLessonsForToday() => _lessonProvider.getLessonsForToday();

}