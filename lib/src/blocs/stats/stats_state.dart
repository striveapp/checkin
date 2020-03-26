import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StatsState extends Equatable {
  const StatsState();

  @override
  List<Object> get props => [];
}

class InitialStatsState extends StatsState {

  @override
  String toString() => 'InitialStatsState';
}

class TimespanUpdated extends StatsState {
  final String timespan;

  const TimespanUpdated({
    this.timespan,
  });

  @override
  List<Object> get props => [timespan];

  @override
  String toString() => 'TimespanUpdated';
}
