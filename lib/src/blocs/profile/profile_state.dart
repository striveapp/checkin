import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initialProfileState() = InitialProfileState;
  const factory ProfileState.profileLoaded({
    required User profileUser,
    required bool isCurrentUser,
  }) = ProfileLoaded;
}
