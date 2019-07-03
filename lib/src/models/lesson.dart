import 'package:equatable/equatable.dart';

import 'attendee.dart';

class Lesson extends Equatable {
  final String id;
  final String name;
  final String timeStart;
  final String timeEnd;
  final String weekDay;
  final List<String> excludedGrades;
  final List<Attendee> attendees;

  Lesson({this.id, this.name, this.timeStart, this.timeEnd, this.weekDay,
      this.excludedGrades, this.attendees}) : super([id, name, timeStart, timeEnd, weekDay, excludedGrades, attendees]);

  @override
  String toString() {
    return 'Lesson{id: $id, name: $name, timeStart: $timeStart, timeEnd: $timeEnd, weekDay: $weekDay, excludedGrades: $excludedGrades, attendees: $attendees}';
  }

  bool containsUser(String user) {
    // todo the check on name is not accurate, we should use some kind of id
    if( attendees == null  ) {
      return false;
    }

    return attendees.any( (attendee) => attendee.name == user );
  }
}
