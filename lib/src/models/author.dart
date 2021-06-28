import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/grade_converter.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
abstract class Author with _$Author {
  factory Author({
    required final String imageUrl,
    required final String name,
    @GradeConverter() final Grade? grade,
  }) = _Author;

  factory Author.fromUser(User user) => Author(
        imageUrl: user.imageUrl,
        name: user.name!,
        grade: user.grade,
      );

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
