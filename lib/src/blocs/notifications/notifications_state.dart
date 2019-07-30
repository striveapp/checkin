import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {
  NotificationState([List props = const []]) : super(props);
}

class NotificationUninitialized extends NotificationState {
  @override
  String toString() => 'NotificationUninitialized';
}

class NotificationMessage extends NotificationState {
  Map<String, dynamic> message;

  NotificationMessage({
    this.message,
  }) : super([message]);

  @override
  String toString() => 'NotificationMessage';
}