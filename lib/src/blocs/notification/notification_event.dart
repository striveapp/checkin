import 'package:checkin/src/models/notification.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'notification_event.freezed.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.initializeNotifications() = InitializeNotifications;

  const factory NotificationEvent.updateToken({String? loggedUserEmail}) = UpdateToken;

  const factory NotificationEvent.messageOpenedApp({Notification? notification}) = MessageOpenedApp;

  const factory NotificationEvent.message({Notification? notification}) = Message;
}
