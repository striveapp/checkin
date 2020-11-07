import 'package:checkin/src/models/converters/grade_converter.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_model.freezed.dart';
part 'json_model.g.dart';

@freezed
abstract class JsonModel with _$JsonModel {

  factory JsonModel({
    String simpleField,
    @required String requiredField,
    @Default(true) bool defaultField,
    @GradeConverter() Grade grade,
  }) = _JsonModel;

  factory JsonModel.fromJson(Map<String, dynamic> json) => _$JsonModelFromJson(json);

}