import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStarted() = AppStarted;
  const factory AuthEvent.authUpdated({User? loggedUser}) = AuthUpdated;
  const factory AuthEvent.logOut() = LogOut;
}
