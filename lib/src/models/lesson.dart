import 'package:checkin/src/config.dart';
import 'package:checkin/src/models/converters/weekday_converter.dart';
import 'package:checkin/src/models/lesson_config.dart';
import 'package:checkin/src/models/weekday.dart';
import 'package:checkin/src/util/crypto_util.dart';
import 'package:checkin/src/util/date_util.dart';
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
    @Default("") final String timeEnd,
    @WeekdayConverter() final Weekday weekDay,
    final int timestamp,
    final String imageUrl,
    final String gymId,
    final LessonConfig lessonConfig,
    final String locationUrl,
    // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
    @Default(DEFAULT_CLASS_CAPACITY) final int classCapacity,
    @Default([]) final List<Master> masters,
    @Default([]) final List<Attendee> attendees,
    @Default([]) final List<Attendee> acceptedAttendees,
    @Default(false) final bool isClosed,
  }) = _Lesson;

  factory Lesson.createDefault(String date, String gymId) {
    return Lesson(
      id: CryptoUtil.generateUUID(),
      date: date,
      name: "BJJ",
      imageUrl: STRIVE_LOGO,
      timeStart: "00:00",
      timeEnd: "00:00",
      gymId: gymId,
      weekDay: DateUtil.retrieveWeekDay(date),
    );
  }

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

@freezed
abstract class LessonTemplate with _$LessonTemplate {
  factory LessonTemplate({
    final String id,
    final String name,
    final String timeStart,
    @Default("") final String timeEnd,
    final Weekday weekDay,
    final String imageUrl,
    final LessonConfig lessonConfig,
    // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
    @Default(DEFAULT_CLASS_CAPACITY) final int classCapacity,
    @Default([]) final List<Master> masters,
  }) = _LessonTemplate;

  factory LessonTemplate.fromJson(Map<String, dynamic> json) => _$LessonTemplateFromJson(json);
}
