import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {
  NotificationsEvent([List props = const []]) : super(props);
}

class Setup extends NotificationsEvent {
  @override
  String toString() => 'Setup';
}

class ShowDialog extends NotificationsEvent {
  Map<String, dynamic> message;

  ShowDialog({
    this.message
  }) : super([message]);

  @override
  String toString() => 'ShowDialog';
}