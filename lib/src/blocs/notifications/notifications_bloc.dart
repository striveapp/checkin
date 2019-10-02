import 'dart:async';
import 'dart:io';

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
  StreamSubscription _iosSubscription;

  NotificationsBloc(
      {@required this.notificationProvider, @required this.userBloc}) {
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
      yield NotificationsLoaded(notification: event.notification);
    }

    if (event is GoToLesson) {
      yield MasterNotificationsLoaded(lessonId: event.lessonId);
    }
  }

  @override
  void dispose() {
    _iosSubscription.cancel();
    super.dispose();
  }

  Future<void> _saveDeviceToken() async {
    String token = await notificationProvider.getToken();
    userBloc.dispatch(UpdateFcmToken(token: token));
  }

  Future<void> _setupNotifications() async {
    if (Platform.isIOS) {
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
    GeneralNotification notification = _mapMsgToGeneralNotification(msg);
    debugPrint("OnMessage Push notification received with message: $notification");
    dispatch(ShowDialog(notification: notification));
  }

  void _onLaunchOrOnResume(Map<String, dynamic> msg) {
    MasterNotification notification = _mapMsgToMasterNotification(msg);
    if( notification.type == "master_reminder") {
      dispatch(GoToLesson(lessonId: notification.lessonId));
    }
  }

  Future _onResume(Map<String, dynamic> msg) async {
    debugPrint("OnResume Push notification with message");
    _onLaunchOrOnResume(msg);
  }

  Future _onLaunch(Map<String, dynamic> msg) async {
    debugPrint("OnLaunch Push notification with message");
    _onLaunchOrOnResume(msg);
  }

  GeneralNotification _mapMsgToGeneralNotification(Map<String, dynamic> msg) {
    return GeneralNotification(
      msg['notification']['title'],
      msg['notification']['body'],
    );
  }

  MasterNotification _mapMsgToMasterNotification(Map<String, dynamic> msg) {
    return MasterNotification(
      msg['data']['type'],
      msg['data']['lessonId'],
    );
  }
}
