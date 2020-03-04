import 'package:equatable/equatable.dart';

abstract class VersionState extends Equatable {
  const VersionState();

  @override
  List<Object> get props => [];
}

class VersionInitial extends VersionState {
  @override
  String toString() => 'VersionInitial';
}

class UpdateRequired extends VersionState {
  @override
  String toString() => 'UpdateRequired';
}