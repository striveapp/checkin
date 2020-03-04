import 'package:equatable/equatable.dart';

abstract class VersionEvent extends Equatable {
  const VersionEvent();

  @override
  List<Object> get props => [];
}

class VersionUpdated extends VersionEvent {
  final String minimumVersionRequired;

  VersionUpdated({this.minimumVersionRequired});

  @override
  List<Object> get props => [minimumVersionRequired];

  String toString() => 'VersionUpdated';
}
