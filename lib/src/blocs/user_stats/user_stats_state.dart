import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserStatsState extends Equatable {
  const UserStatsState();

  @override
  List<Object> get props => [];
}

class UserStatsUninitialized extends UserStatsState {
  @override
  String toString() => 'StatsInitial';
}

class UserStatsLoaded extends UserStatsState {
  final List<Lesson> attendedLessons;
  final String timespan;

  UserStatsLoaded({
    @required this.attendedLessons,
    @required this.timespan,
  });

  @override
  List<Object> get props => [attendedLessons, timespan];

  @override
  String toString() => 'UserStatsLoaded';
}