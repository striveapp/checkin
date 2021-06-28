import 'package:checkin/src/models/gym.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'gym_state.freezed.dart';

@freezed
abstract class GymState with _$GymState {
  const factory GymState.initialGymState() = InitialGymState;
  const factory GymState.gymLoaded({required Gym gym}) = GymLoaded;
}
