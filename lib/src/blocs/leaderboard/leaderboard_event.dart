import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'leaderboard_event.freezed.dart';

@freezed
abstract class LeaderboardEvent with _$LeaderboardEvent {
  const factory LeaderboardEvent.initializeLeaderboard() = InitializeLeaderboard;

  const factory LeaderboardEvent.leaderboardUpdated({required List<UserHistory> usersHistory}) =
      LeaderboardUpdated;

  const factory LeaderboardEvent.updateTimespan({required Timespan timespan}) = UpdateTimespan;
}
