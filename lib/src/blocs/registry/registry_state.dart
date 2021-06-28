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
    required User currentUser,
    required Lesson currentLesson,
    @Default(false) bool isAcceptedUser,
    @Default(false) bool isRegisteredUser,
    @Default(false) bool isFullRegistry,
    @Default(false) bool isEmptyRegistry,
    @Default(false) bool isMasterOfTheClass,
    @Default(false) isClosedRegistry,
    DateTime? nocache,
  }) = RegistryLoaded;
}
