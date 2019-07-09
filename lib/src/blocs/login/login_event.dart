import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
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
