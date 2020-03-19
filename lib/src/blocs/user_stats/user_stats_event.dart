import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserStatsEvent extends Equatable {
  const UserStatsEvent();

  @override
  List<Object> get props => [];
}

class StatsUpdated extends UserStatsEvent {
  final List<Lesson> attendedLessons;
  final String timeSpan;

  StatsUpdated({
    @required this.attendedLessons,
    @required this.timeSpan,
  });

  @override
  List<Object> get props => [attendedLessons];

  @override
  String toString() => 'StatsUpdated{attendedLessons: $attendedLessons}';
}

class LoadStats extends UserStatsEvent {
  final String timeSpan;

  LoadStats({
    @required this.timeSpan,
  });

  @override
  List<Object> get props => [timeSpan];
}