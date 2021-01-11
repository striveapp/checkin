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
    timeEnd: json['timeEnd'] as String,
    weekDay: json['weekDay'] as String,
    timestamp: json['timestamp'] as int,
    imageUrl: json['imageUrl'] as String,
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
    lessonConfig: json['lessonConfig'] == null
        ? null
        : LessonConfig.fromJson(json['lessonConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_LessonToJson(_$_Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'name': instance.name,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'weekDay': instance.weekDay,
      'timestamp': instance.timestamp,
      'imageUrl': instance.imageUrl,
      'classCapacity': instance.classCapacity,
      'masters': instance.masters?.map((e) => e?.toJson())?.toList(),
      'attendees': instance.attendees?.map((e) => e?.toJson())?.toList(),
      'acceptedAttendees':
          instance.acceptedAttendees?.map((e) => e?.toJson())?.toList(),
      'lessonConfig': instance.lessonConfig?.toJson(),
    };
