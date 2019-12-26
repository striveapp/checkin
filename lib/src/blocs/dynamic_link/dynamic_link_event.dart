import 'package:equatable/equatable.dart';

abstract class DynamicLinkEvent extends Equatable {
  const DynamicLinkEvent();

  @override
  List<Object> get props => [];
}

class DeepLinkSetup extends DynamicLinkEvent {

  @override
  String toString() => 'DeepLinkSetup';
}

class DeepLinkErrorEvent extends DynamicLinkEvent {

  @override
  String toString() => 'DeepLinkErrorEvent';
}

class DeepLinkReceived extends DynamicLinkEvent {
  final Uri deepLink;

  const DeepLinkReceived({
    this.deepLink,
  });

  @override
  List<Object> get props => [deepLink];

  @override
  String toString() => 'DeepLinkReceived';
}

