import 'package:equatable/equatable.dart';

abstract class MembershipEvent extends Equatable {
  const MembershipEvent();

  @override
  List<Object> get props => [];
}

class MembershipUpdated extends MembershipEvent {

  @override
  String toString() => 'MembershipLoaded';
}

class Unsubscribe extends MembershipEvent {

  @override
  String toString() => 'Unsubscribe';
}