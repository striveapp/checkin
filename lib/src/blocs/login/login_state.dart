
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class LoginUninitialized extends LoginState {
  @override
  String toString() => 'LoginUninitialized';
}

class LoginError extends LoginState {
  @override
  String toString() => 'LoginError';
}

class LoginSuccess extends LoginState {
  @override
  String toString() => 'LoginSuccess';
}