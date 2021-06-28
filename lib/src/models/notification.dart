import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@freezed
abstract class Notification with _$Notification {
  factory Notification.basicNotification({
    required final String title,
    final List<String>? titleLocArgs,
    required final String body,
    final List<String>? bodyLocArgs,
  }) = BasicNotification;

  factory Notification.routableNotification({
    required final String title,
    required final String path,
  }) = RoutableNotification;
}
