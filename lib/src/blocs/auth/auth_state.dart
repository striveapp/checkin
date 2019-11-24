import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthUninitialized extends AuthState {
  @override
  String toString() => 'AuthUninitialized';
}

class AuthAuthenticated extends AuthState {
  final String loggedUserEmail;

  const AuthAuthenticated({this.loggedUserEmail});

  @override
  List<Object> get props => [loggedUserEmail];

  @override
  String toString() => 'AuthAuthenticated';
}

class AuthUnauthenticated extends AuthState {
  final Error error;

  const AuthUnauthenticated({
    this.error,
  });

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthUnauthenticated';
}
