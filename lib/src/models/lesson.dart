import 'package:freezed_annotation/freezed_annotation.dart';

import 'attendee.dart';
import 'master.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
abstract class Lesson with _$Lesson {

  factory Lesson({
    final String id,
    final String date,
    final String name,
    final String timeStart,
    final String timeEnd,
    final String weekDay,
    final List<Attendee> attendees,
    final List<Attendee> acceptedAttendees,
    final List<Master> masters,
    final int timestamp,
    final int classCapacity,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);


}