import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';

abstract class LessonState extends Equatable {
  const LessonState();

  @override
  List<Object> get props => [];
}

class LessonUninitialized extends LessonState {
  @override
  String toString() => 'LessonUninitialized';
}

class LessonLoading extends LessonState {
  @override
  String toString() => 'LessonLoading';
}

class LessonError extends LessonState {
  @override
  String toString() => 'LessonError';
}

class LessonLoaded extends LessonState {
  final Lesson lesson;

  const LessonLoaded({
    this.lesson,
  });

  @override
  List<Object> get props => [lesson];

  @override
  String toString() => 'LessonLoaded';
}
