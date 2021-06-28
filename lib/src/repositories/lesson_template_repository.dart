// @dart=2.9

abstract class LessonTemplateRepository {
  Future<void> applyTemplate(String gymId, String initDate, String endDate);
}
