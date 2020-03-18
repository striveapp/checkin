import 'package:checkin/src/models/grade.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String imageUrl;
  final Grade grade;
  final bool isOwner;
  final bool hasActivePayments;

  User({
    @required this.name,
    @required this.email,
    @required this.imageUrl,
    this.grade,
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

  @override
  List<Object> get props => [name, email, imageUrl, grade, isOwner, hasActivePayments];

  @override
  String toString() => 'User{name: $name, email: $email, imageUrl: $imageUrl, grade: $grade, isOwner: $isOwner, hasActivePayments: $hasActivePayments}';
}
