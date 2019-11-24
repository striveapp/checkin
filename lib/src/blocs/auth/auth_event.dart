import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class AuthUpdated extends AuthEvent {
  final String loggedUserEmail;

  const AuthUpdated({
    this.loggedUserEmail,
  });

  @override
  List<Object> get props => [loggedUserEmail];

  @override
  String toString() => 'AuthUpdated';
}

class LoggedIn extends AuthEvent {
  final bool isFirstLogin;
  final User currentUser;

 const LoggedIn({
    this.currentUser,
    this.isFirstLogin,
  });

  @override
  List<Object> get props => [currentUser, isFirstLogin];

  @override
  String toString() => 'LoggedIn';
}

class LogOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}
