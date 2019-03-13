
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

// Anonymous ?
class LoginUninitialized extends AuthState {
  @override
  String toString() => 'LoginUninitialized';
}

class LoginError extends AuthState {
  @override
  String toString() => 'LoginError';
}

class LoginSuccess extends AuthState {
  @override
  String toString() => 'LoginSuccess';
}