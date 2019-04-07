import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class UserUninitialized extends UserState {
  @override
  String toString() => 'UserUninitialized';
}

class UserLoading extends UserState {
  @override
  String toString() => 'UserLoading';
}

class UserSuccess extends UserState {
  @override
  String toString() => 'UserSuccess';
}

class UserError extends UserState {
  @override
  String toString() => 'UserError';
}