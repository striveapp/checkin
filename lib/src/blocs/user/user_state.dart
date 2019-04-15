import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class UserLoading extends UserState {
  @override
  String toString() => 'UserLoading';
}

class UserSuccess extends UserState {
  User currentUser;

  UserSuccess({
    this.currentUser
  }) : super([currentUser]);
  @override
  String toString() => 'UserSuccess';
}

class UserError extends UserState {
  @override
  String toString() => 'UserError';
}