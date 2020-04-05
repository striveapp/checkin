import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/date_util.dart';


class LessonsStatsBloc extends Bloc<LessonsStatsEvent, LessonsStatsState> {
  final LessonRepository lessonsRepository;
  final DateUtil dateUtil;
  final StatsBloc statsBloc;
  final Master master;

  StreamSubscription<List<Lesson>> lessonsSub;

  LessonsStatsBloc({
    this.lessonsRepository,
    this.dateUtil,
    this.statsBloc,
    this.master,
  }) {
    statsBloc.listen((statsBlocState) {
      if (statsBlocState is TimespanUpdated) {
        var fromTimespan = dateUtil
            .getFirstDayOfTimespan(statsBlocState.timespan);
        lessonsSub?.cancel();
        lessonsSub = this.lessonsRepository.getLessonsByMasterAndTimespan(this.master, fromTimespan).listen((lessons) {
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
