import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Object> get props => [];
}

class LessonUpdated extends LessonEvent {
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

class LessonRegister extends LessonEvent {
  final Attendee attendee;

  const LessonRegister({
    @required this.attendee,
  });

  @override
  List<Object> get props => [attendee];

  @override
  String toString() {
    return 'LessonRegister{attendee: $attendee}';
  }
}

class LessonUnregister extends LessonEvent {
  final Attendee attendee;

  const LessonUnregister({
    @required this.attendee,
  });

  @override
  List<Object> get props => [attendee];

  @override
  String toString() {
    return 'LessonRegister{attendee: $attendee}';
  }
}

class LessonAcceptAll extends LessonEvent {

  @override
  String toString() => 'LessonAcceptAll';
}
