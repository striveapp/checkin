import 'dart:async';
import 'package:checkin/src/repositories/notification_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/notification.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final UserBloc userBloc;
  final NotificationRepository notificationRepository;

  NotificationsBloc({
    @required this.userBloc,
    @required this.notificationRepository,
  }) {
    notificationRepository.config(
      onMessage: _onMessage,
      onResume: _onResume,
      onLaunch: _onLaunch,
    );
  }

  @override
  NotificationsState get initialState => NotificationsUninitialized();

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    if (event is Setup) {
      try {
        this.notificationRepository.setup(onSuccess: _saveUserToken);
        yield NotificationsInitialized();
      } catch(err) {
        debugPrint(err);
      }
    }
    if (event is ShowDialog) {
      yield NotificationToDialog(notification: event.notification);
    }
    if(event is NotificationOpened) {
      yield NotificationToNavigate(path: event.path);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void _saveUserToken(String token) {
    userBloc.listen((userState) {
      if (userState is UserSuccess) {
        userBloc.add(UpdateFcmToken(
            currentUser: userState.currentUser, newToken: token));
      }
    });
  }

  Future _onMessage(Map<String, dynamic> msg) async {
    debugPrint("OnMessage");
    BasicNotification notification = _mapMsgToGeneralNotification(msg);
    add(ShowDialog(notification: notification));
  }

  void _onLaunchOrOnResume(Map<String, dynamic> msg) {
    ActionNotification notification = _mapMsgToMasterNotification(msg);

    switch( notification.type ) {
      case "master_reminder":
        add(NotificationOpened(path: "registry/${notification.lessonId}"));
        break;
      case "class_attended":
        add(NotificationOpened(path: "/stats"));
        break;
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
    var notification = msg['notification'] ?? msg['aps']['alert'];
    return BasicNotification(
      notification['title'],
      notification['body'],
    );
  }

  ActionNotification _mapMsgToMasterNotification(Map<String, dynamic> msg) {
    var data = msg['data'] ?? msg;
    // todo lessonId to be refactored into generic type
    return ActionNotification(
      data['type'],
      data['lessonId'],
    );
  }
}
