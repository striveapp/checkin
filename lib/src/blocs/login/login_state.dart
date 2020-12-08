import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.loginInitial() = LoginInitial;

  const factory LoginState.loginLoading() = LoginLoading;

  const factory LoginState.loginSuccess({User loggedUser}) = LoginSuccess;

  const factory LoginState.loginFailure({String errorMessage}) =
      LoginFailure;

  const factory LoginState.wrongfullyInsertedEmail() = WrongfullyInsertedEmail;

}
