import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';

abstract class LessonsEvent extends Equatable {
  LessonsEvent([List props = const []]) : super(props);
}

class LessonsUpdated extends LessonsEvent {

  final List<Lesson> lessons;

  LessonsUpdated({
    this.lessons,
  }) : super([lessons]);

  @override
  String toString() => 'LessonsUpdated';
}
