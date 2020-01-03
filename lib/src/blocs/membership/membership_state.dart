import 'package:equatable/equatable.dart';

abstract class MembershipState extends Equatable {
  const MembershipState();

  @override
  List<Object> get props => [];
}

class MembershipInitial extends MembershipState {
  @override
  String toString() => 'MembershipInitial';
}

class MembershipLoaded extends MembershipState {
  @override
  String toString() => 'MembershipLoaded';
}

class MembershipLoading extends MembershipState {
  @override
  String toString() => 'MembershipLoading';
}