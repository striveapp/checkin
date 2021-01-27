import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:flutter/foundation.dart';

import './bloc.dart';

class GymBloc extends Bloc<GymEvent, GymState> {
  final GymRepository gymRepository;
  final UserBloc userBloc;
  final String gymId;

  StreamSubscription<Gym> gymSub;

  GymBloc({
    @required this.gymRepository,
    this.userBloc,
    this.gymId,
  }) : super(InitialGymState());

  void _onUserStateChanged(userState) {
    if (userState is UserSuccess) {
      gymSub?.cancel();
      gymSub = gymRepository.getGym(userState.currentUser.selectedGymId).listen((gym) {
        add(GymUpdated(gym: gym));
      });
    }
  }

  @override
  Stream<GymState> mapEventToState(
    GymEvent event,
  ) async* {
    if (event is InitializeGym) {
      if(userBloc != null){
        _onUserStateChanged(userBloc.state);
        userBloc.listen(_onUserStateChanged);
      }
      else {
        gymSub?.cancel();
        gymSub = gymRepository.getGym(gymId).listen((gym) {
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
    return super.close();
  }
}
