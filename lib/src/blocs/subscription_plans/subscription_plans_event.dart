import 'package:checkin/src/models/subscription_plan.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'subscription_plans_event.freezed.dart';

@freezed
abstract class SubscriptionPlansEvent with _$SubscriptionPlansEvent {
  const factory SubscriptionPlansEvent.subscriptionPlansUpdated({
    @required List<SubscriptionPlan> subscriptionPlans,
  }) = SubscriptionPlansUpdated;

  const factory SubscriptionPlansEvent.loadSubscriptionPlans(
      {@required String planId}) = LoadSubscriptionPlans;
}
