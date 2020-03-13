import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:flutter/material.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {

  final StatsRepository _statsRepository;
  StreamSubscription<List<UserHistory>> userHistorySub;

  LeaderboardBloc({
    @required statsRepository,
  })  : assert(statsRepository != null),
        _statsRepository = statsRepository {
    userHistorySub?.cancel();
    userHistorySub = _statsRepository.getAllUserStats().listen((usersHistory) {
      add(LeaderboardUpdated(usersHistory: usersHistory));
    });
  }

  @override
  get initialState => LeaderboardInitial();

  @override
  Stream<LeaderboardState> mapEventToState(LeaderboardEvent event) async* {
    if (event is LeaderboardUpdated) {
      yield LeaderboardLoaded(usersHistory: _getSortedUsers(event.usersHistory));
    }
  }

  @override
  Future<void> close() {
    userHistorySub?.cancel();
    return super.close();
  }

  List<UserHistory> _getSortedUsers(List<UserHistory> users) {
    List<UserHistory> sortedUsers = [...users];

    sortedUsers.sort((UserHistory userA, UserHistory userB) =>
        userB.attendedLessons.length -
        userA.attendedLessons.length);

    return sortedUsers;
  }
}
