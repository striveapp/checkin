import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class SignIn extends AuthEvent {
  @override
  String toString() => 'Login';
}