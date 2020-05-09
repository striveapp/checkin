import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:flutter/foundation.dart';

import './bloc.dart';

class GymBloc extends Bloc<GymEvent, GymState> {
  @override
  GymState get initialState => InitialGymState();

  final GymRepository gymRepository;
  final String gymId;

  StreamSubscription<Gym> gymSub;

  GymBloc({
    @required this.gymId,
    @required this.gymRepository,
  }) {
    gymSub?.cancel();
    gymSub = gymRepository.getGym(gymId).listen((gym) {
      add(GymUpdated(gym: gym));
    });
  }

  @override
  Stream<GymState> mapEventToState(
    GymEvent event,
  ) async* {
    if (event is GymUpdated) {
      yield GymLoaded(gym: event.gym);
    }
  }
}
