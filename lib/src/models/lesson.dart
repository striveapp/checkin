import 'package:checkin/src/models/lesson_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:checkin/src/config.dart' as config;

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
    final int timestamp,
    final String imageUrl,
    // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
    @Default(config.DEFAULT_CLASS_CAPACITY) final int classCapacity,
    @Default([]) final List<Master> masters,
    @Default([]) final List<Attendee> attendees,
    @Default([]) final List<Attendee> acceptedAttendees,
    final LessonConfig lessonConfig,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
