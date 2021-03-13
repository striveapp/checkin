import 'dart:async';

import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/models/timespan.dart';

abstract class LessonRepository {
  Stream<List<Lesson>> getLessonsForDay(String gymId, DateTime day, [List<String> filterTypes]);

  Stream<List<Lesson>> getLessonsByMasterAndTimespan(Master master, Timespan timespan);

  Stream<Lesson> getLesson(String gymId, String date, String lessonId);

  Future<void> register(String gymId, String date, String lessonId, Attendee attendee);

  Future<void> unregister(String gymId, String date, String lessonId, Attendee attendee);

  Future<void> closeLesson(String gymId, String date, String lessonId);

  Future<void> deleteLesson(String gymId, String date, String lessonId);

  Future<void> updateLessonTimeStart(
      String gymId, String date, String lessonId, String newTimeStart);

  Future<void> updateLessonTimeEnd(String gymId, String date, String lessonId, String newTimeEnd);

  Future<void> updateLessonName(String gymId, String date, String lessonId, String newName);

  Future<void> updateLessonCapacity(String gymId, String date, String lessonId, int newCapacity);

  Future<void> updateLessonImage(String gymId, String date, String lessonId, String newImageUrl);

  Future<void> updateLessonMasters(String gymId, String date, String lessonId, List<Master> newMasters);
}
