// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    email: json['email'] as String,
    imageUrl: json['imageUrl'] as String,
    name: json['name'] as String?,
    uid: json['uid'] as String?,
    weight: (json['weight'] as num?)?.toDouble(),
    selectedGymId: json['selectedGymId'] as String?,
    grade: const GradeConverter().fromJson(json['grade'] as String?),
    knownGymIds: (json['knownGymIds'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    isOwner: json['isOwner'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'uid': instance.uid,
      'weight': instance.weight,
      'selectedGymId': instance.selectedGymId,
      'grade': const GradeConverter().toJson(instance.grade),
      'knownGymIds': instance.knownGymIds,
      'isOwner': instance.isOwner,
    };
