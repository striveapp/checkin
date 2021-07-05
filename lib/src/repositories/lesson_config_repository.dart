abstract class LessonConfigRepository {
  Stream<Set<String>> getAvailableLessonTypes(String gymId);
}
