import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'sessions_event.freezed.dart';

@freezed
class SessionsEvent with _$SessionsEvent {
  const factory SessionsEvent.sessionsUpdated({required Membership membership}) = SessionsUpdated;
  const factory SessionsEvent.sessionsUpdatedWithHistory(
      {required Membership membership,
      required UserHistory userHistory}) = SessionsUpdatedWithHistory;
}
