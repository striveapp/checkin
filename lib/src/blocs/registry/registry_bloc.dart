import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/api.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class RegistryBloc extends Bloc<RegistryEvent, RegistryState> {
  final LessonRepository lessonRepository;
  final LessonApi lessonApi;
  final UserBloc userBloc;
  final String lessonId;
  final String date;
  StreamSubscription<Lesson> registrySub;
  String currentLessonId;

  RegistryBloc({
    @required this.lessonId,
    @required this.date,
    @required this.lessonRepository,
    @required this.lessonApi,
    @required this.userBloc,
  }) {
    this.userBloc.listen((userState) {
      if (userState is UserSuccess) {
        registrySub?.cancel();
        registrySub = lessonRepository
            .getLesson(date, lessonId)
            .listen((lesson) => add(LessonUpdated(lesson: lesson, currentUser: userState.currentUser)));
      }
    });
  }

  @override
  RegistryState get initialState => RegistryUninitialized();

  @override
  Stream<RegistryState> mapEventToState(RegistryEvent event) async* {
    if (event is LessonUpdated) {
      try {
        yield RegistryLoaded(currentLesson: event.lesson, currentUser: event.currentUser);
      } catch (e) {
        print(e);
      }
    }

    if (event is ConfirmAttendees) {
      try {
        yield RegistryLoading();
        await this.lessonApi.acceptAll(event.lesson);
      } catch (e) {
        print(e);
      }
    }

    if (event is Register) {
      try {
        yield RegistryLoading();
        await this.lessonRepository.register(event.date, event.lessonId, event.attendee);
      } catch (e) {
        print(e);
      }
    }

    if (event is Unregister) {
      try {
        yield RegistryLoading();
        await this.lessonRepository.unregister(event.date, event.lessonId, event.attendee);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Future<void> close() {
    registrySub?.cancel();
    return super.close();
  }
}
