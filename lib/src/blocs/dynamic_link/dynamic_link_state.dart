import 'package:equatable/equatable.dart';

// todo cannot migrate to freezed, DateTime.now() default value is not supported
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
  final String errorMessage;

  DynamicLinkError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'DynamicLinkError';
}

class DynamicLinkToShare extends DynamicLinkState {
  final String link;

  DynamicLinkToShare({this.link});

  @override
  List<Object> get props => [link];

  @override
  String toString() => 'ShareLink';
}

class DynamicLinkAuthenticated extends DynamicLinkState {

  const DynamicLinkAuthenticated();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DynamicLinkAuthenticated';
}