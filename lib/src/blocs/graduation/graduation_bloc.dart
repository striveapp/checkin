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

  final String userToGraduateEmail;

  StreamSubscription<GraduationSystem> graduationSystemSub;
  StreamSubscription<UserHistory> statsSub;
  StreamSubscription<User> currentUserSub;
  StreamSubscription<User> userToGraduateSub;

  GraduationBloc({
    @required this.graduationSystemRepository,
    @required this.statsRepository,
    @required this.userRepository,
    @required this.graduationUtils,
    @required this.userToGraduateEmail,
  }) : super(InitialGraduationState());

  void _onCurrentUserChanged(User currentUser) {
    userToGraduateSub?.cancel();
    userToGraduateSub = userRepository.getUserByEmail(userToGraduateEmail).listen((userToGraduate) {
      graduationSystemSub?.cancel();
      graduationSystemSub = graduationSystemRepository
          .getGraduationSystem(userToGraduate.selectedGymId, userToGraduate.grade)
          .listen((graduationSystem) {
        statsSub?.cancel();
        statsSub = statsRepository
            .getUserStatsByGrade(
          userToGraduate.selectedGymId,
          userToGraduate.email,
          userToGraduate.grade,
        )
            .listen((history) {
          add(GraduationSystemUpdated(
            attendedLessonsForGrade: history.attendedLessons.length,
            forNextLevel: graduationSystem.forNextLevel,
            currentGrade: userToGraduate.grade,
            nextGrade: graduationUtils.calculateNextGrade(userToGraduate.grade),
            isVisible: currentUser.isOwner && userToGraduate != currentUser,
          ));
        });
      });
    });
  }

  @override
  Stream<GraduationState> mapEventToState(
    GraduationEvent event,
  ) async* {
    if (event is InitializeGraduation) {
      currentUserSub?.cancel();
      currentUserSub = userRepository.getUser().listen(_onCurrentUserChanged);
    }

    if (event is GraduationSystemUpdated) {
      yield GraduationLoaded(
        currentGrade: event.currentGrade,
        nextGrade: event.nextGrade,
        forNextLevel: event.forNextLevel,
        attendedLessonsForGrade: event.attendedLessonsForGrade,
        isVisible: event.isVisible,
      );
    }

    if (event is Graduate) {
      await userRepository.updateGrade(userToGraduateEmail, event.newGrade);
    }
  }

  @override
  Future<void> close() {
    graduationSystemSub?.cancel();
    statsSub?.cancel();
    currentUserSub?.cancel();
    return super.close();
  }
}
