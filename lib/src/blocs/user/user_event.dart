import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.userUpdated({User user}) = UserUpdated;

  const factory UserEvent.updateGrade({Grade newGrade}) = UpdateGrade;

  const factory UserEvent.updateSelectedGym({String userEmail, String newGymId}) =
      UpdateSelectedGym;
}
