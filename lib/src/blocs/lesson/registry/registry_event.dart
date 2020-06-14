import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registry_event.freezed.dart';

@freezed
abstract class RegistryEvent with _$RegistryEvent {
  const factory RegistryEvent.registryUpdated({int classCapacity, List<Attendee> attendees, List<Attendee> acceptedAttendees, User currentUser}) = RegistryUpdated;
  const factory RegistryEvent.register({Attendee attendee}) = Register;
  const factory RegistryEvent.unregister({Attendee attendee}) = Unregister;
  const factory RegistryEvent.acceptAttendees() = AcceptAttendees;
}
