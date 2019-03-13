
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

// Anonymous ?
class AuthUninitialized extends AuthState {
  @override
  String toString() => 'AuthUninitialized';
}

class AuthError extends AuthState {
  Error error;

  AuthError({
    this.error,
  }) : super([error]);

  @override
  String toString() => 'AuthError';
}

class AuthSuccess extends AuthState {
  FirebaseUser user;

  AuthSuccess({
    this.user,
  }) : super([user]);

  @override
  String toString() => 'AuthSuccess';
}