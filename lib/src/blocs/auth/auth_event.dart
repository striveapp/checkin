import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class AuthUpdated extends AuthEvent {
  final String currentUserEmail;

  AuthUpdated({
    this.currentUserEmail,
  }) : super([currentUserEmail]);

  @override
  String toString() => 'AuthUpdated';
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
