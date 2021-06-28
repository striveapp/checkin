import 'package:checkin/src/models/master.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_lesson_event.freezed.dart';

@freezed
abstract class EditLessonEvent with _$EditLessonEvent {
  const factory EditLessonEvent.initializeEditLesson() = InitializeEditLesson;

  const factory EditLessonEvent.mastersUpdated({
    required List<Master> masters,
  }) = MastersUpdated;

  const factory EditLessonEvent.retrieveMasters() = RetrieveMasters;

  const factory EditLessonEvent.updateTimeStart({
    required String newTimeStart,
  }) = UpdateTimeStart;

  const factory EditLessonEvent.updateTimeEnd({
    required String newTimeEnd,
  }) = UpdateTimeEnd;

  const factory EditLessonEvent.updateName({
    required String newName,
  }) = UpdateName;

  const factory EditLessonEvent.updateCapacity({
    required int newCapacity,
  }) = UpdateCapacity;

  const factory EditLessonEvent.updateImageUrl() = UpdateImageUrl;

  const factory EditLessonEvent.updateMasters({
    required List<Master> newMasters,
  }) = UpdateMasters;
}
