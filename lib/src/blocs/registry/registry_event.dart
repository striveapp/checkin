import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registry_event.freezed.dart';

@freezed
abstract class RegistryEvent with _$RegistryEvent {
  const factory RegistryEvent.initializeRegistry() = InitializeRegistry;

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

  const factory RegistryEvent.deleteLesson({
    @required String gymId,
  }) = DeleteLesson;

  const factory RegistryEvent.updateTimeStart({
    @required String gymId,
    @required String newTimeStart,
  }) = UpdateTimeStart;

  const factory RegistryEvent.updateTimeEnd({
    @required String gymId,
    @required String newTimeEnd,
  }) = UpdateTimeEnd;

  const factory RegistryEvent.updateName({
    @required String gymId,
    @required String newName,
  }) = UpdateName;

  const factory RegistryEvent.updateCapacity({
    @required String gymId,
    @required int newCapacity,
  }) = UpdateCapacity;

  const factory RegistryEvent.updateImageUrl({
    @required String gymId,
  }) = UpdateImageUrl;

  const factory RegistryEvent.updateMasters({
    @required String gymId,
    @required List<Master> newMasters,
  }) = UpdateMasters;
}
