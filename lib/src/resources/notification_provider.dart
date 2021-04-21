import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/notification.dart';
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

  Future<BasicNotification> getInitialMessage() async {
    throw UnimplementedError();
    // var initialMessage = await _firebaseMessaging.getInitialMessage();
  }

  Stream<BasicNotification> onMessageOpenedApp() {
    throw UnimplementedError();
    // return FirebaseMessaging.onMessageOpenedApp.map((remoteMessage) => BasicNotification());
  }

  @override
  Stream<BasicNotification> onMessage() {
    // TODO: implement onMessage
    throw UnimplementedError();
  }
}
