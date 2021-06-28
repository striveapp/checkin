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
    grade: const GradeConverter().fromJson(json['grade'] as String?),
    selectedGymId: json['selectedGymId'] as String?,
    knownGymIds: (json['knownGymIds'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    hasActivePayments: json['hasActivePayments'] as bool?,
    isOwner: json['isOwner'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'uid': instance.uid,
      'grade': const GradeConverter().toJson(instance.grade),
      'selectedGymId': instance.selectedGymId,
      'knownGymIds': instance.knownGymIds,
      'hasActivePayments': instance.hasActivePayments,
      'isOwner': instance.isOwner,
    };
