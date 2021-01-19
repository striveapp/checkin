import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final LessonRepository lessonRepository;
  final UserBloc userBloc;
  final DateUtil dateUtil;

  StreamSubscription<List<Lesson>> lessonsSub;
  String gymId;

  LessonsBloc({
    @required this.userBloc,
    @required this.lessonRepository,
    @required this.dateUtil,
  }) : super(LessonsUninitialized());

  void _onUserStateChanged(userState) {
    if (userState is UserSuccess) {
      gymId = userState.currentUser.selectedGymId;
      lessonsSub?.cancel();
      DateTime initialSelectedDay = dateUtil.getInitialSelectedDayByGym(gymId);

      lessonsSub = this
          .lessonRepository
          .getLessonsForDay(
            gymId,
            initialSelectedDay,
          )
          .listen((lessons) {
        add(LessonsEvent.lessonsUpdated(
          lessons: lessons,
          selectedDay: initialSelectedDay,
        ));
      });
    }
  }

  @override
  Stream<LessonsState> mapEventToState(LessonsEvent event) async* {
    if (event is InitializeLessons) {
      _onUserStateChanged(userBloc.state);
      userBloc.listen(_onUserStateChanged);
    }

    if (event is LessonsUpdated) {
      if (event.lessons.length > 0) {
        yield LessonsLoaded(
          lessons: _sortLessonsByTime(event.lessons),
          selectedDay: event.selectedDay,
          selectedFilterList: event.selectedFilterList,
          nocache: dateUtil.getCurrentDateTime(),
        );
      } else {
        yield LessonsLoadedEmpty(
          selectedDay: event.selectedDay,
          selectedFilterList: event.selectedFilterList,
          nocache: dateUtil.getCurrentDateTime(),
        );
      }
    }

    if (event is LoadLessons) {
      List<String> selectedFilterList = event.selectedFilterList ??
          state.maybeMap(
              lessonsLoadedEmpty: (LessonsLoadedEmpty state) => state.selectedFilterList,
              lessonsLoaded: (LessonsLoaded state) => state.selectedFilterList,
              orElse: () => []);

      lessonsSub?.cancel();
      lessonsSub = this
          .lessonRepository
          .getLessonsForDay(gymId, event.selectedDay, selectedFilterList)
          .listen((lessons) {
        add(LessonsUpdated(
            selectedDay: event.selectedDay,
            lessons: lessons,
            selectedFilterList: selectedFilterList));
      });
    }
  }

  _sortLessonsByTime(List<Lesson> lessons) =>
      lessons..sort(((a, b) => _getDate(a.timeStart).compareTo(_getDate(b.timeStart))));

  _getDate(String time) {
    DateTime now = DateTime.now();
    var todayDate = DateFormat('yyyy-MM-dd').format(now);

    return DateTime.parse('$todayDate $time:00');
  }

  @override
  Future<void> close() {
    lessonsSub?.cancel();
    return super.close();
  }
}
