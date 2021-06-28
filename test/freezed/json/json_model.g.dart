// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JsonModel _$_$_JsonModelFromJson(Map<String, dynamic> json) {
  return _$_JsonModel(
    simpleField: json['simpleField'] as String?,
    requiredField: json['requiredField'] as String,
    defaultField: json['defaultField'] as bool? ?? true,
    grade: const GradeNullableConverter().fromJson(json['grade'] as String?),
  );
}

Map<String, dynamic> _$_$_JsonModelToJson(_$_JsonModel instance) =>
    <String, dynamic>{
      'simpleField': instance.simpleField,
      'requiredField': instance.requiredField,
      'defaultField': instance.defaultField,
      'grade': const GradeNullableConverter().toJson(instance.grade),
    };
