import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:platform/platform.dart';

class NotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  LocalPlatform platform = LocalPlatform();
  // ignore: cancel_subscriptions
  StreamSubscription iosSubscription;

  void config(MessageHandler onMessage, MessageHandler onResume,
          MessageHandler onLaunch) =>
      _firebaseMessaging.configure(
        onMessage: onMessage,
        onResume: onResume,
        onLaunch: onLaunch,
      );

  void setup(Function(String) onSuccess) async {
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
