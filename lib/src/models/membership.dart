import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership.freezed.dart';

@freezed
abstract class Membership with _$Membership {
  static const String ACTIVE_MEMBERSHIP = "active";
  static const String INACTIVE_MEMBERSHIP = "inactive";


  factory Membership({
    @required final String status,
    final String customerId,
    final String name,
    final int currentPeriodEnd,
    final double totalLessonsOfPlan,
  }) = _Membership;
}
