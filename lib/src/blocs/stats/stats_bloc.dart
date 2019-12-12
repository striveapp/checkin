import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/stats/stats_event.dart';
import 'package:checkin/src/blocs/stats/stats_state.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/resources/stats_repository.dart';
import 'package:flutter/material.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final StatsRepository statsRepository;
  final UserBloc userBloc;
  StreamSubscription<UserHistory> statsSub;

  StatsBloc({
    @required this.statsRepository,
    @required this.userBloc,
  }) {
    statsSub?.cancel();
    userBloc.listen((userState) {
      if(userState is UserSuccess) {
        statsSub?.cancel();
        statsSub = this.statsRepository.getUserStats(userState.currentUser.email).listen((userHistory) {
          add(StatsUpdated(attendedLessons: userHistory.attendedLessons));
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
      yield StatsLoaded(attendedLessons: event.attendedLessons);
    }
  }
}
