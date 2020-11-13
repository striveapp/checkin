import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/graduation_system.dart';
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

  final String gymId;
  final String userEmail;
  final Grade userGrade;

  StreamSubscription<GraduationSystem> graduationSystemSub;
  StreamSubscription<UserHistory> statsSub;

  GraduationBloc({
    @required this.graduationSystemRepository,
    @required this.statsRepository,
    @required this.userRepository,
    @required this.graduationUtils,
    @required this.gymId,
    @required this.userEmail,
    @required this.userGrade,
  }) : super(InitialGraduationState()) {
    graduationSystemSub?.cancel();

    graduationSystemSub =
        graduationSystemRepository.getGraduationSystem(gymId, userGrade).listen((graduationSystem) {
      statsSub?.cancel();

      statsSub = statsRepository.getUserStatsByGrade(gymId, userEmail, userGrade).listen((history) {
        add(GraduationSystemUpdated(
            attendedLessonsForGrade: history.attendedLessons.length,
            graduationSystem: graduationSystem));
      });
    });
  }

  @override
  Stream<GraduationState> mapEventToState(
    GraduationEvent event,
  ) async* {
    if (event is GraduationSystemUpdated) {
      Grade nextGrade = graduationUtils.calculateNextGrade(this.userGrade);
      if (event.attendedLessonsForGrade >= event.graduationSystem.forNextLevel) {
        yield ReadyForGraduation(nextGrade: nextGrade);
      } else {
        yield NotReadyForGraduation(nextGrade: nextGrade);
      }
    }

    if (event is Graduate) {
      yield GraduationLoading();
      await userRepository.updateGrade(userEmail, event.newGrade);
      // todo why we reload here? should receive the updates user and regenerate a GraduationSystemUpdated event
      var calculateNextGrade = graduationUtils.calculateNextGrade(event.newGrade);
      yield NotReadyForGraduation(
        nextGrade: calculateNextGrade,
      );
    }
  }

  @override
  Future<void> close() {
    graduationSystemSub?.cancel();
    return super.close();
  }
}
