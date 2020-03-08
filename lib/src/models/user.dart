import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class UserWithHistory extends User {
  final UserHistory history;

  UserWithHistory(User user, UserHistory history) :
    this.history = history,
    super(name: user.name, email: user.email, imageUrl: user.imageUrl, counter: user.counter, grade: user.grade, isOwner: user.isOwner, hasActivePayments: user.hasActivePayments);
}

class User extends Equatable {
  final String name;
  final String email;
  final String imageUrl;
  final int counter;
  final Grade grade;
  final bool isOwner;
  final bool hasActivePayments;

  User({
    @required this.name,
    @required this.email,
    @required this.imageUrl,
    this.grade,
    this.counter = 0,
    this.isOwner = false,
    this.hasActivePayments = false,
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

  UserWithHistory withHistory(UserHistory history) {
    return UserWithHistory(this, history);
  }

  @override
  List<Object> get props => [name, email, imageUrl, counter, grade, isOwner, hasActivePayments];

  @override
  String toString() => 'User{name: $name, email: $email, imageUrl: $imageUrl, counter: $counter, grade: $grade, isOwner: $isOwner, hasActivePayments: $hasActivePayments}';
}
