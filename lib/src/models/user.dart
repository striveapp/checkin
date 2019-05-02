import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  static final List<String> ranks = ['White', 'Blue', 'Purple', 'Brown', 'Black'];
  final String name;
  final String email;
  final int counter;
  final String rank;
  final bool isOwner;

  User({
    @required this.name,
    @required this.email,
    this.counter= 0,
    this.rank= "White",
    this.isOwner= false,
  }) : super([name, email, counter, rank, isOwner]);

  @override
  String toString() {
    return 'User{name: $name, email: $email, counter: $counter, rank: $rank, isOwner: $isOwner}';
  }
}
