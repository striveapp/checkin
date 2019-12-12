import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserHistory extends Equatable {
  final List<Lesson> attendedLessons;

  UserHistory({
    @required this.attendedLessons
  });

  @override
  List<Object> get props => [attendedLessons];

  @override
  String toString() {
    return 'UserHistory{attendedLessons: $attendedLessons}';
  }
}