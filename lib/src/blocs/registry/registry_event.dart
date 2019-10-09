import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';

abstract class RegistryEvent extends Equatable {
  RegistryEvent([List props = const []]) : super(props);
}

class LoadLesson extends RegistryEvent {
  String lessonId;

  LoadLesson({
    this.lessonId
  }) : super([lessonId]);

  @override
  String toString() => 'LoadLesson';
}

class LessonUpdated extends RegistryEvent {

  final Lesson lesson;

  LessonUpdated({
    this.lesson,
  }) : super([lesson]);

  @override
  String toString() => 'LessonUpdated';
}


class Register extends RegistryEvent {
  String lessonId;
  Attendee attendee;

  Register({
    this.lessonId,
    this.attendee,
  }) : super([lessonId, attendee]);

  @override
  String toString() => 'Register';
}

class Unregister extends RegistryEvent {
  String lessonId;
  Attendee attendee;

  Unregister({
    this.lessonId,
    this.attendee,
  }) : super([lessonId, attendee]);

  @override
  String toString() => 'Unregister';
}



class ConfirmAttendees extends RegistryEvent {
  String lessonId;
  List<Attendee> attendees;

  ConfirmAttendees({
    this.lessonId,
    this.attendees,
  }) : super([lessonId, attendees]);
  @override
  String toString() => 'ConfirmAttendees';
}