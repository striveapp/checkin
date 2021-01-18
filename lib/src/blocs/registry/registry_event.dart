import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registry_event.freezed.dart';

@freezed
abstract class RegistryEvent with _$RegistryEvent {
  const factory RegistryEvent.registryUpdated({@required User currentUser, Lesson currentLesson}) =
      RegistryUpdated;

  const factory RegistryEvent.register({
    @required String gymId,
    @required Attendee attendee,
  }) = Register;

  const factory RegistryEvent.unregister({
    @required String gymId,
    @required Attendee attendee,
  }) = Unregister;

  const factory RegistryEvent.acceptAttendees({@required String gymId}) = AcceptAttendees;

  const factory RegistryEvent.closeLesson({
    @required String gymId,
  }) = CloseLesson;
}
