import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/constants.dart' as constants;

import 'bloc.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {

  static final List<String> timespans = <String>[
    constants.WEEK,
    constants.MONTH,
    constants.YEAR
  ];

  StatsBloc() : super(InitialStatsState());

  @override
  Stream<StatsState> mapEventToState(
    StatsEvent event,
  ) async* {
    if(event is TimespanUpdate) {
      yield TimespanUpdated(timespan: event.timespan);
    }
  }
}
