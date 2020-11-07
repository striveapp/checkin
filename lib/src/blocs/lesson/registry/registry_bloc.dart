import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class RegistryBloc extends Bloc<RegistryEvent, RegistryState> {
  final UserBloc userBloc;
  final LessonApi lessonApi;
  final LessonRepository lessonRepository;
  final Lesson lesson;

  StreamSubscription userSub;


  RegistryBloc({
    @required this.userBloc,
    @required this.lessonApi,
    @required this.lessonRepository,
    @required this.lesson
  }) {
    userSub?.cancel();
    userSub = userBloc.listen((userState) {
      if(userState is UserSuccess) {
        add(RegistryUpdated(
            classCapacity: lesson.classCapacity,
            acceptedAttendees: lesson.acceptedAttendees,
            attendees: lesson.attendees,
            currentUser: userState.currentUser));
      }
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
        isAcceptedUser: isAcceptedUser(event),
        isRegisteredUser: isRegisteredUser(event),
        isFullRegistry: isFullRegistry(event)
      );
    }

    if (event is AcceptAttendees) {
      yield RegistryLoading();
      try {
        //TODO: refactor registry_bloc when calling acceptAll [https://trello.com/c/o7PBLnEQ]
        await this.lessonApi.acceptAll(event.gymId, lesson);
      } catch (e) {
        yield RegistryError();
      }
    }

    if (event is Register) {
      try {
        await this
            .lessonRepository
            .register(event.gymId, lesson.date, lesson.id, event.attendee);
      } catch (e) {
        yield RegistryError();
      }
    }

    if (event is Unregister) {
      try {
        await this
            .lessonRepository
            .unregister(event.gymId, lesson.date, lesson.id, event.attendee);
      } catch (e) {
        yield RegistryError();
      }
    }
  }

  bool isAcceptedUser(RegistryUpdated event) {
    return event.acceptedAttendees.any((attendee) => attendee.email == event.currentUser.email);
  }

  bool isRegisteredUser(RegistryUpdated event) {
    // TODO: we should use some kind of id to perform this check not the email https://trello.com/c/j5sAVRXJ
    return event.attendees.any((attendee) => attendee.email == event.currentUser.email);
  }

  bool isFullRegistry(RegistryUpdated event) {
    return event.attendees.length + event.acceptedAttendees.length >= event.classCapacity;
  }

  @override
  Future<void> close() {
    userSub?.cancel();
    return super.close();
  }
}
