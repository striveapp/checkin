import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'graduation_state.freezed.dart';

@freezed
abstract class GraduationState with _$GraduationState {
  const factory GraduationState.initialGraduationState() = InitialGraduationState;
}