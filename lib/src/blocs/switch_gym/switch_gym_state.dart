import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_gym_state.freezed.dart';

@freezed
class SwitchGymsState with _$SwitchGymsState {
  const factory SwitchGymsState.switchGymsInitial() = SwitchGymsInitial;

  const factory SwitchGymsState.knownGymsLoaded({
    required Gym selectedGym,
    required User currentUser,
    required List<String> knowGymsIds,
    @Default(false) bool showDropdown,
  }) = KnownGymsLoaded;
}
