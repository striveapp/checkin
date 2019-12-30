import 'package:checkin/src/models/subscription_plan.dart';
import 'package:equatable/equatable.dart';

abstract class SubscriptionPlansState extends Equatable {
  const SubscriptionPlansState();

  @override
  List<Object> get props => [];
}

class SubscriptionPlansInitial extends SubscriptionPlansState {
  @override
  String toString() => 'SubscriptionPlansInitial';
}

class SubscriptionPlansLoaded extends SubscriptionPlansState {
  final List<SubscriptionPlan> subscriptionPlans;

  SubscriptionPlansLoaded({this.subscriptionPlans});

  @override
  List<Object> get props => [subscriptionPlans];

  @override
  String toString() => 'SubscriptionPlansLoaded';
}

class SubscriptionPlansEmpty extends SubscriptionPlansState {

  @override
  String toString() => 'SubscriptionPlansEmpty';
}