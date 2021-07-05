import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stats_state.freezed.dart';

@freezed
class UserStatsState with _$UserStatsState {
  const factory UserStatsState.userStatsUninitialized() = UserStatsUninitialized;
  const factory UserStatsState.userStatsLoaded({
    required List<Lesson> attendedLessons,
    required Timespan timespan,
  }) = UserStatsLoaded;
}
