import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class ClassState extends Equatable {
  ClassState([List props = const []]) : super(props);
}

class ClassUninitialized extends ClassState {
  @override
  String toString() => 'ClassUninitialized';
}

class ClassError extends ClassState {
  @override
  String toString() => 'ClassError';
}

class ClassLoaded extends ClassState {

  final List<User> attendees;

  ClassLoaded({
    this.attendees,
  }) : super([attendees]);

  @override
  String toString() => 'ClassLoaded';
}