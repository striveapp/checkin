import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/notification/notification_event.dart';
import 'package:checkin/src/blocs/notification/notification_state.dart';
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

      await notificationRepository.getInitialMessage();
      notificationRepository.onMessageOpenedApp();
      notificationRepository.onMessage();
    }

    if (event is UpdateToken) {
      var fcmToken = await notificationRepository.getToken();
      await userRepository.updateUserFcmToken(event.loggedUserEmail, fcmToken);
    }
  }
}
