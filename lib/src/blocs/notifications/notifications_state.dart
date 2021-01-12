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

class NotificationToDialog extends NotificationsState {
  final BasicNotification notification;

  const NotificationToDialog({
    this.notification,
  });

  @override
  List<Object> get props => [notification];

  @override
  String toString() => 'BasicNotificationsLoaded';
}

class NotificationToNavigate extends NotificationsState {
  final String path;

  const NotificationToNavigate({this.path});

  @override
  List<Object> get props => [path];

  @override
  String toString() => 'NotificationToNavigate';
}
