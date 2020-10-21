import 'package:checkin/src/models/grade.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'graduation_system.freezed.dart';

@freezed
abstract class GraduationSystem with _$GraduationSystem {
  factory GraduationSystem({@required Grade grade, @required double forNextLevel}) = _GraduationSystem;
}