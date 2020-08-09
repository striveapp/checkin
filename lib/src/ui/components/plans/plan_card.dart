import 'package:checkin/src/blocs/subscription/bloc.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/ui/components/plans/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          plan.name,
                          style: Theme.of(context).textTheme.headline1.apply(
                                fontSizeFactor: 1.2,
                              ),
                        ),
                        Text(
                          plan.description,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Price(
                    price: plan.price,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
