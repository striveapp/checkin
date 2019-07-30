import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  NotificationEvent([List props = const []]) : super(props);
}

class ShowDialog extends NotificationEvent {
  Map<String, dynamic> message;

  ShowDialog({
    this.message
  }) : super([message]);

  @override
  String toString() => 'ShowDialog';
}