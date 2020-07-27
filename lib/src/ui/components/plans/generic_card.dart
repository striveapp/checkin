import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/ui/components/plans/plan_card.dart';
import 'package:checkin/src/ui/components/subscriptions/subscription_plan_card.dart';
import 'package:flutter/material.dart';


class GenericCard extends StatelessWidget {
  final SubscriptionPlan _plan;

  const GenericCard({
    Key key,
    @required SubscriptionPlan plan,
  })
      : assert(plan != null),
        _plan = plan,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _plan.map(
      simpleSubscription: (SimpleSubscription simpleSubscription) =>
          // todo planWithPrices: fix integration
          SubscriptionPlanCard(plan: simpleSubscription,
            customerEmail: "",
            basePaymentUrl: "",
            customerId: "",
            gymId: "",),
      subscriptionWithPrices: (SubscriptionWithPrices subscriptionWithPrices) =>
          PlanCard(plan: subscriptionWithPrices),);
  }
}
