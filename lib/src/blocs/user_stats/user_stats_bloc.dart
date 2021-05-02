import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_event.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_state.dart';
import 'package:checkin/src/models/lesson.dart';
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
  }) : super(UserStatsUninitialized()) {
    _onStatsStateChanged(statsBloc.state);
    statsBloc.stream.listen(_onStatsStateChanged);
  }

  void _onStatsStateChanged(statsBlocState) {
    if (statsBlocState is TimespanUpdated) {
      statsSub?.cancel();
      statsSub = this
          .statsRepository
          .getUserStats(selectedGymId, userEmail, statsBlocState.timespan)
          .listen((userHistory) {
        add(UserStatsUpdated(
          attendedLessons: userHistory.attendedLessons,
          timespan: statsBlocState.timespan,
        ));
      });
    }
  }

  @override
  Stream<UserStatsState> mapEventToState(UserStatsEvent event) async* {
    if (event is UserStatsUpdated) {
      yield UserStatsLoaded(
        attendedLessons: _sortByDateAndTime(event.attendedLessons),
        timespan: event.timespan,
      );
    }
  }

  @override
  Future<void> close() {
    statsSub?.cancel();
    return super.close();
  }

  List<Lesson> _sortByDateAndTime(List<Lesson> lessons) {
    return lessons
      ..sort(((a, b) {
        if (a.date == null || b.date == null) {
          return 0;
        }
        return _getDate(b.date, b.timeStart).compareTo(_getDate(a.date, a.timeStart));
      }));
  }

  _getDate(String date, String time) {
    return DateTime.parse('$date $time:00');
  }
}
