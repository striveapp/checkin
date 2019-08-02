import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final UserBloc userBloc;
  final FirebaseMessaging notificationProvider;
  StreamSubscription _iosSubscription;

  NotificationsBloc({
    @required this.notificationProvider,
    @required this.userBloc
  }) {
    notificationProvider.configure(onMessage: _onMessage);
  }

  @override
  NotificationsState get initialState => NotificationsUninitialized();

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    if (event is Setup)  {
      await _setupNotifications();
      yield NotificationsInitialized();
    }
    if (event is ShowDialog) {
      yield NotificationsMessage(message: event.message);
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
      _iosSubscription = notificationProvider.onIosSettingsRegistered.listen((data) async {
        await _saveDeviceToken();
      });

      notificationProvider.requestNotificationPermissions(IosNotificationSettings());
    } else {
      await _saveDeviceToken();
    }
  }

  Future _onMessage(Map<String, dynamic> message) async {
    debugPrint("Push notification received with message: $message");
    dispatch(ShowDialog(message: message));
  }
}
