// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graduation_system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GraduationSystem _$_$_GraduationSystemFromJson(Map<String, dynamic> json) {
  return _$_GraduationSystem(
    grade: const GradeConverter().fromJson(json['grade'] as String),
    forNextLevel: (json['forNextLevel'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_GraduationSystemToJson(_$_GraduationSystem instance) => <String, dynamic>{
      'grade': const GradeConverter().toJson(instance.grade),
      'forNextLevel': instance.forNextLevel,
    };
