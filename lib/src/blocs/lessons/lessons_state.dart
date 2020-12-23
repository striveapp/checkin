import 'package:checkin/src/models/lesson.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'lessons_state.freezed.dart';

@freezed
abstract class LessonsState with _$LessonsState {
  const factory LessonsState.lessonsUninitialized() = LessonsUninitialized;
  const factory LessonsState.lessonsError() = LessonsError;
  const factory LessonsState.lessonsLoaded({List<Lesson> lessons, DateTime selectedDay, @Default([]) List<String> selectedFilterList, DateTime nocache}) = LessonsLoaded;
  const factory LessonsState.lessonsLoadedEmpty({DateTime selectedDay, @Default([]) List<String> selectedFilterList}) = LessonsLoadedEmpty;
}