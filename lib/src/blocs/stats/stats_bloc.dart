import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/models/timespan.dart';

import 'bloc.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  static final List<Timespan> availableTimespans = <Timespan>[
    Timespan.week,
    Timespan.month,
    Timespan.all,
  ];

  StatsBloc() : super(InitialStatsState());

  @override
  Stream<StatsState> mapEventToState(
    StatsEvent event,
  ) async* {
    if (event is TimespanUpdate) {
      yield TimespanUpdated(timespan: event.timespan);
    }
  }
}
