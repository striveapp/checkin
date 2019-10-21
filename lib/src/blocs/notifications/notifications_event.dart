import 'package:checkin/src/models/notification.dart';
import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {
  NotificationsEvent([List props = const []]) : super(props);
}

class Setup extends NotificationsEvent {
  @override
  String toString() => 'Setup';
}

class ShowDialog extends NotificationsEvent {
  BasicNotification notification;

  ShowDialog({
    this.notification
  }) : super([notification]);

  @override
  String toString() => 'ShowDialog';
}

class GoToLesson extends NotificationsEvent {
  String lessonId;

  GoToLesson({
    this.lessonId
  }) : super([lessonId]);

  @override
  String toString() => 'GoToLesson';
}