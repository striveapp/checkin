import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  static final List<String> ranks = ['White', 'Blue', 'Purple', 'Brown', 'Black'];
  final String name;
  final String email;
  final int counter;
  final String rank;
  final bool isOwner;
  final bool isDev;
  final String imageUrl;

  User({
    @required this.name,
    @required this.email,
    @required this.imageUrl,
    this.counter= 0,
    this.rank= "White",
    this.isOwner= false,
    this.isDev = false,
  }) : super([name, email, imageUrl, counter, rank, isOwner, isDev]);

  @override
  String toString() {
    return 'User{name: $name, email: $email, imageUrl: $imageUrl, counter: $counter, rank: $rank, isOwner: $isOwner}';
  }
}
