import 'dart:async';

abstract class LessonConfigRepository {
  Stream<Set<String>> getAvailableLessonTypes(String gymId);
}
