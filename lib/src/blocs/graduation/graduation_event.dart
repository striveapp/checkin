import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'graduation_event.freezed.dart';

@freezed
abstract class GraduationEvent with _$GraduationEvent {
  const factory GraduationEvent.graduationSystemUpdated() = GraduationSystemUpdated;
}