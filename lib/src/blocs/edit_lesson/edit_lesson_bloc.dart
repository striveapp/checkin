import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

class EditLessonBloc extends Bloc<EditLessonEvent, EditLessonState> {
  final String gymId;
  final Lesson lesson;
  final LessonRepository lessonRepository;
  final ImageRepository imageRepository;
  final StorageRepository storageRepository;

  EditLessonBloc({
    @required this.gymId,
    @required this.lesson,
    @required this.lessonRepository,
    @required this.imageRepository,
    @required this.storageRepository,
  }) : super(EditLessonUninitialized());

  @override
  Stream<EditLessonState> mapEventToState(
    EditLessonEvent event,
  ) async* {
    // TODO:
    // 1. reimplement all the update methods for the lesson here + tests [DONE]
    // 2. implement retrieve masters event and MastersLoaded state + tests
    // 3. handle errors from the repository
    // 4. replace in the UI the update methods using the ones from this bloc instead
    // 5. use in the UI the new method to retrieve masters
    if (event is UpdateTimeStart) {
      await this.lessonRepository.updateLessonTimeStart(
            gymId,
            lesson.date,
            lesson.id,
            event.newTimeStart,
          );
    }

    if (event is UpdateTimeEnd) {
      await this.lessonRepository.updateLessonTimeEnd(
            gymId,
            lesson.date,
            lesson.id,
            event.newTimeEnd,
          );
    }

    if (event is UpdateName) {
      await this.lessonRepository.updateLessonName(
            gymId,
            lesson.date,
            lesson.id,
            event.newName,
          );
    }

    if (event is UpdateCapacity) {
      await this.lessonRepository.updateLessonCapacity(
            gymId,
            lesson.date,
            lesson.id,
            event.newCapacity,
          );
    }

    if (event is UpdateImageUrl) {
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
