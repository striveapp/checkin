import 'package:checkin/src/blocs/subscription/bloc.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PlanCard extends StatelessWidget {
  final SimpleSubscription plan;
  final String customerId;

  PlanCard({
    @required this.plan,
    @required this.customerId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Card(
          child: InkWell(
            onTap: () {
              BlocProvider.of<SubscriptionBloc>(context).add(Subscribe(
                priceId: plan.code,
                customerId: customerId,
              ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        plan.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .apply(fontSizeFactor: 1.2, color: Colors.black87),
                      ),
                      Text(
                        plan.description,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "€${_formatPrice(plan.price)}",
                        style: Theme.of(context).textTheme.headline1.apply(
                            fontSizeFactor: 1.7,
                            color: Theme.of(context).accentColor),
                      ),
                      Text(
                        "/${_getIntervalShort(plan.interval)}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  String _getIntervalShort(String interval) =>
      interval == "Monthly" ? "mo" : "yr";

  String _formatPrice(int price) {
    final f = NumberFormat("###.00");
    final s = f.format(price / 100);
    return s.endsWith('00') ? s.substring(0, s.length - 3) : s;
  }
}
