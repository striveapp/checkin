// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    name: json['name'] as String,
    email: json['email'] as String,
    imageUrl: json['imageUrl'] as String,
    uid: json['uid'] as String,
    grade: _$enumDecodeNullable(_$GradeEnumMap, json['grade']),
    selectedGymId: json['selectedGymId'] as String,
    knownGymIds: (json['knownGymIds'] as List)?.map((e) => e as String)?.toList(),
    isOwner: json['isOwner'] as bool ?? false,
    hasActivePayments: json['hasActivePayments'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'uid': instance.uid,
      'grade': _$GradeEnumMap[instance.grade],
      'selectedGymId': instance.selectedGymId,
      'knownGymIds': instance.knownGymIds,
      'isOwner': instance.isOwner,
      'hasActivePayments': instance.hasActivePayments,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries.singleWhere((e) => e.value == source, orElse: () => null)?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$GradeEnumMap = {
  Grade.white: 'white',
  Grade.blue: 'blue',
  Grade.purple: 'purple',
  Grade.brown: 'brown',
  Grade.black: 'black',
};
