
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class AuthUninitialized extends AuthState {
  @override
  String toString() => 'AuthUninitialized';
}

class AuthAuthenticated extends AuthState {
  FirebaseUser user;

  AuthAuthenticated({
    this.user,
  }) : super([user]);

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