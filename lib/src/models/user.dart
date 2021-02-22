import 'package:checkin/src/models/grade.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:meta/meta.dart';

import '../config.dart' as config;

class User extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  final Grade grade;
  final String selectedGymId;
  final bool isOwner;
  final bool hasActivePayments;
  final List<String> knownGymIds;

  User({
    @required this.name,
    @required this.email,
    @required this.imageUrl,
    this.uid,
    this.grade,
    this.selectedGymId,
    this.isOwner = false,
    this.hasActivePayments = false,
    this.knownGymIds,
  });

  factory User.fromFirebaseUser(FirebaseAuth.User firebaseUser,
      {String displayName, String photoUrl}) {
    return firebaseUser != null
        ? User(
            uid: firebaseUser.uid,
            name: firebaseUser.displayName ?? displayName,
            email: firebaseUser.email,
            imageUrl: firebaseUser.photoURL ?? photoUrl ?? config.DEFAULT_USER_IMAGE_URL,
          )
        : null;
  }

  @override
  List<Object> get props =>
      [name, email, imageUrl, grade, selectedGymId, isOwner, hasActivePayments, knownGymIds];

  @override
  String toString() {
    return 'User{uid: $uid, name: $name, email: $email, imageUrl: $imageUrl, grade: $grade, selectedGymId: $selectedGymId, isOwner: $isOwner, hasActivePayments: $hasActivePayments, knownGymIds: $knownGymIds}';
  }
}
