import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'lesson_event.freezed.dart';

@freezed
abstract class LessonEvent with _$LessonEvent {
  const factory LessonEvent.lessonUpdated({@required Lesson lesson}) = LessonUpdated;
}