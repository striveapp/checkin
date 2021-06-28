// @dart=2.9

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
  static const List<Timespan> availableTimespans = [
    Timespan.week,
    Timespan.month,
    Timespan.year,
    Timespan.all,
  ];

  final StatsRepository statsRepository;
  final UserRepository userRepository;

  StreamSubscription<List<UserHistory>> _userHistorySub;
  StreamSubscription<User> _userSub;

  LeaderboardBloc({
    @required this.statsRepository,
    @required this.userRepository,
  }) : super(LeaderboardInitial());

  @override
  Stream<LeaderboardState> mapEventToState(LeaderboardEvent event) async* {
    if (event is InitializeLeaderboard) {
      _fetchUserStatsByTimespan(Timespan.year);
    }

    if (event is LeaderboardUpdated) {
      var sortedUsers = _getSortedUsers(event.usersHistory);
      if (sortedUsers.length < 3) {
        yield LeaderboardLoaded(
          podium: [],
          restOfTheUsers: [],
          isAvailable: false,
        );
      } else {
        yield LeaderboardLoaded(
          podium: sortedUsers.sublist(0, 3),
          restOfTheUsers: sortedUsers.sublist(3),
        );
      }
    }

    if (event is UpdateTimespan) {
      _fetchUserStatsByTimespan(event.timespan);
    }
  }

  void _fetchUserStatsByTimespan(Timespan timespan) {
    _userSub?.cancel();
    _userSub = userRepository.getUser().listen((User currentUser) {
      _userHistorySub?.cancel();
      _userHistorySub = statsRepository
          .getAllUserStats(
            currentUser.selectedGymId,
            timespan,
          )
          .listen((usersHistory) => add(LeaderboardUpdated(usersHistory: usersHistory)));
    });
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
