import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserUpdated extends UserEvent {
  final User user;

  const UserUpdated({this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UserUpdated';
}

class UpdateGrade extends UserEvent {
  final String newGrade;

  const UpdateGrade({this.newGrade});

  @override
  List<Object> get props => [newGrade];

  @override
  String toString() => 'UpdateGrade';
}

class UpdateName extends UserEvent {
  final String newName;

  const UpdateName({
    this.newName,
  });

  @override
  List<Object> get props => [newName];

  @override
  String toString() => 'UpdateName';
}

class UpdateFcmToken extends UserEvent {
  final User currentUser;
  final String newToken;

  const UpdateFcmToken({
    this.currentUser,
    this.newToken,
  });

  @override
  List<Object> get props => [currentUser, newToken];

  @override
  String toString() => 'UpdateFcmToken';
}