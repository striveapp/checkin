import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';

abstract class LessonsEvent extends Equatable {
  const LessonsEvent();

  @override
  List<Object> get props => [];
}

class LessonsUpdated extends LessonsEvent {
  final List<Lesson> lessons;

  const LessonsUpdated({
    this.lessons,
  });

  @override
  List<Object> get props => [lessons];

  @override
  String toString() => 'LessonsUpdated';
}

class LoadLessons extends LessonsEvent {
  final DateTime selectedDay;

  LoadLessons({
    this.selectedDay,
  });

  @override
  List<Object> get props => [selectedDay];

  @override
  String toString() => 'LoadLessons';
}
