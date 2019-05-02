import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class ClassEvent extends Equatable {
  ClassEvent([List props = const []]) : super(props);
}

class Attend extends ClassEvent {
  User attendee;

  Attend({
    this.attendee,
  }) : super([attendee]);

  @override
  String toString() => 'Attend';
}

class Confirm extends ClassEvent {
  List<User> attendees;

  Confirm({
    this.attendees,
  }) : super([attendees]);
  @override
  String toString() => 'Confirm';
}

class Remove extends ClassEvent {
  @override
  String toString() => 'Remove';
}

class AttendeesUpdated extends ClassEvent {

  final List<User> attendees;

  AttendeesUpdated({
    this.attendees,
  }) : super([attendees]);

  @override
  String toString() => 'Fetch';
}
