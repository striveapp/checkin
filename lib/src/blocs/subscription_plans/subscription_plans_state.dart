import 'package:checkin/src/models/subscription_plan.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'subscription_plans_state.freezed.dart';

@freezed
abstract class SubscriptionPlansState with _$SubscriptionPlansState {
  const factory SubscriptionPlansState.subscriptionPlansInitial() =
      SubscriptionPlansInitial;

  const factory SubscriptionPlansState.subscriptionPlansLoading() =
      SubscriptionPlansLoading;

  const factory SubscriptionPlansState.subscriptionPlansLoaded({
    @required List<SubscriptionPlan> subscriptionPlans,
  }) = SubscriptionPlansLoaded;

  const factory SubscriptionPlansState.subscriptionPlansEmpty() =
      SubscriptionPlansEmpty;
}
