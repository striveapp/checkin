import 'package:checkin/src/models/master.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_lesson_event.freezed.dart';

@freezed
abstract class EditLessonEvent with _$EditLessonEvent {
  const factory EditLessonEvent.initializeEditLesson() = InitializeEditLesson;

  const factory EditLessonEvent.retrieveMasters({
    @required String gymId,
  }) = RetrieveMasters;

  const factory EditLessonEvent.updateTimeStart({
    @required String gymId,
    @required String newTimeStart,
  }) = UpdateTimeStart;

  const factory EditLessonEvent.updateTimeEnd({
    @required String gymId,
    @required String newTimeEnd,
  }) = UpdateTimeEnd;

  const factory EditLessonEvent.updateName({
    @required String gymId,
    @required String newName,
  }) = UpdateName;

  const factory EditLessonEvent.updateCapacity({
    @required String gymId,
    @required int newCapacity,
  }) = UpdateCapacity;

  const factory EditLessonEvent.updateImageUrl({
    @required String gymId,
  }) = UpdateImageUrl;

  const factory EditLessonEvent.updateMasters({
    @required String gymId,
    @required List<Master> newMasters,
  }) = UpdateMasters;
}
