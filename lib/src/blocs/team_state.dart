import 'package:equatable/equatable.dart';

import 'package:checkin/src/models/team.dart';

abstract class TeamState extends Equatable {
  TeamState([List props = const []]) : super(props);
}

class TeamUninitialized extends TeamState {
  @override
  String toString() => 'TeamUninitialized';
}

class TeamError extends TeamState {
  @override
  String toString() => 'TeamError';
}

class TeamLoaded extends TeamState {
  final List<Team> teams;
  final bool hasReachedMax;

  TeamLoaded({
    this.teams,
    this.hasReachedMax,
  }) : super([teams, hasReachedMax]);

  TeamLoaded copyWith({
    List<Team> teams,
    bool hasReachedMax,
  }) {
    return TeamLoaded(
      teams: teams ?? this.teams,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'TeamLoaded { teams: ${teams.length}, hasReachedMax: $hasReachedMax }';
}
