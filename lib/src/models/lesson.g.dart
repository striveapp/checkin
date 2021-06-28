// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lesson _$_$_LessonFromJson(Map<String, dynamic> json) {
  return _$_Lesson(
    id: json['id'] as String?,
    date: json['date'] as String?,
    name: json['name'] as String?,
    timeStart: json['timeStart'] as String?,
    timeEnd: json['timeEnd'] as String? ?? '',
    weekDay:
        const WeekdayNullableConverter().fromJson(json['weekDay'] as String?),
    timestamp: json['timestamp'] as int?,
    imageUrl: json['imageUrl'] as String?,
    gymId: json['gymId'] as String?,
    lessonConfig: json['lessonConfig'] == null
        ? null
        : LessonConfig.fromJson(json['lessonConfig'] as Map<String, dynamic>),
    locationUrl: json['locationUrl'] as String?,
    classCapacity: json['classCapacity'] as int? ?? 10,
    masters: (json['masters'] as List<dynamic>?)
            ?.map((e) => Master.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    attendees: (json['attendees'] as List<dynamic>?)
            ?.map((e) => Attendee.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    acceptedAttendees: (json['acceptedAttendees'] as List<dynamic>?)
            ?.map((e) => Attendee.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    isClosed: json['isClosed'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_LessonToJson(_$_Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'name': instance.name,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'weekDay': const WeekdayNullableConverter().toJson(instance.weekDay),
      'timestamp': instance.timestamp,
      'imageUrl': instance.imageUrl,
      'gymId': instance.gymId,
      'lessonConfig': instance.lessonConfig?.toJson(),
      'locationUrl': instance.locationUrl,
      'classCapacity': instance.classCapacity,
      'masters': instance.masters.map((e) => e.toJson()).toList(),
      'attendees': instance.attendees.map((e) => e.toJson()).toList(),
      'acceptedAttendees':
          instance.acceptedAttendees.map((e) => e.toJson()).toList(),
      'isClosed': instance.isClosed,
    };

_$_LessonTemplate _$_$_LessonTemplateFromJson(Map<String, dynamic> json) {
  return _$_LessonTemplate(
    id: json['id'] as String?,
    name: json['name'] as String?,
    timeStart: json['timeStart'] as String?,
    timeEnd: json['timeEnd'] as String? ?? '',
    weekDay: _$enumDecodeNullable(_$WeekdayEnumMap, json['weekDay']),
    imageUrl: json['imageUrl'] as String?,
    lessonConfig: json['lessonConfig'] == null
        ? null
        : LessonConfig.fromJson(json['lessonConfig'] as Map<String, dynamic>),
    classCapacity: json['classCapacity'] as int? ?? 10,
    masters: (json['masters'] as List<dynamic>?)
            ?.map((e) => Master.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_LessonTemplateToJson(_$_LessonTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'weekDay': _$WeekdayEnumMap[instance.weekDay],
      'imageUrl': instance.imageUrl,
      'lessonConfig': instance.lessonConfig?.toJson(),
      'classCapacity': instance.classCapacity,
      'masters': instance.masters.map((e) => e.toJson()).toList(),
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$WeekdayEnumMap = {
  Weekday.monday: 'monday',
  Weekday.tuesday: 'tuesday',
  Weekday.wednesday: 'wednesday',
  Weekday.thursday: 'thursday',
  Weekday.friday: 'friday',
  Weekday.saturday: 'saturday',
  Weekday.sunday: 'sunday',
};
