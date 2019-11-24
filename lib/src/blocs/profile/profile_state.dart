import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  String toString() => 'ProfileLoading';
}

class ProfileSuccess extends ProfileState {
  final User profileUser;
  final bool isCurrentUser;

  const ProfileSuccess({
    this.profileUser,
    this.isCurrentUser,
  });

  @override
  List<Object> get props => [profileUser, isCurrentUser];

  @override
  String toString() {
    return 'ProfileSuccess{profileUser: $profileUser, isCurrentUser: $isCurrentUser}';
  }


}

class ProfileError extends ProfileState {
  @override
  String toString() => 'ProfileError';
}