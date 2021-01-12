import 'package:checkin/src/models/converters/grade_converter.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'graduation_system.freezed.dart';

part 'graduation_system.g.dart';

@freezed
abstract class GraduationSystem with _$GraduationSystem {
  factory GraduationSystem({
    @GradeConverter() @required Grade grade,
    @required double forNextLevel,
  }) = _GraduationSystem;

  factory GraduationSystem.fromJson(Map<String, dynamic> json) =>
      _$GraduationSystemFromJson(json);
}
