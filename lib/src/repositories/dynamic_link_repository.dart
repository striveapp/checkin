// @dart=2.9

abstract class DynamicLinkRepository {
  Future<String> getRegistryLink(String date, String lessonId);
}
