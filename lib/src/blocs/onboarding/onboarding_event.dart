import 'package:checkin/src/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event.freezed.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.initializeOnboarding() = InitializeOnboarding;

  const factory OnboardingEvent.userUpdated({User? user}) = UserUpdated;
}
