import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'attendee.dart';
import 'master.dart';

part 'lesson.g.dart';

@JsonSerializable(explicitToJson: true)
class Lesson extends Equatable {
  final String id;
  final String name;
  final String timeStart;
  final String timeEnd;
  final String weekDay;
  final List<Attendee> attendees;
  final List<Master> masters;

  Lesson({this.id, this.name, this.timeStart, this.timeEnd, this.weekDay, this.attendees, this.masters}) : super([id, name, timeStart, timeEnd, weekDay, attendees, masters]);

  @override
  String toString() {
    return 'Lesson{id: $id, name: $name, timeStart: $timeStart, timeEnd: $timeEnd, weekDay: $weekDay, attendees: $attendees}, masters: $masters';
  }

  bool containsUser(String email) {
    // todo: we should use some kind of id to perform this check not the email
    if( attendees == null  ) {
      return false;
    }

    return attendees.any( (attendee) => attendee.email == email );
  }

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}