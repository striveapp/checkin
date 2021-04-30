import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'profile_event.freezed.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.initializeProfile() = InitializeProfile;

  const factory ProfileEvent.profileUpdated({
    @required User user,
    @required bool isCurrentUser,
  }) = ProfileUpdated;

  const factory ProfileEvent.updateImageUrl({
    @required String userEmail,
  }) = UpdateImageUrl;

  const factory ProfileEvent.updateName({
    @required String userEmail,
    @required String newName,
  }) = UpdateName;

  const factory ProfileEvent.updateGrade({
    @required String userEmail,
    @required Grade newGrade,
  }) = UpdateGrade;

  const factory ProfileEvent.updateSelectedGym({
    @required String userEmail,
    @required String newGymId,
  }) = UpdateSelectedGym;
}
