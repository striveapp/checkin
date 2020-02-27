import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileUpdated extends ProfileEvent {
  final User user;
  final bool isCurrentUser;

  const ProfileUpdated({
    this.user,
    this.isCurrentUser
  });

  @override
  List<Object> get props => [user, isCurrentUser];

  @override
  String toString() => 'ProfileUpdated';
}