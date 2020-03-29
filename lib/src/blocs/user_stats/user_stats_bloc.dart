import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_event.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_state.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/material.dart';

class UserStatsBloc extends Bloc<UserStatsEvent, UserStatsState> {
  final StatsRepository statsRepository;
  final DateUtil dateUtil;
  final StatsBloc statsBloc;

  final String userEmail;
  StreamSubscription<UserHistory> statsSub;

  UserStatsBloc({
    @required this.statsRepository,
    @required this.dateUtil,
    @required this.userEmail,
    @required this.statsBloc,
  }) {
    statsBloc.listen((statsBlocState) {
      if (statsBlocState is TimespanUpdated) {
        statsSub?.cancel();
        statsSub = this.statsRepository.getUserStats(userEmail, _getFromTimestampBy(statsBlocState.timespan)).listen((userHistory) {
          add(StatsUpdated(attendedLessons: userHistory.attendedLessons, timeSpan: statsBlocState.timespan));
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
  UserStatsState get initialState => StatsUninitialized();

  @override
  Stream<UserStatsState> mapEventToState(UserStatsEvent event) async* {
    if(event is StatsUpdated) {
      yield StatsLoaded(attendedLessons: event.attendedLessons, timespan: event.timeSpan);
    }

  }

  int _getFromTimestampBy(String timeSpan) {
    if(timeSpan == constants.WEEK) {
      return dateUtil.getFirstDayOfTheWeekMilliseconds();
    } else if(timeSpan == constants.MONTH) {
      return dateUtil.getFirstDayOfTheMonthMilliseconds();
    } else {
      return dateUtil.getFirstDayOfTheYearMilliseconds();
    }
  }
}