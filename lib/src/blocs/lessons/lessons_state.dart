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

  const LessonsLoaded({this.lessons});

  @override
  List<Object> get props => [lessons];

  @override
  String toString() => 'LessonsLoaded';
}

class LessonsLoadedEmpty extends LessonsState {
  @override
  String toString() => 'LessonsLoadedEmpty';
}
