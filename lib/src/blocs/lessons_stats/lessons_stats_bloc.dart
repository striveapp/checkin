import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';

class LessonsStatsBloc extends Bloc<LessonsStatsEvent, LessonsStatsState> {
  final LessonRepository lessonsRepository;
  final StatsBloc statsBloc;
  final Master master;

  StreamSubscription<List<Lesson>> lessonsSub;

  LessonsStatsBloc({
    this.lessonsRepository,
    this.statsBloc,
    this.master,
  }) : super(LessonsStatsInitial()) {
    _onStatsStateChanged(statsBloc.state);
    statsBloc.listen(_onStatsStateChanged);
  }

  void _onStatsStateChanged(statsBlocState) {
    if (statsBlocState is TimespanUpdated) {
      lessonsSub?.cancel();
      lessonsSub = this
          .lessonsRepository
          .getLessonsByMasterAndTimespan(this.master, statsBlocState.timespan)
          .listen((lessons) => add(UpdateLessonsStats(lessons: lessons)));
    }
  }

  @override
  Stream<LessonsStatsState> mapEventToState(
    LessonsStatsEvent event,
  ) async* {
    if (event is UpdateLessonsStats) {
      var acceptedAttendees = event.lessons.expand((lesson) => lesson.acceptedAttendees);
      yield LessonsStatsUpdated(
        acceptedAttendeesWithCounter: _getAttendeesWithCounter(acceptedAttendees),
        totalAttendees: acceptedAttendees.length,
      );
    }
  }

  Map<Attendee, int> _getAttendeesWithCounter(Iterable<Attendee> acceptedAttendees) {
    Map<Attendee, int> acceptedAttendeesWithCounterMap = {};

    acceptedAttendees.forEach((acceptedAttendee) {
      if (acceptedAttendeesWithCounterMap.containsKey(acceptedAttendee)) {
        acceptedAttendeesWithCounterMap[acceptedAttendee] += 1;
      } else {
        acceptedAttendeesWithCounterMap[acceptedAttendee] = 1;
      }
    });
    return acceptedAttendeesWithCounterMap;
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
