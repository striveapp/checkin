import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class RegistryState extends Equatable {
  const RegistryState();

  @override
  List<Object> get props => [];
}

class RegistryUninitialized extends RegistryState {
  @override
  String toString() => 'RegistryUninitialized';
}

class RegistryLoading extends RegistryState {
  @override
  String toString() => 'RegistryLoading';
}

class RegistryError extends RegistryState {
  @override
  String toString() => 'RegistryError';
}

class RegistryLoaded extends RegistryState {
  final List<Attendee> attendees;
  final List<Attendee> acceptedAttendees;
  final User currentUser;

  RegistryLoaded({this.attendees, this.acceptedAttendees, this.currentUser});

  @override
  List<Object> get props => [attendees, acceptedAttendees, currentUser];

  bool isUserAccepted(String email) {
    return acceptedAttendees.any((attendee) => attendee.email == email);
  }

  bool isUserRegistered(String email) {
    // TODO: we should use some kind of id to perform this check not the email https://trello.com/c/j5sAVRXJ
    return attendees.any((attendee) => attendee.email == email);
  }

  @override
  String toString() {
    return 'RegistryLoaded{attendees: $attendees, acceptedAttendees: $acceptedAttendees, currentUser: $currentUser}';
  }
}
