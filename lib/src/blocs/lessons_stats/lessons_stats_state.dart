import 'package:checkin/src/models/attendee_with_counter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_stats_state.freezed.dart';

@freezed
abstract class LessonsStatsState with _$LessonsStatsState {
  const factory LessonsStatsState.lessonsStatsInitial() = LessonsStatsInitial;
  const factory LessonsStatsState.lessonsStatsUpdated({
    @required List<AttendeeWithCounter> attendeesWithCounter,
    @required int totalAttendees,
  }) = LessonsStatsUpdated;
}
