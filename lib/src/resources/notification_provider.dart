import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/repositories/notification_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationProvider implements NotificationRepository {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> requestPermission() async {
    var notificationSettings = await _firebaseMessaging.requestPermission();
    Logger.log.i("Permission requested. Status: ${notificationSettings.authorizationStatus}");
  }

  @override
  Future<String> getToken() => _firebaseMessaging.getToken();

  // Stream<void> onMessage() {
  //   FirebaseMessaging.onMessage.map((remoteMessage) {});
  // }
}
