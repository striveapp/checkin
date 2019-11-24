import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  static final List<String> ranks = [
    'White',
    'Blue',
    'Purple',
    'Brown',
    'Black'
  ];
  final String name;
  final String email;
  final String imageUrl;
  final int counter;
  final String rank;
  final bool isOwner;

  User({
    @required this.name,
    @required this.email,
    @required this.imageUrl,
    this.rank,
    this.counter = 0,
    this.isOwner = false,
  });

  factory User.fromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null
        ? User(
            name: firebaseUser.displayName,
            email: firebaseUser.email,
            imageUrl: firebaseUser.photoUrl,
          )
        : null;
  }

  @override
  List<Object> get props => [name, email, imageUrl, counter, rank, isOwner];

  @override
  String toString() {
    return 'User{name: $name, email: $email, imageUrl: $imageUrl, counter: $counter, rank: $rank, isOwner: $isOwner}';
  }
}
