import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/graduation_system.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/graduation_util.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class GraduationBloc extends Bloc<GraduationEvent, GraduationState> {
  final GraduationSystemRepository graduationSystemRepository;
  final StatsRepository statsRepository;
  final UserRepository userRepository;
  final GraduationUtil graduationUtils;

  final String userEmail;

  StreamSubscription<GraduationSystem> graduationSystemSub;
  StreamSubscription<UserHistory> statsSub;
  StreamSubscription<User> userSub;

  GraduationBloc({
    @required this.graduationSystemRepository,
    @required this.statsRepository,
    @required this.userRepository,
    @required this.graduationUtils,
    @required this.userEmail,
  }) : super(InitialGraduationState());

  void _onUserChanged(User user) {
    graduationSystemSub?.cancel();
    graduationSystemSub = graduationSystemRepository
        .getGraduationSystem(user.selectedGymId, user.grade)
        .listen((graduationSystem) {
      statsSub?.cancel();
      statsSub = statsRepository
          .getUserStatsByGrade(
        user.selectedGymId,
        user.email,
        user.grade,
      )
          .listen((history) {
        add(GraduationSystemUpdated(
          attendedLessonsForGrade: history.attendedLessons.length,
          forNextLevel: graduationSystem.forNextLevel,
          nextGrade: graduationUtils.calculateNextGrade(user.grade),
        ));
      });
    });
  }

  @override
  Stream<GraduationState> mapEventToState(
    GraduationEvent event,
  ) async* {
    if (event is InitializeGraduation) {
      userSub?.cancel();
      userSub = userRepository.getUserByEmail(userEmail).listen(_onUserChanged);
    }

    if (event is GraduationSystemUpdated) {
      yield GraduationLoaded(
        nextGrade: event.nextGrade,
        forNextLevel: event.forNextLevel,
        attendedLessonsForGrade: event.attendedLessonsForGrade,
      );
    }

    if (event is Graduate) {
      yield GraduationLoading();
      await userRepository.updateGrade(userEmail, event.newGrade);
    }
  }

  @override
  Future<void> close() {
    graduationSystemSub?.cancel();
    statsSub?.cancel();
    userSub?.cancel();
    return super.close();
  }
}
