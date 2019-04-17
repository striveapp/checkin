import 'package:equatable/equatable.dart';

class Class extends Equatable {
  final List<String> attendees;

  Class(
      this.attendees,
      ) : super([attendees]);

  @override
  String toString() {
    return 'Class{number: $attendees}';
  }
}
