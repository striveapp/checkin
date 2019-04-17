import 'package:equatable/equatable.dart';

abstract class ClassEvent extends Equatable {
  ClassEvent([List props = const []]) : super(props);
}

class Attend extends ClassEvent {
  String name;

  Attend({
    this.name,
  }) : super([name]);

  @override
  String toString() => 'Attend';
}

class Clear extends ClassEvent {
  @override
  String toString() => 'Clear';
}

class Remove extends ClassEvent {
  @override
  String toString() => 'Remove';
}

class AttendeesUpdated extends ClassEvent {
  
  final List<String> attendees;

  AttendeesUpdated({
    this.attendees,
  }) : super([attendees]);
  
  @override
  String toString() => 'Fetch';
}
