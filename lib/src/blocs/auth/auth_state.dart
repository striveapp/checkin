import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.authAuthenticated({User loggedUser}) = AuthAuthenticated;
  const factory AuthState.authUnauthenticated({Error error}) = AuthUnauthenticated;
}
