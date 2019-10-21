import 'package:checkin/src/models/notification.dart';
import 'package:equatable/equatable.dart';

abstract class NotificationsState extends Equatable {
  NotificationsState([List props = const []]) : super(props);
}

class NotificationsUninitialized extends NotificationsState {
  @override
  String toString() => 'NotificationsUninitialized';
}

class NotificationsInitialized extends NotificationsState {
  @override
  String toString() => 'NotificationsInitialized';
}

class BasicNotificationsLoaded extends NotificationsState {
  BasicNotification notification;

  BasicNotificationsLoaded({
    this.notification,
  }) : super([notification]);

  @override
  String toString() => 'BasicNotificationsLoaded';
}

class ActionNotificationsLoaded extends NotificationsState {
  String lessonId;

  ActionNotificationsLoaded({
    this.lessonId,
  }) : super([lessonId]);

  @override
  String toString() => 'ActionNotificationsLoaded';
}