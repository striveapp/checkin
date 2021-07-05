import 'package:checkin/src/models/timespan.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_event.freezed.dart';

@freezed
class StatsEvent with _$StatsEvent {
  const factory StatsEvent.timespanUpdated({
    required Timespan timespan,
  }) = TimespanUpdate;
}
