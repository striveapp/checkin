import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginWithGoogle extends LoginEvent {
  @override
  String toString() => 'LoginWithGoogle';
}
