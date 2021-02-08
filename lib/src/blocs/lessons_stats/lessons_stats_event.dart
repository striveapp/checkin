import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_stats_event.freezed.dart';

@freezed
abstract class LessonsStatsEvent with _$LessonsStatsEvent {
  const factory LessonsStatsEvent.initializeLessonsStats() = InitializeLessonsStats;
  const factory LessonsStatsEvent.updateLessonsStats({
    @required List<Lesson> lessons,
  }) = UpdateLessonsStats;
}
