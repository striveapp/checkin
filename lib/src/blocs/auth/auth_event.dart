import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}


class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}
