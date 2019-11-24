import 'package:checkin/src/models/notification.dart';
import 'package:equatable/equatable.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
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
  final BasicNotification notification;

  const BasicNotificationsLoaded({
    this.notification,
  });

  @override
  List<Object> get props => [notification];

  @override
  String toString() => 'BasicNotificationsLoaded';
}

class ActionNotificationsLoaded extends NotificationsState {
  final String lessonId;

  const ActionNotificationsLoaded({
    this.lessonId,
  });

  @override
  List<Object> get props => [lessonId];

  @override
  String toString() => 'ActionNotificationsLoaded';
}
