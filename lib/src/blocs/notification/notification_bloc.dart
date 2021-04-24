import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/notification/notification_event.dart';
import 'package:checkin/src/blocs/notification/notification_state.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/notification.dart';
import 'package:checkin/src/repositories/notification_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;
  final UserRepository userRepository;

  NotificationBloc({
    @required this.notificationRepository,
    @required this.userRepository,
  }) : super(NotificationState.notificationInitial());

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is InitializeNotifications) {
      await notificationRepository.requestPermission();

      var notification = await notificationRepository.getInitialMessage();

      if (notification != null) {
        Logger.log.i("InitialMessage: $notification");
        yield _mapNotificationState(notification);
      }

      notificationRepository.onMessageOpenedApp().listen((notification) {
        add(MessageOpenedApp(notification: notification));
      });
      notificationRepository.onMessage().listen((notification) {
        add(Message(notification: notification));
      });
    }

    if (event is UpdateToken) {
      var fcmToken = await notificationRepository.getToken();
      await userRepository.updateUserFcmToken(event.loggedUserEmail, fcmToken);
    }

    if (event is MessageOpenedApp) {
      Logger.log.i("onMessageOpenedApp: ${event.notification}");
      yield _mapNotificationState(event.notification);
    }

    if (event is Message) {
      Logger.log.i("onMessage: ${event.notification}");
      yield _mapNotificationState(event.notification);
    }
  }

  NotificationState _mapNotificationState(Notification notification) => notification.map(
      basicNotification: (BasicNotification notification) => ShowSnackBar(
            title: notification.title,
            titleLocArgs: notification.titleLocArgs,
            body: notification.body,
            bodyLocArgs: notification.bodyLocArgs,
          ),
      routableNotification: (RoutableNotification notification) => NotificationToNavigate(
            path: notification.path,
          ));
}
