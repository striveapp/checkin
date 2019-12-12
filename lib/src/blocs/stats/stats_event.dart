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

  StatsUpdated({
    @required this.attendedLessons
  });

  @override
  List<Object> get props => [attendedLessons];

  @override
  String toString() {
    return 'StatsUpdated{attendedLessons: $attendedLessons}';
  }
}