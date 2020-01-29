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

class DynamicLinkToRegistry extends DynamicLinkState {
  final String lessonId;

  const DynamicLinkToRegistry({
    this.lessonId,
  });

  @override
  List<Object> get props => [lessonId];

  @override
  String toString() => 'DynamicLinkToRegistry';
}

class DynamicLinkToNavigate extends DynamicLinkState {
  final String path;

  DynamicLinkToNavigate({this.path});

  @override
  List<Object> get props => [path];

  @override
  String toString() {
    return 'DynamicLinkToNavigate';
  }
}

class DynamicLinkError extends DynamicLinkState {
  @override
  String toString() => 'DynamicLinkError';
}

