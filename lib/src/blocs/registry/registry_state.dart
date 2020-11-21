import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registry_state.freezed.dart';

@freezed
abstract class RegistryState with _$RegistryState {
  const factory RegistryState.registryUninitialized() = RegistryUninitialized;

  const factory RegistryState.registryLoading() = RegistryLoading;

  const factory RegistryState.registryError() = RegistryError;

  const factory RegistryState.registryMissing() = RegistryMissing;

  const factory RegistryState.registryLoaded({
    @required User currentUser,
    @required Lesson currentLesson,
    @required bool isAcceptedUser,
    @required bool isRegisteredUser,
    @required bool isFullRegistry,
    @required bool isEmptyRegistry,
    @required bool isMasterOfTheClass,
  }) = RegistryLoaded;

}
