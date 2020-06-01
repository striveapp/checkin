import 'package:checkin/src/models/membership.dart';
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

class MembershipActive extends MembershipState {
  final Membership membership;


  MembershipActive({this.membership});

  @override
  List<Object> get props => [membership];

  @override
  String toString() => 'MembershipActive';
}

class MembershipInactive extends MembershipState {
  final String email;

  MembershipInactive({this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'MembershipInactive';
}

class MembershipLoading extends MembershipState {
  @override
  String toString() => 'MembershipLoading';
}