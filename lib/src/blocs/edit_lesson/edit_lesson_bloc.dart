import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc.dart';

class EditLessonBloc extends Bloc<EditLessonEvent, EditLessonState> {
  final String gymId;
  final Lesson lesson;
  final LessonRepository lessonRepository;
  final ImageRepository imageRepository;
  final StorageRepository storageRepository;
  final UserRepository userRepository;

  EditLessonBloc({
    @required this.gymId,
    @required this.lesson,
    @required this.lessonRepository,
    @required this.imageRepository,
    @required this.storageRepository,
    @required this.userRepository,
  }) : super(EditLessonUninitialized());

  @override
  Stream<EditLessonState> mapEventToState(
    EditLessonEvent event,
  ) async* {
    if (event is RetrieveMasters) {
      userRepository.retrieveAvailableMasters(gymId).listen((masters) {
        add(MastersUpdated(masters: masters));
      });
    }

    if (event is MastersUpdated) {
      yield EditLessonState.mastersLoaded(masters: event.masters);
    }

    if (event is UpdateTimeStart) {
      await lessonRepository.updateLessonTimeStart(
        gymId,
        lesson.date,
        lesson.id,
        event.newTimeStart,
      );
    }

    if (event is UpdateTimeEnd) {
      await lessonRepository.updateLessonTimeEnd(
        gymId,
        lesson.date,
        lesson.id,
        event.newTimeEnd,
      );
    }

    if (event is UpdateName) {
      await lessonRepository.updateLessonName(
        gymId,
        lesson.date,
        lesson.id,
        event.newName,
      );
    }

    if (event is UpdateCapacity) {
      await lessonRepository.updateLessonCapacity(
        gymId,
        lesson.date,
        lesson.id,
        event.newCapacity,
      );
    }

    if (event is UpdateImageUrl) {
      try {
        File croppedFile = await imageRepository.getCroppedImage();
        if (croppedFile != null) {
          String fileName = "${lesson.id}-${DateTime.now()}.png";
          String newImageUrl = await storageRepository.uploadImage(croppedFile, fileName);

          await lessonRepository.updateLessonImage(
            gymId,
            lesson.date,
            lesson.id,
            newImageUrl,
          );
        }
      } on PlatformException catch (err) {
        if (err.code == "photo_access_denied") {
          //TODO: we should ask again for permissions here https://trello.com/c/Jcgvvcwj
          Logger.log.d("Ask for permissions");
        }
      }
    }

    if (event is UpdateMasters) {
      await lessonRepository.updateLessonMasters(
        gymId,
        lesson.date,
        lesson.id,
        event.newMasters,
      );
    }
  }
}
