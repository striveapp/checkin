import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class LeaderboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LeaderboardUpdated extends LeaderboardEvent {
  final List<UserWithHistory> users;

  LeaderboardUpdated({ this.users });

  List<Object> get props => [users];

  @override
  String toString() => 'LeaderboardUpdated';
}