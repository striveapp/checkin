import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

class LoginSuccess extends LoginState {
  final User loggedUser;

  const LoginSuccess({
    this.loggedUser,
  });

  @override
  List<Object> get props => [loggedUser];
  
  @override
  String toString() => 'LoginSuccess';
}

class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure({
    this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'LoginFailure';
}