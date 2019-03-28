import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String rank;
  final bool canCreateTeams;

  User(
    this.name,
    this.email,
    this.rank,
    this.canCreateTeams,
  ) : super([name, email, rank, canCreateTeams]);

  @override
  String toString() {
    return 'User{name: $name, email: $email, rank: $rank, canCreateTeams: $canCreateTeams}';
  }
}
