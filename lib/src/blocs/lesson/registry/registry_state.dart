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

  const factory RegistryState.registryLoaded({
    @required int classCapacity,
    @required User currentUser,
    @required bool isAcceptedUser,
    @required bool isRegisteredUser,
    @required bool isFullRegistry,
    @required List<Attendee> attendees,
    @required List<Attendee> acceptedAttendees,
  }) = RegistryLoaded;
}
