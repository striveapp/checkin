import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/user/user_bloc.dart';
import 'package:checkin/src/blocs/user/user_state.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class RegistryBloc extends Bloc<RegistryEvent, RegistryState> {
  final UserBloc userBloc;
  final LessonApi lessonApi;
  final LessonRepository lessonRepository;
  final ImageRepository imageRepository;
  final StorageRepository storageRepository;
  final String lessonId;
  final String lessonDate;

  StreamSubscription<Lesson> lessonSub;

  RegistryBloc({
    @required this.userBloc,
    @required this.lessonApi,
    @required this.lessonRepository,
    @required this.lessonId,
    @required this.imageRepository,
    @required this.storageRepository,
    @required this.lessonDate,
  }) : super(RegistryUninitialized());

  void _onUserStateChanged(userState) {
    if (userState is UserSuccess) {
      lessonSub?.cancel();
      lessonSub = lessonRepository
          .getLesson(userState.currentUser.selectedGymId, lessonDate, lessonId)
          .listen((lesson) {
        add(RegistryUpdated(
          currentUser: userState.currentUser,
          currentLesson: lesson,
        ));
      });
    }
  }

  @override
  Stream<RegistryState> mapEventToState(RegistryEvent event) async* {
    if (event is InitializeRegistry) {
      _onUserStateChanged(userBloc.state);
      userBloc.listen(_onUserStateChanged);
    }

    if (event is RegistryUpdated) {
      if (event.currentLesson == null) {
        yield RegistryMissing();
      } else {
        yield RegistryLoaded(
            currentUser: event.currentUser,
            currentLesson: event.currentLesson,
            isAcceptedUser: isAcceptedUser(event),
            isRegisteredUser: isRegisteredUser(event),
            isFullRegistry: isFullRegistry(event),
            isEmptyRegistry: isEmptyRegistry(event),
            isMasterOfTheClass: isMasterOfTheClass(event),
            isClosedRegistry: event.currentLesson.isClosed);
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
        await this.lessonSub?.cancel();
        await this.lessonRepository.deleteLesson(
          event.gymId,
          lessonDate,
          lessonId,
        );
      } catch (error, stacktrace) {
        Logger.log.e(error, stacktrace);
      }
    }

    if (event is UpdateTimeStart) {
      await this
          .lessonRepository
          .updateLessonTimeStart(event.gymId, lessonDate, lessonId, event.newTimeStart);
    }

    if (event is UpdateTimeEnd) {
      await this
          .lessonRepository
          .updateLessonTimeEnd(event.gymId, lessonDate, lessonId, event.newTimeEnd);
    }

    if (event is UpdateName) {
      await this
          .lessonRepository
          .updateLessonName(event.gymId, lessonDate, lessonId, event.newName);
    }

    if (event is UpdateCapacity) {
      await this
          .lessonRepository
          .updateLessonCapacity(event.gymId, lessonDate, lessonId, event.newCapacity);
    }

    if (event is UpdateImageUrl) {
      File croppedFile = await imageRepository.getCroppedImage();
      if (croppedFile != null) {
        String fileName = "$lessonId-${DateTime.now()}.png";
        String newImageUrl = await storageRepository.uploadImage(croppedFile, fileName);

        await lessonRepository.updateLessonImage(
          event.gymId,
          lessonDate,
          lessonId,
          newImageUrl,
        );
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
    lessonSub?.cancel();
    return super.close();
  }
}
