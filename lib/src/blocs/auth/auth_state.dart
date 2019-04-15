import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class AuthUninitialized extends AuthState {
  @override
  String toString() => 'AuthUninitialized';
}

class AuthAuthenticated extends AuthState {
  bool isFirstLogin;
  String currentUserEmail;

  AuthAuthenticated({
    this.currentUserEmail,
    this.isFirstLogin
  }) : super([currentUserEmail, isFirstLogin]);

  @override
  String toString() => 'AuthAuthenticated';
}

class AuthUnauthenticated extends AuthState {
  Error error;

  AuthUnauthenticated({
    this.error,
  }) : super([error]);

  @override
  String toString() => 'AuthUnauthenticated';
}