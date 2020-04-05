import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserStatsEvent extends Equatable {
  const UserStatsEvent();

  @override
  List<Object> get props => [];
}

class UserStatsUpdated extends UserStatsEvent {
  final List<Lesson> attendedLessons;
  final String timeSpan;

  UserStatsUpdated({
    @required this.attendedLessons,
    @required this.timeSpan,
  });

  @override
  List<Object> get props => [attendedLessons];

  @override
  String toString() => 'UserStatsUpdated';
}
