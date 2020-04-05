import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LessonsStatsEvent extends Equatable {
  const LessonsStatsEvent();
}

class UpdateLessonStats extends LessonsStatsEvent {
  final List<Lesson> lessons;

  UpdateLessonStats({@required this.lessons});

  @override
  String toString() => 'UpdateLessonStats';

  @override
  List<Object> get props => [lessons];
}
