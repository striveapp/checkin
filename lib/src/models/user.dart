import 'package:checkin/src/models/grade.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../config.dart' as config;
import 'converters/grade_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@GradeConverter()
abstract class User with _$User {
  factory User({
    @required final String email,
    @required final String imageUrl,
    final String name,
    final String uid,
    final Grade grade,
    final String selectedGymId,
    final List<String> knownGymIds,
    @Default(false) final bool isOwner,
    @Default(false) final bool hasActivePayments,
  }) = _User;

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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
