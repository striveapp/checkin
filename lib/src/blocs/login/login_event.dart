import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class Login extends LoginEvent {
  @override
  String toString() => 'Login';
}