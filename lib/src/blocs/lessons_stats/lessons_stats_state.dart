import 'package:checkin/src/models/attendee.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_stats_state.freezed.dart';

@freezed
abstract class LessonsStatsState with _$LessonsStatsState {
  const factory LessonsStatsState.lessonsStatsInitial() = LessonsStatsInitial;
  const factory LessonsStatsState.lessonsStatsUpdated({
    @required Map<Attendee, int> acceptedAttendeesWithCounter,
    @required int totalAttendees,
  }) = LessonsStatsUpdated;
}
