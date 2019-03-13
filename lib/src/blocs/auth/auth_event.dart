import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class Login extends AuthEvent {
  @override
  String toString() => 'Login';
}