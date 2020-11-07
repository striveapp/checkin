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
  final String lessonId;
  final String lessonDate;

  StreamSubscription<UserState> userSub;
  StreamSubscription<Lesson> lessonSub;

  RegistryBloc({
    @required this.userBloc,
    @required this.lessonApi,
    @required this.lessonRepository,
    @required this.lessonId,
    @required this.lessonDate,
  }) {
    userSub?.cancel();
    userSub = userBloc.listen((userState) {
      if(userState is UserSuccess) {
        lessonSub?.cancel();
        lessonSub = lessonRepository
            .getLesson(userState.currentUser.selectedGymId, lessonDate, lessonId)
            .listen((lesson) {
          add(RegistryUpdated(
              currentUser: userState.currentUser,
              currentLesson: lesson));
        });
      }
    });
  }

  @override
  RegistryState get initialState => RegistryUninitialized();

  @override
  Stream<RegistryState> mapEventToState(RegistryEvent event) async* {
    if (event is RegistryUpdated) {
      yield RegistryLoaded(
        currentUser: event.currentUser,
        currentLesson: event.currentLesson,
        isAcceptedUser: isAcceptedUser(event),
        isRegisteredUser: isRegisteredUser(event),
        isFullRegistry: isFullRegistry(event),
        isMasterOfTheClass: isMasterOfTheClass(event),
      );
    }

    if (event is AcceptAttendees) {
      yield RegistryLoading();
      try {
        //TODO: refactor registry_bloc when calling acceptAll [https://trello.com/c/o7PBLnEQ]
        await this.lessonApi.acceptAll(event.gymId, lessonId, lessonDate);
      } catch (e) {
        yield RegistryError();
      }
    }

    if (event is Register) {
      try {
        await this
            .lessonRepository
            .register(event.gymId, lessonDate, lessonId, event.attendee);
      } catch (e) {
        yield RegistryError();
      }
    }

    if (event is Unregister) {
      try {
        debugPrint("unregistering user ${event.attendee}");
        await this
            .lessonRepository
            .unregister(event.gymId, lessonDate, lessonId, event.attendee);
      } catch (e) {
        yield RegistryError();
      }
    }
  }

  bool isAcceptedUser(RegistryUpdated event) {
    return event.currentLesson.acceptedAttendees.any((attendee) => attendee.email == event.currentUser.email);
  }

  bool isRegisteredUser(RegistryUpdated event) {
    // TODO: we should use some kind of id to perform this check not the email https://trello.com/c/j5sAVRXJ
    return event.currentLesson.attendees.any((attendee) => attendee.email == event.currentUser.email);
  }

  bool isFullRegistry(RegistryUpdated event) {
    var currentLesson = event.currentLesson;
    return currentLesson.attendees.length + currentLesson.acceptedAttendees.length >= currentLesson.classCapacity;
  }

  bool isMasterOfTheClass(RegistryUpdated event) {
    return event.currentLesson.masters
        .where((lessonMaster) => lessonMaster.email == event.currentUser.email)
        .isNotEmpty;
  }

  @override
  Future<void> close() {
    userSub?.cancel();
    lessonSub?.cancel();
    return super.close();
  }

}
