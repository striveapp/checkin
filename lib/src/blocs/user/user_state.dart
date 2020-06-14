import 'package:checkin/src/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState.userLoading() = UserLoading;
  const factory UserState.userSuccess({User currentUser}) = UserSuccess;
  const factory UserState.userError() = UserError;
}