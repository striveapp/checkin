import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class StatsState extends Equatable {
  const StatsState();

  @override
  List<Object> get props => [];
}

class StatsUninitialized extends StatsState {
  @override
  String toString() => 'StatsInitial';
}

class StatsLoaded extends StatsState {
  final List<Lesson> attendedLessons;
  final String timeSpan;

  StatsLoaded({
    @required this.attendedLessons,
    @required this.timeSpan,
  });

  @override
  List<Object> get props => [attendedLessons, timeSpan];

  @override
  String toString() {
    return 'StatsLoaded{attendedLessons: $attendedLessons}';
  }


}