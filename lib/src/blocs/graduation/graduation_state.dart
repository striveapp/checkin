import 'package:checkin/src/models/grade.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'graduation_state.freezed.dart';

@freezed
abstract class GraduationState with _$GraduationState {
  const factory GraduationState.initialGraduationState() = InitialGraduationState;

  const factory GraduationState.graduationLoaded({
    @required Grade nextGrade,
    @required int attendedLessonsForGrade,
    @required double forNextLevel,
  }) = GraduationLoaded;
}
