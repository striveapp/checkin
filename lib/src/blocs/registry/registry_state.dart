import 'package:checkin/src/models/lesson.dart';
import 'package:equatable/equatable.dart';

abstract class RegistryState extends Equatable {
  RegistryState([List props = const []]) : super(props);
}

class RegistryUninitialized extends RegistryState {
  @override
  String toString() => 'RegistryUninitialized';
}

class RegistryError extends RegistryState {
  @override
  String toString() => 'RegistryError';
}

class RegistryLoaded extends RegistryState {

  final Lesson lesson;

  RegistryLoaded({
    this.lesson,
  }) : super([lesson]);

  @override
  String toString() => 'RegistryLoaded';
}