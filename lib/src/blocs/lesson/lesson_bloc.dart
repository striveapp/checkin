import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository lessonRepository;
  final LessonApi lessonApi;
  final String lessonId;
  final String date;
  final UserBloc userBloc;

  Lesson lesson;
  StreamSubscription<Lesson> lessonSub;
  String gymId;

  LessonBloc({
    @required this.lessonId,
    @required this.date,
    @required this.lessonRepository,
    @required this.lessonApi,
    @required this.userBloc,
  }) {
    userBloc.listen((userState) {
      if(userState is UserSuccess) {
        gymId = userState.currentUser.selectedGymId;
        lessonSub?.cancel();
        lessonSub = lessonRepository
            .getLesson(userState.currentUser.selectedGymId, date, lessonId)
            .listen((lesson) {
          this.lesson = lesson;
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

    if (event is LessonRegister) {
      try {
        await this
            .lessonRepository
            .register(gymId, this.date, this.lessonId, event.attendee);
      } catch (e) {
        yield LessonError();
      }
    }

    if (event is LessonUnregister) {
      try {
        await this
            .lessonRepository
            .unregister(gymId, this.date, this.lessonId, event.attendee);
      } catch (e) {
        yield LessonError();
      }
    }

    if (event is LessonAcceptAll) {
      try {
        //TODO: refactor lesson_bloc when calling acceptAll [https://trello.com/c/o7PBLnEQ]
        await this.lessonApi.acceptAll(this.lesson);
      } catch (e) {
        yield LessonError();
      }
    }
  }

  @override
  Future<void> close() {
    lessonSub?.cancel();
    return super.close();
  }
}
