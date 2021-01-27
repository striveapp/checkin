import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.userUpdated({User user}) = UserUpdated;

  const factory UserEvent.updateName({String newName}) = UpdateName;

  const factory UserEvent.updateImageUrl({String userEmail}) = UpdateImageUrl;

  const factory UserEvent.updateGrade({Grade newGrade}) = UpdateGrade;

  const factory UserEvent.updateSelectedGym({String userEmail, String newGymId}) = UpdateSelectedGym;

  const factory UserEvent.updateFcmToken({String userEmail, String newToken}) = UpdateFcmToken;
}
