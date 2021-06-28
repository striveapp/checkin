// @dart=2.9

import 'package:checkin/src/models/notification.dart';

abstract class NotificationRepository {
  Future<void> requestPermission();
  Future<String> getToken();
  Future<Notification> getInitialMessage();

  Stream<Notification> onMessageOpenedApp();
  Stream<Notification> onMessage();
}
