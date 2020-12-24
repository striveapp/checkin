import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/graduation_system.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'graduation_event.freezed.dart';

@freezed
abstract class GraduationEvent with _$GraduationEvent {
  const factory GraduationEvent.graduationSystemUpdated({
    @required GraduationSystem graduationSystem,
    @required int attendedLessonsForGrade,
  }) = GraduationSystemUpdated;

  const factory GraduationEvent.graduate({@required Grade newGrade}) = Graduate;

  const factory GraduationEvent.initializeGraduation() = InitializeGraduation;

}
