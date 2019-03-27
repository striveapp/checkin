import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
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
  FirebaseUser user;

  LoginSuccess({
    this.user
  }) : super([user]);

  @override
  String toString() => 'LoginSuccess';
}

class LoginFailure extends LoginState {
  Exception error;

  LoginFailure({
    this.error,
  }) : super([error]);

  @override
  String toString() => 'LoginFailure';
}