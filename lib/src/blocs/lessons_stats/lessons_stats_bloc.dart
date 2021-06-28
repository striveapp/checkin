// @dart=2.9

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/attendee_with_counter.dart';
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
          .listen((lessons) => add(UpdateLessonsStats(
                lessons: lessons,
              )));
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
        attendeesWithCounter: _retrieveAttendeesWithCounter(acceptedAttendees),
        totalAttendees: acceptedAttendees.length,
      );
    }
  }

  List<AttendeeWithCounter> _retrieveAttendeesWithCounter(
    Iterable<Attendee> acceptedAttendees,
  ) {
    Map<String, AttendeeWithCounter> attendeesWithCounterMap = {};

    acceptedAttendees.map((a) => a.email).forEach((email) {
      if (attendeesWithCounterMap.containsKey(email)) {
        var attendeeWithCounter = attendeesWithCounterMap[email];
        attendeesWithCounterMap[email] =
            attendeeWithCounter.copyWith(counter: attendeeWithCounter.counter + 1);
      } else {
        attendeesWithCounterMap[email] = AttendeeWithCounter(email: email, counter: 1);
      }
    });

    return attendeesWithCounterMap.values.toList(growable: false)
      ..sort((value, other) => other.compareTo(value));
  }

  @override
  Future<void> close() {
    lessonsSub?.cancel();
    gymSub?.cancel();
    return super.close();
  }
}
