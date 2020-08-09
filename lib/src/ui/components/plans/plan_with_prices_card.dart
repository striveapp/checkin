import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/ui/components/plans/price.dart';
import 'package:flutter/material.dart';

class PlanWithPricesCard extends StatelessWidget {
  final SubscriptionWithPrices _plan;
  final String _customerId;

  const PlanWithPricesCard({
    Key key,
    @required SubscriptionPlan plan,
    String customerId,
  })  : assert(plan != null),
        _plan = plan,
        _customerId = customerId,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 100,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
                "subPlan/${_customerId}/${_plan.id}/${_plan.name}/${_plan.description}");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _plan.name,
                        style: Theme.of(context).textTheme.headline1.apply(
                              fontSizeFactor: 1.2,
                            ),
                      ),
                      Text(
                        _plan.description.i18n,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                Price(
                  price: _plan.startingPrice,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
