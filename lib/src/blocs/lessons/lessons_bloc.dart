import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import 'bloc.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final LessonRepository lessonRepository;
  final UserBloc userBloc;

  StreamSubscription<List<Lesson>> lessonsSub;
  String gymId;

  LessonsBloc({
    @required this.userBloc,
    @required this.lessonRepository,
  }) : super(LessonsUninitialized()) {
    _onUserStateChanged(userBloc.state);
    userBloc.listen(_onUserStateChanged);
  }

  void _onUserStateChanged(userState) {
    if (userState is UserSuccess) {
      gymId = userState.currentUser.selectedGymId;
      lessonsSub?.cancel();

      var day = isInDebugMode ? testDate : DateTime.now();

      lessonsSub = this.lessonRepository.getLessonsForDay(gymId, day).listen((lessons) {
        add(LessonsEvent.lessonsUpdated(lessons: lessons, selectedDay: day));
      });
    }
  }

  @override
  Stream<LessonsState> mapEventToState(LessonsEvent event) async* {
    if (event is LessonsUpdated) {
      if (event.lessons.length > 0) {
        yield LessonsLoaded(
            lessons: _sortLessonsByTime(event.lessons),
            selectedDay: event.selectedDay,
            selectedFilterList: event.selectedFilterList);
      } else {
        yield LessonsLoadedEmpty(
            selectedDay: event.selectedDay, selectedFilterList: event.selectedFilterList);
      }
    }

    if (event is LoadLessons) {
      List<String> selectedFilterList = event.selectedFilterList ?? state.maybeMap(
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
