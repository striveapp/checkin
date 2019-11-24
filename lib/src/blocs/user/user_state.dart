import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  String toString() => 'UserLoading';
}

class UserSuccess extends UserState {
  final User currentUser;

  const UserSuccess({this.currentUser});

  @override
  List<Object> get props => [currentUser];

  @override
  String toString() => 'UserSuccess';
}

class UserError extends UserState {
  @override
  String toString() => 'UserError';
}
