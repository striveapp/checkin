import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';

abstract class LessonsState extends Equatable {
  LessonsState([List props = const []]) : super(props);
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

  LessonsLoaded({
    this.lessons,
  }) : super([lessons]);

  @override
  String toString() => 'LessonsLoaded';
}

class LessonsLoadedEmpty extends LessonsState {
  @override
  String toString() => 'LessonsLoadedEmpty';
}