import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  final bool isFirstLogin;
  final String currentUserEmail;

  LoggedIn({
    this.currentUserEmail,
    this.isFirstLogin,
  }) : super([currentUserEmail, isFirstLogin]);

  @override
  String toString() => 'LoggedIn';
}

class LogOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}
