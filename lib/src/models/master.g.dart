// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Master _$MasterFromJson(Map<String, dynamic> json) {
  return Master(
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$MasterToJson(Master instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'email': instance.email,
    };
