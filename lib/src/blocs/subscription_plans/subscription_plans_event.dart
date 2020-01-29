import 'package:checkin/src/models/subscription_plan.dart';
import 'package:equatable/equatable.dart';

abstract class SubscriptionPlansEvent extends Equatable {
  const SubscriptionPlansEvent();

  @override
  List<Object> get props => [];
}

class SubscriptionPlansUpdated extends SubscriptionPlansEvent {
  final List<SubscriptionPlan> subscriptionPlans;

  SubscriptionPlansUpdated({this.subscriptionPlans});

  @override
  List<Object> get props => [subscriptionPlans];

  @override
  String toString() => 'SubscriptionPlansUpdated';
}