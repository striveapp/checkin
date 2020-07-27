import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'subscription_plan.freezed.dart';

@freezed
abstract class SubscriptionPlan with _$SubscriptionPlan {
  const factory SubscriptionPlan.simpleSubscription(
      { @required String name,
        @required String code,
        @required String interval,
        @required String currency,
        @required int price,
        String description }) = SimpleSubscription;

  const factory SubscriptionPlan.subscriptionWithPrices(
      { @required String id,
        @required String name,
        @required String currency,
        @required int startingPrice,
        String description }) = SubscriptionWithPrices;


}