// @dart=2.9

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:flutter/foundation.dart';

import './bloc.dart';

class GymBloc extends Bloc<GymEvent, GymState> {
  final GymRepository gymRepository;
  final String gymId;

  StreamSubscription<Gym> gymSub;

  GymBloc({
    @required this.gymRepository,
    this.gymId,
  }) : super(InitialGymState());

  void _onGymUpdated(Gym gym) {
    add(GymUpdated(gym: gym));
  }

  @override
  Stream<GymState> mapEventToState(
    GymEvent event,
  ) async* {
    if (event is InitializeGym) {
      if (gymId != null) {
        gymSub?.cancel();
        gymSub = gymRepository.getGymById(gymId).listen(_onGymUpdated);
      } else {
        gymSub?.cancel();
        gymSub = gymRepository.getGym().listen(_onGymUpdated);
      }
    }

    if (event is GymUpdated) {
      yield GymLoaded(gym: event.gym);
    }
  }

  @override
  Future<void> close() {
    gymSub?.cancel();
    return super.close();
  }
}
