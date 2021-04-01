import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'lessons_event.freezed.dart';

@freezed
abstract class LessonsEvent with _$LessonsEvent {
  const factory LessonsEvent.initializeLessons() = InitializeLessons;
  const factory LessonsEvent.lessonsUpdated(
      {DateTime selectedDay,
      List<Lesson> lessons,
      @Default([]) List<String> selectedFilterList}) = LessonsUpdated;
  const factory LessonsEvent.loadLessons({DateTime selectedDay, List<String> selectedFilterList}) =
      LoadLessons;
  const factory LessonsEvent.createLesson({DateTime selectedDay}) = CreateLesson;
  const factory LessonsEvent.updateCalendar({DateTime initialDay}) = UpdateCalendar;
}
