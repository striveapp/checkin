import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String rank;
  final bool isOwner;

  User(
    this.name,
    this.email,
    this.rank,
    this.isOwner,
  ) : super([name, email, rank, isOwner]);

  @override
  String toString() {
    return 'User{name: $name, email: $email, rank: $rank, isOwner: $isOwner}';
  }
}
