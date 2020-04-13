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
  }) {
    statsBloc.listen((statsBlocState) {
      if (statsBlocState is TimespanUpdated) {
        lessonsSub?.cancel();
        lessonsSub = this.lessonsRepository.getLessonsByMasterAndTimespan(this.master, statsBlocState.timespan).listen((lessons) {
          add(UpdateLessonStats(lessons: lessons));
        });
      }
    });
  }

  @override
  LessonsStatsState get initialState => LessonsStatsInitial();

  @override
  Stream<LessonsStatsState> mapEventToState(
    LessonsStatsEvent event,
  ) async* {
    if (event is UpdateLessonStats) {
      List<Attendee> acceptedAttendees = event.lessons.expand((lesson) => lesson.acceptedAttendees).toList();
      yield LessonStatsUpdated(acceptedAttendees: acceptedAttendees);
    }
  }
}
