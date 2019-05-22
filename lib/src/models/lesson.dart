import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String name;
  final String timeStart;
  final String timeEnd;
  final String weekDay;
  final List<String> excludedGrades;

  Lesson({this.name, this.timeStart, this.timeEnd, this.weekDay,
      this.excludedGrades}) : super([name, timeStart, timeEnd, weekDay, excludedGrades]);

  @override
  String toString() {
    return 'Lesson{name: $name, timeStart: $timeStart, timeEnd: $timeEnd, weekDay: $weekDay, excludedGrades: $excludedGrades}';
  }


}
