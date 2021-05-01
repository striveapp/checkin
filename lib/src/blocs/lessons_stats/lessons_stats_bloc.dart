import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter/material.dart';

class LessonsStatsBloc extends Bloc<LessonsStatsEvent, LessonsStatsState> {
  final LessonRepository lessonsRepository;
  final GymRepository gymRepository;
  final StatsBloc statsBloc;
  final Master master;

  StreamSubscription<List<Lesson>> lessonsSub;
  StreamSubscription<Gym> gymSub;

  LessonsStatsBloc({
    @required this.lessonsRepository,
    @required this.gymRepository,
    @required this.statsBloc,
    @required this.master,
  }) : super(LessonsStatsInitial());

  void _onStatsStateChanged(statsBlocState, Gym gym) {
    if (statsBlocState is TimespanUpdated) {
      lessonsSub?.cancel();
      lessonsSub = this
          .lessonsRepository
          .getLessonsByMasterAndTimespan(
            this.master,
            statsBlocState.timespan,
            gym.id,
          )
          .listen((lessons) => add(UpdateLessonsStats(lessons: lessons)));
    }
  }

  @override
  Stream<LessonsStatsState> mapEventToState(
    LessonsStatsEvent event,
  ) async* {
    if (event is InitializeLessonsStats) {
      gymSub = gymRepository.getGym().listen((gym) {
        _onStatsStateChanged(statsBloc.state, gym);
        statsBloc.stream.listen((statsBlocState) => _onStatsStateChanged(statsBlocState, gym));
      });
    }

    if (event is UpdateLessonsStats) {
      var acceptedAttendees = event.lessons.expand((lesson) => lesson.acceptedAttendees);
      yield LessonsStatsUpdated(
        acceptedAttendeesWithCounter: _getAttendeesWithCounter(acceptedAttendees),
        totalAttendees: acceptedAttendees.length,
      );
    }
  }

  LinkedHashMap<Attendee, int> _getAttendeesWithCounter(
    Iterable<Attendee> acceptedAttendees,
  ) {
    Map<Attendee, int> acceptedAttendeesWithCounterMap = {};

    acceptedAttendees.forEach((acceptedAttendee) {
      if (acceptedAttendeesWithCounterMap.containsKey(acceptedAttendee)) {
        acceptedAttendeesWithCounterMap[acceptedAttendee] += 1;
      } else {
        acceptedAttendeesWithCounterMap[acceptedAttendee] = 1;
      }
    });

    var sortedKeys = acceptedAttendeesWithCounterMap.keys.toList(growable: false)
      ..sort((k1, k2) =>
          acceptedAttendeesWithCounterMap[k2].compareTo(acceptedAttendeesWithCounterMap[k1]));
    LinkedHashMap<Attendee, int> sortedMap = new LinkedHashMap.fromIterable(
      sortedKeys,
      key: (k) => k,
      value: (k) => acceptedAttendeesWithCounterMap[k],
    );

    return sortedMap;
  }

  @override
  Future<void> close() {
    lessonsSub?.cancel();
    gymSub?.cancel();
    return super.close();
  }
}
