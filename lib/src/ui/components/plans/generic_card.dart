import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/ui/components/plans/plan_card.dart';
import 'package:checkin/src/ui/components/plans/plan_with_prices_card.dart';
import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  final SubscriptionPlan _plan;
  final String _customerId;

  const GenericCard({
    Key key,
    @required SubscriptionPlan plan,
    customerId,
  })  : assert(plan != null),
        _plan = plan,
        _customerId = customerId,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _plan.map(
      simpleSubscription: (SimpleSubscription simpleSubscription) => PlanCard(
        plan: simpleSubscription,
        customerId: _customerId,
      ),
      subscriptionWithPrices: (SubscriptionWithPrices subscriptionWithPrices) =>
          PlanWithPricesCard(customerId: _customerId, plan: subscriptionWithPrices),
    );
  }
}
