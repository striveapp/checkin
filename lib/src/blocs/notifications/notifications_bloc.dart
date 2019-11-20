import 'dart:async';
import 'package:platform/platform.dart';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final UserBloc userBloc;
  final FirebaseMessaging notificationProvider;
  final LocalPlatform platform;
  StreamSubscription _iosSubscription;

  NotificationsBloc(
      {@required this.notificationProvider, @required this.userBloc, @required this.platform}) {
    notificationProvider.configure(
        onMessage: _onMessage, onResume: _onResume, onLaunch: _onLaunch);
  }

  @override
  NotificationsState get initialState => NotificationsUninitialized();

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    if (event is Setup) {
      await _setupNotifications();
      yield NotificationsInitialized();
    }
    if (event is ShowDialog) {
      yield BasicNotificationsLoaded(notification: event.notification);
    }

    if (event is GoToLesson) {
      yield ActionNotificationsLoaded(lessonId: event.lessonId);
    }
  }

  @override
  void dispose() {
    _iosSubscription.cancel();
    super.dispose();
  }

  Future<void> _saveDeviceToken() async {
    String token = await notificationProvider.getToken();
    // TODO here we should use the userRepository instead,
    // but we will have problem retrieving the current user
    userBloc.dispatch(UpdateFcmToken(token: token));
  }

  Future<void> _setupNotifications() async {
    if (platform.isIOS) {
      _iosSubscription =
          notificationProvider.onIosSettingsRegistered.listen((data) async {
        await _saveDeviceToken();
      });

      notificationProvider
          .requestNotificationPermissions(IosNotificationSettings());
    } else {
      await _saveDeviceToken();
    }
  }

  Future _onMessage(Map<String, dynamic> msg) async {
    debugPrint("OnMessage");
    BasicNotification notification = _mapMsgToGeneralNotification(msg);
    dispatch(ShowDialog(notification: notification));
  }

  void _onLaunchOrOnResume(Map<String, dynamic> msg) {
    ActionNotification notification = _mapMsgToMasterNotification(msg);
    // TODO this logic should be moved inside mapEventToState
    // in order to to be tested properly

    // My proposed refactoring would be dispatch a DoAction event
    // where we pass the type and a Map<String, dynamic> of custom arguments
    // and then in the top method we should manage every type of action notification
    // we may receive and implement is custom behaviour dispatching different states
    // based on the type of the event

    if( notification.type == "master_reminder") {
      dispatch(GoToLesson(lessonId: notification.lessonId));
    }
  }

  Future _onResume(Map<String, dynamic> msg) async {
    debugPrint("OnResume");
    _onLaunchOrOnResume(msg);
  }

  Future _onLaunch(Map<String, dynamic> msg) async {
    debugPrint("OnLaunch");
    _onLaunchOrOnResume(msg);
  }

  BasicNotification _mapMsgToGeneralNotification(Map<String, dynamic> msg) {
    return BasicNotification(
      msg['notification']['title'],
      msg['notification']['body'],
    );
  }

  ActionNotification _mapMsgToMasterNotification(Map<String, dynamic> msg) {
    var data = msg['data'] ?? msg;
    return ActionNotification(
      data['type'],
      data['lessonId'],
    );
  }
}
