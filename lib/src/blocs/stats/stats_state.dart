import 'package:checkin/src/models/timespan.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_state.freezed.dart';

@freezed
abstract class StatsState with _$StatsState {
  const factory StatsState.initialStatsState() = InitialStatsState;
  const factory StatsState.timespanUpdated({
    required Timespan timespan,
  }) = TimespanUpdated;
}
