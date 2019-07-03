import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';

abstract class LessonsEvent extends Equatable {
  LessonsEvent([List props = const []]) : super(props);
}

class AttendLesson extends LessonsEvent {
  String lessonId;
  Attendee attendee;

  AttendLesson({
    this.lessonId,
    this.attendee,
  }) : super([lessonId, attendee]);

  @override
  String toString() => 'Attend';
}

class ConfirmAttendees extends LessonsEvent {
  String lessonId;
  List<Attendee> attendees;

  ConfirmAttendees({
    this.lessonId,
    this.attendees,
  }) : super([lessonId, attendees]);
  @override
  String toString() => 'ConfirmAttendees';
}

class LessonsUpdated extends LessonsEvent {

  final List<Lesson> lessons;

  LessonsUpdated({
    this.lessons,
  }) : super([lessons]);

  @override
  String toString() => 'LessonsUpdated';
}
