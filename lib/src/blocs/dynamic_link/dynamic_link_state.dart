import 'package:equatable/equatable.dart';

abstract class DynamicLinkState extends Equatable {
  const DynamicLinkState();

  @override
  List<Object> get props => [];
}

class DynamicLinkInitial extends DynamicLinkState {
  @override
  String toString() => 'DynamicLinkInitial';
}

class DynamicLinkToNavigate extends DynamicLinkState {
  final String path;
  final DateTime nocache = DateTime.now();

  DynamicLinkToNavigate({this.path});

  @override
  List<Object> get props => [path, nocache];

  @override
  String toString() => 'DynamicLinkToNavigate';
}

class DynamicLinkSetDefaultGym extends DynamicLinkState {
  final String defaultGym;

  DynamicLinkSetDefaultGym({this.defaultGym});

  @override
  List<Object> get props => [defaultGym];

  @override
  String toString() => 'DynamicLinkSetDefaultGym';
}

class DynamicLinkError extends DynamicLinkState {
  @override
  String toString() => 'DynamicLinkError';
}

