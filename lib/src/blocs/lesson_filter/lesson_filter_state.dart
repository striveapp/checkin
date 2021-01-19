import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'lesson_filter_state.freezed.dart';

@freezed
abstract class LessonFilterState with _$LessonFilterState {
  const factory LessonFilterState.initialLessonFilterState() = InitialLessonFilterState;
  const factory LessonFilterState.lessonFilterLoaded(
      {@required List<String> availableLessonTypes}) = LessonFilterLoaded;
}
