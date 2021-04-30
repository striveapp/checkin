import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_gym_event.freezed.dart';

@freezed
abstract class SwitchGymsEvent {
  const factory SwitchGymsEvent.initializeSwitchGym() = InitializeSwitchGym;

  const factory SwitchGymsEvent.switchGymUpdated({
    @required Gym selectedGym,
    @required User currentUser,
    @required List<String> knowGymsIds,
  }) = SwitchGymUpdated;
}
