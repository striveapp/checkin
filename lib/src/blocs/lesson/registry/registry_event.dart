import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class RegistryEvent extends Equatable {
  const RegistryEvent();

  @override
  List<Object> get props => [];
}

class RegistryUpdated extends RegistryEvent {
  final List<Attendee> attendees;
  final List<Attendee> acceptedAttendees;
  final User currentUser;


  RegistryUpdated({this.attendees, this.acceptedAttendees, this.currentUser});

  @override
  List<Object> get props => [attendees, acceptedAttendees, currentUser];

  @override
  String toString() => 'LessonUpdated';
}

class Register extends RegistryEvent {
  final Attendee attendee;

  const Register({
    @required this.attendee,
  });

  @override
  List<Object> get props => [attendee];

  @override
  String toString() => 'Register{attendee: $attendee}';
}

class Unregister extends RegistryEvent {
  final Attendee attendee;

  const Unregister({
    @required this.attendee,
  });

  @override
  List<Object> get props => [attendee];

  @override
  String toString() => 'Unregister{attendee: $attendee}';
}

class ConfirmAttendees extends RegistryEvent {

  @override
  String toString() => 'ConfirmAttendees';
}
