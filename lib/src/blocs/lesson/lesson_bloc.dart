import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/lesson_api.dart';
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

  Lesson lesson;
  StreamSubscription<Lesson> lessonSub;

  LessonBloc({
    @required this.lessonId,
    @required this.date,
    @required this.lessonRepository,
    @required this.lessonApi,
  }) {
    lessonSub?.cancel();
    lessonSub = lessonRepository
        .getLesson(date, lessonId)
        .listen((lesson) {
          this.lesson = lesson;
          add(LessonUpdated(lesson: lesson));
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
            .register(this.date, this.lessonId, event.attendee);
      } catch (e) {
        yield LessonError();
      }
    }

    if (event is LessonUnregister) {
      try {
        await this
            .lessonRepository
            .unregister(this.date, this.lessonId, event.attendee);
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
