import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/lesson_template_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final String gymId;
  final LessonRepository lessonRepository;
  final LessonTemplateRepository lessonTemplateRepository;
  final UserRepository userRepository;
  final DateUtil dateUtil;

  StreamSubscription<List<Lesson>> lessonsSub;
  StreamSubscription<User> _userSub;

  LessonsBloc({
    @required this.gymId,
    @required this.lessonRepository,
    @required this.lessonTemplateRepository,
    @required this.userRepository,
    @required this.dateUtil,
  }) : super(LessonsUninitialized());

  void _onUserChanged(user) {
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

  @override
  Stream<LessonsState> mapEventToState(LessonsEvent event) async* {
    if (event is InitializeLessons) {
      _userSub?.cancel();
      _userSub = userRepository.getUser().listen(_onUserChanged);
    }

    if (event is LessonsUpdated) {
      yield LessonsLoaded(
        lessons: _sortLessonsByTime(event.lessons),
        selectedDay: event.selectedDay,
        selectedFilterList: event.selectedFilterList,
        nocache: dateUtil.getCurrentDateTime(),
      );
    }

    if (event is LoadLessons) {
      List<String> selectedFilterList = event.selectedFilterList ??
          state.maybeMap(
              lessonsLoaded: (LessonsLoaded state) => state.selectedFilterList, orElse: () => []);

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

    if (event is CreateLesson) {
      var formattedDate = DateFormat('yyyy-MM-dd').format(event.selectedDay);
      await lessonRepository.createLesson(gymId, formattedDate);
    }

    if (event is UpdateCalendar) {
      var currentDay = dateUtil.getCurrentDateTime();

      if (event.fromNextWeek) {
        currentDay = currentDay.add(Duration(days: 7));
      }

      var initDate = _retrieveBeginningOfTheWeek(currentDay);
      var endDate = _retrieveEndOfTheWeek(currentDay);

      await lessonTemplateRepository.applyTemplate(
        gymId,
        _format(initDate),
        _format(endDate),
      );
    }
  }

  DateTime _retrieveBeginningOfTheWeek(DateTime d) => d.subtract(Duration(days: d.weekday - 1));

  DateTime _retrieveEndOfTheWeek(DateTime d) =>
      d.add(Duration(days: DateTime.daysPerWeek - d.weekday));

  _sortLessonsByTime(List<Lesson> lessons) =>
      lessons..sort(((a, b) => _getDate(a.timeStart).compareTo(_getDate(b.timeStart))));

  _getDate(String time) {
    DateTime now = DateTime.now();
    var todayDate = _format(now);

    return DateTime.parse('$todayDate $time:00');
  }

  String _format(DateTime d) => DateFormat('yyyy-MM-dd').format(d);

  @override
  Future<void> close() {
    lessonsSub?.cancel();
    _userSub?.cancel();
    return super.close();
  }
}
