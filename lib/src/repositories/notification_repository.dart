import 'package:checkin/src/models/notification.dart';

abstract class NotificationRepository {
  Future<void> requestPermission();
  Future<String> getToken();
  Future<BasicNotification> getInitialMessage();

  Stream<BasicNotification> onMessageOpenedApp();
  Stream<BasicNotification> onMessage();
}
