import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class RegistryEvent extends Equatable {
  const RegistryEvent();

  @override
  List<Object> get props => [];
}

class LessonUpdated extends RegistryEvent {
  final Lesson lesson;
  final User currentUser;

  const LessonUpdated({
    this.lesson,
    this.currentUser,
  });

  @override
  List<Object> get props => [lesson, currentUser];

  @override
  String toString() => 'LessonUpdated';
}

class Register extends RegistryEvent {
  final String lessonId;
  final Attendee attendee;

  const Register({
    this.lessonId,
    this.attendee,
  });

  @override
  List<Object> get props => [lessonId, attendee];

  @override
  String toString() => 'Register';
}

class Unregister extends RegistryEvent {
  final String lessonId;
  final Attendee attendee;

  const Unregister({
    this.lessonId,
    this.attendee,
  });

  @override
  List<Object> get props => [lessonId, attendee];

  @override
  String toString() => 'Unregister';
}

class ConfirmAttendees extends RegistryEvent {
  final Lesson lesson;

  const ConfirmAttendees({
    this.lesson,
  });

  @override
  List<Object> get props => [lesson];

  @override
  String toString() => 'ConfirmAttendees';
}
