abstract class NotificationRepository {
  Future<void> requestPermission();
  Future<String> getToken();
}
