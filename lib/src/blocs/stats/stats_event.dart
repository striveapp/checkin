import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StatsEvent extends Equatable {
  const StatsEvent();

  @override
  List<Object> get props => [];
}

class TimespanUpdate extends StatsEvent {
  final String timespan;

  const TimespanUpdate({this.timespan});

  @override
  List<Object> get props => [timespan];

  @override
  String toString() => 'TimespanUpdate';
}
