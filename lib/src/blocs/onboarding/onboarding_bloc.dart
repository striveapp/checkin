import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/onboarding/onboarding_event.dart';
import 'package:checkin/src/blocs/onboarding/onboarding_state.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final UserRepository userRepository;

  StreamSubscription<User>? _userSub;

  OnboardingBloc({
    required this.userRepository,
  }) : super(OnboardingInitial());

  @override
  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    if (event is InitializeOnboarding) {
      _userSub?.cancel();
      _userSub = userRepository.getUser().listen((user) {
        add(UserUpdated(user: user));
      });
    }

    if (event is UserUpdated) {
      if (event.user?.selectedGymId == DEMO_GYM_ID) {
        yield ShowDialog();
      }
    }
  }

  @override
  Future<void> close() {
    _userSub?.cancel();
    return super.close();
  }
}
