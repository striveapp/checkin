import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithGoogle extends LoginEvent {
  @override
  String toString() => 'LoginWithGoogle';
}

class LoginWithTestUser extends LoginEvent {
  @override
  String toString() => 'LoginWithTestUser';
}

class LoginWithTestUserTwo extends LoginEvent {
  @override
  String toString() => 'LoginWithTestUserTwo';
}

class LoginWithTestUserOwner extends LoginEvent {
  @override
  String toString() => 'LoginWithTestUserOwner';
}
