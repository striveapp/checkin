import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'notification_state.freezed.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState.notificationInitial() = NotificationInitial;
  const factory NotificationState.notificationToNavigate({@required String path}) =
      NotificationToNavigate;

  const factory NotificationState.showSnackBar({
    @required String title,
    List<String> titleLocArgs,
    @required String body,
    List<String> bodyLocArgs,
  }) = ShowSnackBar;
}
