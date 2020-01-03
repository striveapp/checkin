import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/stats/stats_event.dart';
import 'package:checkin/src/blocs/stats/stats_state.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/material.dart';

import 'package:checkin/src/constants.dart' as constants;

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final StatsRepository statsRepository;
  final UserBloc userBloc;
  final DateUtil dateUtil;

  String userEmail;
  StreamSubscription<UserHistory> statsSub;

  StatsBloc({
    @required this.statsRepository,
    @required this.userBloc,
    @required this.dateUtil,
  }) {
    statsSub?.cancel();
    userBloc.listen((userState) {
      if(userState is UserSuccess) {
        userEmail = userState.currentUser.email;
        statsSub?.cancel();
        statsSub = this.statsRepository.getUserStats(userEmail, dateUtil.getFirstDayOfTheWeekMilliseconds()).listen((userHistory) {
          add(StatsUpdated(attendedLessons: userHistory.attendedLessons, timeSpan: constants.WEEK));
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
  StatsState get initialState => StatsUninitialized();

  @override
  Stream<StatsState> mapEventToState(StatsEvent event) async* {
    if(event is StatsUpdated) {
      yield StatsLoaded(attendedLessons: event.attendedLessons, timeSpan: event.timeSpan);
    }

    if(event is LoadStats) {
      statsSub?.cancel();
      statsSub = this.statsRepository.getUserStats(userEmail, _getFromTimestampBy(event.timeSpan)).listen((userHistory) {
        add(StatsUpdated(attendedLessons: userHistory.attendedLessons, timeSpan: event.timeSpan));
      });
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
