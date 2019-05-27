import 'package:checkin/src/models/lesson.dart';

import 'lesson_provider.dart';

class LessonRepository {
  final _lessonProvider = LessonProvider();

  Stream<List<Lesson>> getLessons() => _lessonProvider.getLessons();

}