import 'package:checkin/src/models/subscription_plan.dart';
import 'package:equatable/equatable.dart';

abstract class SubscriptionPlansEvent extends Equatable {
  const SubscriptionPlansEvent();

  @override
  List<Object> get props => [];
}

class SubscriptionPlansUpdated extends SubscriptionPlansEvent {
  final List<SubscriptionPlan> subscriptionPlans;
  final String basePaymentUrl;

  SubscriptionPlansUpdated({
    this.subscriptionPlans,
    this.basePaymentUrl,
  });

  @override
  List<Object> get props => [subscriptionPlans, basePaymentUrl];

  @override
  String toString() => 'SubscriptionPlansUpdated';
}
