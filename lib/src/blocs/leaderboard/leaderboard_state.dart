import 'package:checkin/src/models/user_history.dart';
import 'package:equatable/equatable.dart';

abstract class LeaderboardState extends Equatable {
  const LeaderboardState();
  @override
  List<Object> get props => [];
}

class LeaderboardInitial extends LeaderboardState {
  @override
  String toString() => 'LeaderboardInitial';
}

class LeaderboardLoaded extends LeaderboardState {
  final List<UserHistory> usersHistory;

  LeaderboardLoaded({
    this.usersHistory,
  });

  @override
  List<Object> get props => [usersHistory];

  @override
  String toString() => 'LeaderboardLoaded';
}