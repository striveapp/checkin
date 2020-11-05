import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'lesson_state.freezed.dart';

@freezed
abstract class LessonState with _$LessonState {
  const factory LessonState.lessonUninitialized() = LessonUninitialized;
  const factory LessonState.lessonLoaded({@required Lesson lesson,}) = LessonLoaded;
}