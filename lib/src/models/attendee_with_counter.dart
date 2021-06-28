import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendee_with_counter.freezed.dart';

@freezed
abstract class AttendeeWithCounter
    implements _$AttendeeWithCounter, Comparable<AttendeeWithCounter> {
  const AttendeeWithCounter._();
  factory AttendeeWithCounter({
    required final String email,
    required final int counter,
  }) = _AttendeeWithCounter;

  @override
  int compareTo(AttendeeWithCounter other) {
    return this.counter.compareTo(other.counter);
  }
}
