import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'notification_event.freezed.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.initializeNotifications() = InitializeNotifications;

  const factory NotificationEvent.updateToken({String loggedUserEmail}) = UpdateToken;
}
