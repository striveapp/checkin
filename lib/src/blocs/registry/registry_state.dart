import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class RegistryState extends Equatable {
  const RegistryState();

  @override
  List<Object> get props => [];
}

class RegistryUninitialized extends RegistryState {
  @override
  String toString() => 'RegistryUninitialized';
}

class RegistryLoading extends RegistryState {
  @override
  String toString() => 'RegistryLoading';
}

class RegistryError extends RegistryState {
  @override
  String toString() => 'RegistryError';
}

class RegistryLoaded extends RegistryState {
  final Lesson currentLesson;
  final User currentUser;

  const RegistryLoaded({
    this.currentLesson,
    this.currentUser,
  });

  @override
  List<Object> get props => [currentLesson, currentUser];

  @override
  String toString() => 'RegistryLoaded';
}
