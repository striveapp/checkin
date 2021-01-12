import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'lesson_filter_event.freezed.dart';

@freezed
abstract class LessonFilterEvent with _$LessonFilterEvent {
  const factory LessonFilterEvent.lessonFilterUpdated(
      {@required Set<String> availableLessonTypes}) = LessonFilterUpdated;
}
