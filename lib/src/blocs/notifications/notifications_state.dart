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

class NotificationsMessage extends NotificationsState {
  Map<String, dynamic> message;

  NotificationsMessage({
    this.message,
  }) : super([message]);

  @override
  String toString() => 'NotificationsMessage';
}