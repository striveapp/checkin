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
  final List<Attendee> acceptedAttendees;

  LessonStatsUpdated({
    @required this.acceptedAttendees
  });

  @override
  List<Object> get props => [acceptedAttendees];
}
