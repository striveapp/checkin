import 'package:checkin/src/models/membership.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'membership_event.freezed.dart';

@freezed
abstract class MembershipEvent with _$MembershipEvent {
  const factory MembershipEvent.membershipUpdated({
    @required String customerEmail,
    @required Membership membership,
  }) =  MembershipUpdated;

  const factory MembershipEvent.unsubscribe() = Unsubscribe;
}