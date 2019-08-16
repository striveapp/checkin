import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  UserEvent([List props = const []]) : super(props);
}

class Create extends UserEvent {
  User user;

  Create({
    this.user
  }) : super([user]);

  @override
  String toString() => 'Create';
}


class UserUpdated extends UserEvent {
  User user;

  UserUpdated({
    this.user
  }) : super([user]);

  @override
  String toString() => 'UserUpdated';
}

class UpdateGrade extends UserEvent {
  String grade;

  UpdateGrade({
    this.grade
  }) : super([grade]);

  @override
  String toString() => 'Update';
}

class UpdateName extends UserEvent {
  String name;

  UpdateName({
    this.name
  }) : super([name]);

  @override
  String toString() => 'Update';
}

class UpdateFcmToken extends UserEvent {
  String token;

  UpdateFcmToken({
    this.token
  }) : super([token]);

  @override
  String toString() => 'UpdateFcmToken';
}