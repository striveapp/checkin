import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';

import './bloc.dart';

class GymBloc extends Bloc<GymEvent, GymState> {
  final GymRepository gymRepository;
  final UserRepository userRepository;
  final String gymId;
  StreamSubscription<User> _userSub;

  StreamSubscription<Gym> gymSub;

  GymBloc({
    @required this.gymRepository,
    this.userRepository,
    this.gymId,
  }) : super(InitialGymState());

  void _onUserStateChanged(userState) {
    if (userState is UserSuccess) {
      gymSub?.cancel();
      gymSub = gymRepository.getGym().listen((gym) {
        add(GymUpdated(gym: gym));
      });
    }
  }

  @override
  Stream<GymState> mapEventToState(
    GymEvent event,
  ) async* {
    if (event is InitializeGym) {
      if (userRepository != null) {
        _userSub?.cancel();
        _userSub = userRepository.getUser().listen(_onUserStateChanged);
      } else {
        gymSub?.cancel();
        gymSub = gymRepository.getGym().listen((gym) {
          add(GymUpdated(gym: gym));
        });
      }
    }

    if (event is GymUpdated) {
      yield GymLoaded(gym: event.gym);
    }
  }

  @override
  Future<void> close() {
    gymSub?.cancel();
    _userSub?.cancel();
    return super.close();
  }
}
