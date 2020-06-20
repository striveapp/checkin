import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registry_state.freezed.dart';

@freezed
abstract class RegistryState with _$RegistryState {
  const factory RegistryState.registryUninitialized() = RegistryUninitialized;
  const factory RegistryState.registryLoading() = RegistryLoading;
  const factory RegistryState.registryError() = RegistryError;
  const factory RegistryState.registryLoaded({int classCapacity, List<Attendee> attendees, List<Attendee> acceptedAttendees, User currentUser}) = RegistryLoaded;
}

extension RegistryLoadedExtension on RegistryLoaded {
  bool isAcceptedUser(String email) {
    return acceptedAttendees.any((attendee) => attendee.email == email);
  }

  Attendee getRegisteredUser(String email) {
    // TODO: we should use some kind of id to perform this check not the email https://trello.com/c/j5sAVRXJ
    Iterable<Attendee> attendeeFromEmail = attendees.where((attendee) => attendee.email == email);
    if(attendeeFromEmail.isEmpty) {
      return null;
    }
    return attendeeFromEmail.first;
  }

  bool isRegisteredUser(String email) {
    // TODO: we should use some kind of id to perform this check not the email https://trello.com/c/j5sAVRXJ
    return attendees.any((attendee) => attendee.email == email);
  }

  bool isFullRegistry() {
    return attendees.length + acceptedAttendees.length >= classCapacity;
  }
}
