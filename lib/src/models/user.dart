import 'package:checkin/src/models/grade.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  final Grade grade;
  final String selectedGymId;
  final bool isOwner;
  final bool hasActivePayments;

  User({
    @required this.name,
    @required this.email,
    @required this.imageUrl,
    this.uid,
    this.grade,
    this.selectedGymId,
    this.isOwner = false,
    this.hasActivePayments = false,
  });

  factory User.fromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null
        ? User(
      uid: firebaseUser.uid,
      name: firebaseUser.displayName,
      email: firebaseUser.email,
      imageUrl: firebaseUser.photoUrl,
    )
        : null;
  }

  @override
  List<Object> get props => [name, email, imageUrl, grade, selectedGymId, isOwner, hasActivePayments];

  @override
  String toString() {
    return 'User{name: $name, email: $email, imageUrl: $imageUrl, grade: $grade, isOwner: $isOwner, hasActivePayments: $hasActivePayments, selectedGymId: $selectedGymId}';
  }
}
