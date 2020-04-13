import 'dart:async';

import 'package:checkin/src/repositories/notification_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:platform/platform.dart';

class NotificationProvider implements NotificationRepository {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  LocalPlatform platform = LocalPlatform();

  // ignore: cancel_subscriptions
  StreamSubscription iosSubscription;

  void config({onMessage, onResume, onLaunch}) => _firebaseMessaging.configure(
        onMessage: onMessage,
        onResume: onResume,
        onLaunch: onLaunch,
      );

  void setup({onSuccess}) async {
    if (platform.isIOS) {
      iosSubscription =
          _firebaseMessaging.onIosSettingsRegistered.listen((data) async {
        var token = await _firebaseMessaging.getToken();
        onSuccess(token);
      });

      _firebaseMessaging
          .requestNotificationPermissions(IosNotificationSettings());
    } else {
      var token = await _firebaseMessaging.getToken();
      onSuccess(token);
    }
  }
}
