import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository lessonRepository;
  final String lessonId;
  final String date;
  final UserBloc userBloc;

  StreamSubscription<Lesson> lessonSub;

  LessonBloc({
    @required this.lessonId,
    @required this.date,
    @required this.lessonRepository,
    @required this.userBloc,
  }) {
    userBloc.listen((userState) {
      if(userState is UserSuccess) {
        lessonSub?.cancel();
        lessonSub = lessonRepository
            .getLesson(userState.currentUser.selectedGymId, date, lessonId)
            .listen((lesson) {
          add(LessonUpdated(lesson: lesson));
        });
      }
    });
  }

  @override
  LessonState get initialState => LessonUninitialized();

  @override
  Stream<LessonState> mapEventToState(LessonEvent event) async* {
    if (event is LessonUpdated) {
      yield LessonLoaded(lesson: event.lesson);
    }
  }

  @override
  Future<void> close() {
    lessonSub?.cancel();
    return super.close();
  }
}
