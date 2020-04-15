import 'package:checkin/src/models/attendee.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LessonsStatsState extends Equatable {
  const LessonsStatsState();
}

class LessonsStatsInitial extends LessonsStatsState {
  @override
  List<Object> get props => [];
}

class LessonStatsUpdated extends LessonsStatsState {
  final Map<Attendee, int> acceptedAttendeesWithCounter;
  final int totalAttendees;

  LessonStatsUpdated(
      {@required this.acceptedAttendeesWithCounter,
      @required this.totalAttendees});

  @override
  List<Object> get props => [acceptedAttendeesWithCounter, totalAttendees];

  @override
  String toString() =>
      'LessonStatsUpdated{acceptedAttendeesWithCounter: $acceptedAttendeesWithCounter, totalAttendees: $totalAttendees}';
}
