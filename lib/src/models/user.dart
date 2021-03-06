import 'package:checkin/src/models/grade.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../config.dart' as config;
import 'converters/grade_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required final String email,
    required final String imageUrl,
    final String? name,
    final String? uid,
    final double? weight,
    final String? selectedGymId,
    @JsonKey(ignore: true) final DateTime? birthday,
    @GradeConverter() final Grade? grade,
    @Default([]) final List<String> knownGymIds,
    @Default(false) final bool isOwner,
  }) = _User;

  static User? fromFirebaseUser(FirebaseAuth.User? firebaseUser,
      {String? displayName, String? photoUrl}) {
    return firebaseUser != null
        ? User(
            uid: firebaseUser.uid,
            name: firebaseUser.displayName ?? displayName,
            email: firebaseUser.email!,
            imageUrl: firebaseUser.photoURL ?? photoUrl ?? config.DEFAULT_USER_IMAGE_URL,
          )
        : null;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
