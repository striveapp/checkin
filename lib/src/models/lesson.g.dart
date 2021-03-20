// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lesson _$_$_LessonFromJson(Map<String, dynamic> json) {
  return _$_Lesson(
    id: json['id'] as String,
    date: json['date'] as String,
    name: json['name'] as String,
    timeStart: json['timeStart'] as String,
    timeEnd: json['timeEnd'] as String ?? '',
    weekDay: _$enumDecodeNullable(_$WeekdayEnumMap, json['weekDay']),
    timestamp: json['timestamp'] as int,
    imageUrl: json['imageUrl'] as String,
    lessonConfig: json['lessonConfig'] == null
        ? null
        : LessonConfig.fromJson(json['lessonConfig'] as Map<String, dynamic>),
    classCapacity: json['classCapacity'] as int ?? 10,
    masters: (json['masters'] as List)
            ?.map((e) =>
                e == null ? null : Master.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    attendees: (json['attendees'] as List)
            ?.map((e) =>
                e == null ? null : Attendee.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    acceptedAttendees: (json['acceptedAttendees'] as List)
            ?.map((e) =>
                e == null ? null : Attendee.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    isClosed: json['isClosed'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_LessonToJson(_$_Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'name': instance.name,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'weekDay': _$WeekdayEnumMap[instance.weekDay],
      'timestamp': instance.timestamp,
      'imageUrl': instance.imageUrl,
      'lessonConfig': instance.lessonConfig?.toJson(),
      'classCapacity': instance.classCapacity,
      'masters': instance.masters?.map((e) => e?.toJson())?.toList(),
      'attendees': instance.attendees?.map((e) => e?.toJson())?.toList(),
      'acceptedAttendees':
          instance.acceptedAttendees?.map((e) => e?.toJson())?.toList(),
      'isClosed': instance.isClosed,
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

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

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

const _$WeekdayEnumMap = {
  Weekday.monday: 'monday',
  Weekday.tuesday: 'tuesday',
  Weekday.wednesday: 'wednesday',
  Weekday.thursday: 'thursday',
  Weekday.friday: 'friday',
  Weekday.saturday: 'saturday',
  Weekday.sunday: 'sunday',
};
