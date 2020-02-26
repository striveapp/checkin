// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
    id: json['id'] as String,
    name: json['name'] as String,
    timeStart: json['timeStart'] as String,
    timeEnd: json['timeEnd'] as String,
    weekDay: json['weekDay'] as String,
    attendees: (json['attendees'] as List)
        ?.map((e) =>
            e == null ? null : Attendee.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    masters: (json['masters'] as List)
        ?.map((e) =>
            e == null ? null : Master.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'weekDay': instance.weekDay,
      'attendees': instance.attendees?.map((e) => e?.toJson())?.toList(),
      'masters': instance.masters?.map((e) => e?.toJson())?.toList(),
      'timestamp': instance.timestamp,
    };
