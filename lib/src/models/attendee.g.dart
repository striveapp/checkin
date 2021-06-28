// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendee _$AttendeeFromJson(Map<String, dynamic> json) {
  return Attendee(
    name: json['name'] as String?,
    grade: const GradeNullableConverter().fromJson(json['grade'] as String?),
    imageUrl: json['imageUrl'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$AttendeeToJson(Attendee instance) => <String, dynamic>{
      'name': instance.name,
      'grade': const GradeNullableConverter().toJson(instance.grade),
      'imageUrl': instance.imageUrl,
      'email': instance.email,
    };
