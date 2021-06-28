import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stats_event.freezed.dart';

@freezed
class UserStatsEvent with _$UserStatsEvent {
  const factory UserStatsEvent.initializeUserStats() = InitializeUserStats;
  const factory UserStatsEvent.userStatsUpdated({
    required List<Lesson> attendedLessons,
    required Timespan timespan,
  }) = UserStatsUpdated;
}
