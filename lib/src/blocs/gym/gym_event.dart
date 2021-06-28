import 'package:checkin/src/models/gym.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'gym_event.freezed.dart';

@freezed
class GymEvent with _$GymEvent {
  const factory GymEvent.gymUpdated({required Gym gym}) = GymUpdated;
  const factory GymEvent.initializeGym() = InitializeGym;
}
