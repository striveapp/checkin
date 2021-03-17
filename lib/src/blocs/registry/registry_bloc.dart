import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class RegistryBloc extends Bloc<RegistryEvent, RegistryState> {
  final String lessonId;
  final String lessonDate;
  final LessonApi lessonApi;
  final LessonRepository lessonRepository;
  final UserRepository userRepository;
  final ImageRepository imageRepository;
  final StorageRepository storageRepository;
  final DateUtil dateUtil;


  StreamSubscription<Lesson> _lessonSub;
  StreamSubscription<User> _userSub;

  RegistryBloc({
    @required this.lessonId,
    @required this.lessonDate,
    @required this.lessonApi,
    @required this.lessonRepository,
    @required this.imageRepository,
    @required this.storageRepository,
    @required this.userRepository,
    @required this.dateUtil,
  }) : super(RegistryUninitialized());

  void _onUserChanged(User currentUser) {
    _lessonSub?.cancel();
    _lessonSub = lessonRepository
        .getLesson(currentUser.selectedGymId, lessonDate, lessonId)
        .listen((lesson) {
      add(RegistryUpdated(
        currentUser: currentUser,
        currentLesson: lesson,
      ));
    });
  }

  @override
  Stream<RegistryState> mapEventToState(RegistryEvent event) async* {
    if (event is InitializeRegistry) {
      _userSub?.cancel();
      _userSub = userRepository.getUser().listen(_onUserChanged);
    }

    if (event is RegistryUpdated) {
      if (event.currentLesson == null) {
        yield RegistryMissing();
      } else {
        yield RegistryState.registryLoaded(
          currentUser: event.currentUser,
          currentLesson: event.currentLesson,
          isAcceptedUser: isAcceptedUser(event),
          isRegisteredUser: isRegisteredUser(event),
          isFullRegistry: isFullRegistry(event),
          isEmptyRegistry: isEmptyRegistry(event),
          isMasterOfTheClass: isMasterOfTheClass(event),
          isClosedRegistry: event.currentLesson.isClosed,
          nocache: dateUtil.getCurrentDateTime(),
        );
      }
    }

    if (event is AcceptAttendees) {
      yield RegistryLoading();
      try {
        await this.lessonApi.acceptAll(
              event.gymId,
              lessonId,
              lessonDate,
            );
      } catch (e) {
        yield RegistryError();
      }
    }

    if (event is Register) {
      try {
        await this.lessonRepository.register(
              event.gymId,
              lessonDate,
              lessonId,
              event.attendee,
            );
      } catch (e) {
        yield RegistryError();
      }
    }

    if (event is Unregister) {
      try {
        Logger.log.i("Unregistering user ${event.attendee}");
        await this.lessonRepository.unregister(
              event.gymId,
              lessonDate,
              lessonId,
              event.attendee,
            );
      } catch (e) {
        yield RegistryError();
      }
    }

    if (event is CloseLesson) {
      yield RegistryLoading();
      await this.lessonRepository.closeLesson(
            event.gymId,
            lessonDate,
            lessonId,
          );
    }

    if (event is DeleteLesson) {
      try {
        _lessonSub?.cancel();
        await this.lessonRepository.deleteLesson(
              event.gymId,
              lessonDate,
              lessonId,
            );
      } catch (error, stacktrace) {
        Logger.log.e(error, stacktrace);
      }
    }
  }

  bool isAcceptedUser(RegistryUpdated event) {
    return event.currentLesson.acceptedAttendees
        .any((attendee) => attendee.email == event.currentUser.email);
  }

  bool isRegisteredUser(RegistryUpdated event) {
    // TODO: we should use some kind of id to perform this check not the email https://trello.com/c/j5sAVRXJ
    return event.currentLesson.attendees
        .any((attendee) => attendee.email == event.currentUser.email);
  }

  bool isFullRegistry(RegistryUpdated event) {
    var currentLesson = event.currentLesson;
    return currentLesson.attendees.length + currentLesson.acceptedAttendees.length >=
        currentLesson.classCapacity;
  }

  bool isEmptyRegistry(RegistryUpdated event) {
    var currentLesson = event.currentLesson;
    return currentLesson.attendees.length + currentLesson.acceptedAttendees.length == 0;
  }

  bool isMasterOfTheClass(RegistryUpdated event) {
    return event.currentLesson.masters
        .where((lessonMaster) => lessonMaster.email == event.currentUser.email)
        .isNotEmpty;
  }

  @override
  Future<void> close() {
    _userSub?.cancel();
    _lessonSub?.cancel();
    return super.close();
  }
}
