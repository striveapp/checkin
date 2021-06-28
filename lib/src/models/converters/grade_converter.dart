import 'package:checkin/src/models/grade.dart';
import 'package:json_annotation/json_annotation.dart';

class GradeConverter implements JsonConverter<Grade?, String?> {
  const GradeConverter();

  @override
  Grade? fromJson(String? json) => json?.toGrade();

  @override
  String? toJson(Grade? grade) => grade?.name;
}
