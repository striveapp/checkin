import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final StatsRepository statsRepository;
  final UserRepository userRepository;
  StreamSubscription<List<UserHistory>> _userHistorySub;
  StreamSubscription<User> _userSub;

  LeaderboardBloc({
    @required this.statsRepository,
    @required this.userRepository,
  }) : super(LeaderboardInitial()) {
    _userSub?.cancel();
    _userSub = userRepository.getUser().listen(_onUserChanged);
  }

  void _onUserChanged(User currentUser) {
    _userHistorySub?.cancel();
    _userHistorySub = statsRepository
        .getAllUserStats(
          currentUser.selectedGymId,
          Timespan.year,
        )
        .listen((usersHistory) => add(LeaderboardUpdated(usersHistory: usersHistory)));
  }

  @override
  Stream<LeaderboardState> mapEventToState(LeaderboardEvent event) async* {
    if (event is LeaderboardUpdated) {
      if (event.usersHistory.length >= 3) {
        yield LeaderboardLoaded(usersHistory: _getSortedUsers(event.usersHistory));
      } else {
        yield LeaderboardNotAvailable();
      }
    }
  }

  @override
  Future<void> close() {
    _userSub?.cancel();
    _userHistorySub?.cancel();
    return super.close();
  }

  List<UserHistory> _getSortedUsers(List<UserHistory> users) {
    List<UserHistory> sortedUsers = [...users];

    sortedUsers.sort((UserHistory userA, UserHistory userB) =>
        userB.attendedLessons.length - userA.attendedLessons.length);

    return sortedUsers;
  }
}
