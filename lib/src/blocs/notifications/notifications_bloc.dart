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
  final LocalPlatform platform;

  FirebaseMessaging _notificationProvider;
  StreamSubscription _iosSubscription;

  NotificationsBloc({
    @required this.userBloc,
    @required this.platform
  }) {
    //TODO: this should have his own repository
    _notificationProvider = FirebaseMessaging();
    _notificationProvider.configure(
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
  Future<void> close() {
    _iosSubscription?.cancel();
    return super.close();
  }

  Future<void> _saveDeviceToken() async {
    String token = await _notificationProvider.getToken();
    userBloc.listen((userState) {
      if(userState is UserSuccess) {
        userBloc.add(UpdateFcmToken(currentUser: userState.currentUser, newToken: token));
      }
    });
  }

  Future<void> _setupNotifications() async {
    if (platform.isIOS) {
      _iosSubscription =
          _notificationProvider.onIosSettingsRegistered.listen((data) async {
        await _saveDeviceToken();
      });

      _notificationProvider
          .requestNotificationPermissions(IosNotificationSettings());
    } else {
      await _saveDeviceToken();
    }
  }

  Future _onMessage(Map<String, dynamic> msg) async {
    debugPrint("OnMessage");
    BasicNotification notification = _mapMsgToGeneralNotification(msg);
    add(ShowDialog(notification: notification));
  }

  void _onLaunchOrOnResume(Map<String, dynamic> msg) {
    ActionNotification notification = _mapMsgToMasterNotification(msg);
    // TODO this logic should be moved inside mapEventToState
    // in order to to be tested properly

    // My proposed refactoring would be add a DoAction event
    // where we pass the type and a Map<String, dynamic> of custom arguments
    // and then in the top method we should manage every type of action notification
    // we may receive and implement is custom behaviour adding different states
    // based on the type of the event

    if( notification.type == "master_reminder") {
      add(GoToLesson(lessonId: notification.lessonId));
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
