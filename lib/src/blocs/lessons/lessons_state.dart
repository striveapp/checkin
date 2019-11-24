import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';

abstract class LessonsState extends Equatable {
  const LessonsState();

  @override
  List<Object> get props => [];
}

class LessonsUninitialized extends LessonsState {
  @override
  String toString() => 'LessonsUninitialized';
}

class LessonsError extends LessonsState {
  @override
  String toString() => 'LessonsError';
}

class LessonsLoaded extends LessonsState {
  final List<Lesson> lessons;
  final String day;

  const LessonsLoaded({this.lessons, this.day});

  @override
  List<Object> get props => [lessons, day];

  @override
  String toString() => 'LessonsLoaded';
}

class LessonsLoadedEmpty extends LessonsState {
  final String day;

  const LessonsLoadedEmpty({this.day});

  @override
  List<Object> get props => [day];

  @override
  String toString() => 'LessonsLoadedEmpty';
}
