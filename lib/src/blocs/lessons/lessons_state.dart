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
  final String day;

  LessonsLoaded({
    this.lessons,
    this.day
  }) : super([lessons, day]);

  @override
  String toString() => 'LessonsLoaded';
}

class LessonsLoadedEmpty extends LessonsState {
  final String day;

  LessonsLoadedEmpty({
    this.day
  }) : super([day]);

  @override
  String toString() => 'LessonsLoadedEmpty';
}