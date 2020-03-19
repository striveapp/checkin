import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lessons_stats_event.dart';
part 'lessons_stats_state.dart';

class LessonsStatsBloc extends Bloc<LessonsStatsEvent, LessonsStatsState> {
  @override
  LessonsStatsState get initialState => LessonsStatsInitial();

  @override
  Stream<LessonsStatsState> mapEventToState(
    LessonsStatsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
