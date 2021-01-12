import 'package:checkin/src/models/notification.dart';
import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class Setup extends NotificationsEvent {
  @override
  String toString() => 'Setup';
}

class ShowDialog extends NotificationsEvent {
  final BasicNotification notification;

  const ShowDialog({this.notification});

  @override
  List<Object> get props => [notification];

  @override
  String toString() => 'ShowDialog';
}

class NotificationOpened extends NotificationsEvent {
  final String path;

  const NotificationOpened({this.path});

  @override
  List<Object> get props => [path];

  @override
  String toString() => 'NotificationOpened';
}
