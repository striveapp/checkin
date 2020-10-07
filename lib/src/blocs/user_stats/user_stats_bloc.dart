import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_event.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_state.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:flutter/material.dart';

class UserStatsBloc extends Bloc<UserStatsEvent, UserStatsState> {
  final StatsRepository statsRepository;
  final StatsBloc statsBloc;
  final String userEmail;
  final String selectedGymId;

  StreamSubscription<UserHistory> statsSub;

  UserStatsBloc({
    @required this.statsRepository,
    @required this.userEmail,
    @required this.selectedGymId,
    @required this.statsBloc,
  }) {

    statsBloc.listen((statsBlocState) {
      if (statsBlocState is TimespanUpdated) {
        statsSub?.cancel();
        statsSub = this
            .statsRepository
            .getUserStats(selectedGymId, userEmail, statsBlocState.timespan)
            .listen((userHistory) {
          add(UserStatsUpdated(
              attendedLessons: userHistory.attendedLessons,
              timeSpan: statsBlocState.timespan));
        });
      }
    });
  }

  @override
  Future<void> close() {
    statsSub?.cancel();
    return super.close();
  }

  @override
  UserStatsState get initialState => UserStatsUninitialized();

  @override
  Stream<UserStatsState> mapEventToState(UserStatsEvent event) async* {
    if (event is UserStatsUpdated) {
      yield UserStatsLoaded(
          attendedLessons: event.attendedLessons, timespan: event.timeSpan);
    }
  }
}
