import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  ProfileState([List props = const []]) : super(props);
}

class ProfileLoading extends ProfileState {
  @override
  String toString() => 'ProfileLoading';
}

class ProfileSuccess extends ProfileState {
  User profileUser;

  ProfileSuccess({
    this.profileUser
  }) : super([profileUser]);
  @override
  String toString() => 'ProfileSuccess';
}

class ProfileError extends ProfileState {
  @override
  String toString() => 'ProfileError';
}