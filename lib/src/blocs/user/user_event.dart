import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  UserEvent([List props = const []]) : super(props);
}

class Load extends UserEvent {
  String email;

  Load({
    this.email
  }) : super ([email]);

  @override
  String toString() => 'Load';
}

class Create extends UserEvent {
  User user;

  Create({
    this.user
  }) : super([user]);

  @override
  String toString() => 'Create';
}

class Update extends UserEvent {
  String grade;

  Update({
    this.grade
  }) : super([grade]);

  @override
  String toString() => 'Update';
}

class Delete extends UserEvent {
  @override
  String toString() => 'Delete';
}
