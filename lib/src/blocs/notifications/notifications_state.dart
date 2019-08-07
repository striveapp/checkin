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

class NotificationsLoaded extends NotificationsState {
  Notification notification;

  NotificationsLoaded({
    this.notification,
  }) : super([notification]);

  @override
  String toString() => 'NotificationsLoaded';
}