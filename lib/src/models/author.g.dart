// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Author _$_$_AuthorFromJson(Map<String, dynamic> json) {
  return _$_Author(
    imageUrl: json['imageUrl'] as String,
    name: json['name'] as String,
    grade: const GradeConverter().fromJson(json['grade'] as String),
  );
}

Map<String, dynamic> _$_$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'grade': const GradeConverter().toJson(instance.grade),
    };
