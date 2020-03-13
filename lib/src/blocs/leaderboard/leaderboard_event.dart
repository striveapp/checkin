import 'package:checkin/src/models/user_history.dart';
import 'package:equatable/equatable.dart';

abstract class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();

  @override
  List<Object> get props => [];
}

class LeaderboardUpdated extends LeaderboardEvent {
  final List<UserHistory> usersHistory;

  LeaderboardUpdated({
    this.usersHistory,
  });

  @override
  List<Object> get props => [usersHistory];

  @override
  String toString() => 'LeaderboardUpdated';
}
