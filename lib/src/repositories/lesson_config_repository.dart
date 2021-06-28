// @dart=2.9

import 'dart:async';

abstract class LessonConfigRepository {
  Stream<Set<String>> getAvailableLessonTypes(String gymId);
}
