import 'package:checkin/src/models/membership.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'membership_state.freezed.dart';

@freezed
abstract class MembershipState with _$MembershipState {
  const factory MembershipState.initialMembershipState() = InitialMembershipState;
  const factory MembershipState.membershipActive({@required Membership membership}) = MembershipActive;
  const factory MembershipState.membershipInactive({@required String customerEmail, @required String customerId}) = MembershipInactive;
  const factory MembershipState.membershipLoading() = MembershipLoading;
  const factory MembershipState.membershipError({@required String errorMessage}) = MembershipError;
}