import 'package:checkin/src/models/membership.dart';
import 'package:equatable/equatable.dart';

abstract class MembershipEvent extends Equatable {
  const MembershipEvent();

  @override
  List<Object> get props => [];
}

class MembershipUpdated extends MembershipEvent {
  final Membership membership;
  final String email;

  MembershipUpdated({this.email, this.membership});

  @override
  List<Object> get props => [email, membership];

  @override
  String toString() => 'MembershipLoaded';
}

class Unsubscribe extends MembershipEvent {

  @override
  String toString() => 'Unsubscribe';
}