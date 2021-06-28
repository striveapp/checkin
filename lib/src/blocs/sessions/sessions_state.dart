import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'sessions_state.freezed.dart';

@freezed
class SessionsState with _$SessionsState {
  const factory SessionsState.initialSessionsState() = InitialSessionsState;
  const factory SessionsState.sessionsUnlimited() = SessionsUnlimited;
  const factory SessionsState.sessionsLoaded(
      {required double totalLessonsOfPlan, required double attendedLessons}) = SessionsLoaded;
  const factory SessionsState.sessionsWarning(
      {required double totalLessonsOfPlan, required double attendedLessons}) = SessionsWarning;
}
