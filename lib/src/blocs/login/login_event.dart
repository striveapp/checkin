import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginWithGoogle() = LoginWithGoogle;

  const factory LoginEvent.loginWithApple() = LoginWithApple;

  const factory LoginEvent.loginPasswordless({
    @required String userEmail,
  }) = LoginPasswordless;

  const factory LoginEvent.loginWithTestUser() = LoginWithTestUser;

  const factory LoginEvent.loginWithTestUserTwo() = LoginWithTestUserTwo;

  const factory LoginEvent.loginWithTestUserAdmin() = LoginWithTestUserAdmin;

  const factory LoginEvent.loginWithTestUserMaster() = LoginWithTestUserMaster;
}
