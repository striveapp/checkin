import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class StatsEvent extends Equatable {
  const StatsEvent();

  @override
  List<Object> get props => [];
}

class StatsUpdated extends StatsEvent {
  final List<Lesson> attendedLessons;
  final String timeSpan;

  StatsUpdated({
    @required this.attendedLessons,
    @required this.timeSpan,
  });

  @override
  List<Object> get props => [attendedLessons];

  @override
  String toString() {
    return 'StatsUpdated{attendedLessons: $attendedLessons}';
  }
}

class LoadStats extends StatsEvent {
  final String timeSpan;

  LoadStats({
    @required this.timeSpan,
  });

  @override
  List<Object> get props => [timeSpan];
}