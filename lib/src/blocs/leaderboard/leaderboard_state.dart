import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class LeaderboardState extends Equatable {
  @override
  List<Object> get props => [];

}

class LeaderboardInitial extends LeaderboardState {
  @override
  String toString() => 'LeaderboardInitial';
}

class LeaderboardLoaded extends LeaderboardState {
  final List<UserWithHistory> users;

  LeaderboardLoaded({ this.users });

  @override
  String toString() => 'LeaderboardLoaded';
}