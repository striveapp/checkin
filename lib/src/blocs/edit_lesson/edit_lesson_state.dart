import 'package:checkin/src/models/master.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_lesson_state.freezed.dart';

@freezed
abstract class EditLessonState with _$EditLessonState {
  const factory EditLessonState.editLessonUninitialized() = EditLessonUninitialized;
  const factory EditLessonState.mastersLoaded({@required List<Master> masters}) = MastersLoaded;
}
