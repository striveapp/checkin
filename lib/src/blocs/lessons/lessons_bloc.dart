import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

import 'bloc.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final LessonRepository lessonRepository;
  final UserBloc userBloc;

  StreamSubscription<List<Lesson>> lessonsSub;
  String gymId;

  LessonsBloc({
    @required this.userBloc,
    @required this.lessonRepository,
  }) {
    userBloc.listen((userState) {
      if(userState is UserSuccess) {
        gymId = userState.currentUser.selectedGymId;
        lessonsSub?.cancel();
        lessonsSub = this.lessonRepository.getLessonsForToday(gymId).listen((lessons) {
          add(LessonsUpdated(lessons: lessons));
        });
      }
    });
  }

  @override
  LessonsState get initialState => LessonsUninitialized();

  @override
  Stream<LessonsState> mapEventToState(LessonsEvent event) async* {
    if (event is LessonsUpdated) {
      try {
        if (event.lessons.length > 0) {
          yield LessonsLoaded(lessons: _sortLessonsByTime(event.lessons));
        } else {
          yield LessonsLoadedEmpty();
        }
      } catch (e) {
        print(e);
      }
    }

    if (event is LoadLessons) {
      lessonsSub?.cancel();
      lessonsSub = this.lessonRepository.getLessonsForDay(gymId, event.selectedDay).listen((lessons) {
        add(LessonsUpdated(lessons: lessons));
      });
    }
  }

  _sortLessonsByTime(List<Lesson> lessons) => lessons
    ..sort(((a, b) => _getDate(a.timeStart).compareTo(_getDate(b.timeStart))));

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
