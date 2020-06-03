import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/lesson/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class RegistryBloc extends Bloc<RegistryEvent, RegistryState> {
  final LessonBloc lessonBloc;
  final UserBloc userBloc;

  RegistryBloc({
    @required this.lessonBloc,
    @required this.userBloc,
  }) {
    var userStream = userBloc
        .where((state) => state is UserSuccess)
        .map((event) => event as UserSuccess);

    var lessonStream = lessonBloc
        .where((state) => state is LessonLoaded)
        .map((event) => event as LessonLoaded);

    Rx.combineLatest2(userStream, lessonStream,
        (UserSuccess userState, LessonLoaded lessonState) {
      Lesson lesson = lessonState.lesson;
      return RegistryUpdated(
          classCapacity: lesson.classCapacity,
          acceptedAttendees: lesson.acceptedAttendees,
          attendees: lesson.attendees,
          currentUser: userState.currentUser);
    }).listen((event) {
      add(event);
    });
  }

  @override
  RegistryState get initialState => RegistryUninitialized();

  @override
  Stream<RegistryState> mapEventToState(RegistryEvent event) async* {
    if (event is RegistryUpdated) {
      yield RegistryLoaded(
        classCapacity: event.classCapacity,
        currentUser: event.currentUser,
        attendees: event.attendees,
        acceptedAttendees: event.acceptedAttendees,
      );
    }

    if (event is AcceptAttendees) {
      yield RegistryLoading();
      lessonBloc.add(LessonAcceptAll());
    }

    if (event is Register) {
      lessonBloc.add(LessonRegister(attendee: event.attendee));
    }

    if (event is Unregister) {
      lessonBloc.add(LessonUnregister(attendee: event.attendee));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
