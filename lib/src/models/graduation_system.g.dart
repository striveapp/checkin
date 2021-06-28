// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graduation_system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GraduationSystem _$_$_GraduationSystemFromJson(Map<String, dynamic> json) {
  return _$_GraduationSystem(
    grade: _$enumDecode(_$GradeEnumMap, json['grade']),
    forNextLevel: (json['forNextLevel'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_GraduationSystemToJson(
        _$_GraduationSystem instance) =>
    <String, dynamic>{
      'grade': _$GradeEnumMap[instance.grade],
      'forNextLevel': instance.forNextLevel,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$GradeEnumMap = {
  Grade.white: 'white',
  Grade.blue: 'blue',
  Grade.purple: 'purple',
  Grade.brown: 'brown',
  Grade.black: 'black',
};
