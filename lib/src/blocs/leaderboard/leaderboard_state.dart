import 'package:checkin/src/models/user_history.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState.leaderboardInitial() = LeaderboardInitial;

  const factory LeaderboardState.leaderboardLoaded({
    required List<UserHistory> podium,
    required List<UserHistory> restOfTheUsers,
    @Default(true) bool isAvailable,
  }) = LeaderboardLoaded;
}
