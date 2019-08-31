import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const []]) : super(props);
}

class ProfileUpdated extends ProfileEvent {
  User user;

  ProfileUpdated({
    this.user
  }) : super([user]);

  @override
  String toString() => 'ProfileUpdated';
}

class LoadProfile extends ProfileEvent {
  String profileEmail;

  LoadProfile({this.profileEmail}): super([profileEmail]);

  @override
  String toString() => 'LoadProfile';
}