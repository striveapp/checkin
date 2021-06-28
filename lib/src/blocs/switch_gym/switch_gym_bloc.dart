// @dart=2.9

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/switch_gym/switch_gym_event.dart';
import 'package:checkin/src/blocs/switch_gym/switch_gym_state.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class SwitchGymBloc extends Bloc<SwitchGymsEvent, SwitchGymsState> {
  final UserRepository userRepository;
  final GymRepository gymRepository;

  StreamSubscription<User> _userSub;
  StreamSubscription<Gym> _gymSub;

  SwitchGymBloc({
    @required this.userRepository,
    @required this.gymRepository,
  }) : super(SwitchGymsInitial());

  @override
  Stream<SwitchGymsState> mapEventToState(
    SwitchGymsEvent event,
  ) async* {
    if (event is InitializeSwitchGym) {
      _userSub?.cancel();
      _userSub = userRepository.getUser().listen((currentUser) {
        _gymSub?.cancel();
        _gymSub = gymRepository.getGym().listen((currentGym) {
          add(SwitchGymUpdated(
            selectedGym: currentGym,
            currentUser: currentUser,
            knowGymsIds: currentUser.knownGymIds,
          ));
        });
      });
    }

    if (event is SwitchGymUpdated) {
      yield SwitchGymsState.knownGymsLoaded(
        selectedGym: event.selectedGym,
        currentUser: event.currentUser,
        knowGymsIds: event.knowGymsIds,
        showDropdown: event.knowGymsIds.length > 1,
      );
    }
  }

  @override
  Future<void> close() {
    _userSub?.cancel();
    _gymSub?.cancel();
    return super.close();
  }
}
