import 'package:checkin/src/blocs/subscription/bloc.dart';
import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/subscriptions/subscription_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionPlanCards extends StatelessWidget {
  static const String chooseSub = 'Choose a subscription plan';
  static const String noPlansYet = 'No available subscription plans yet';

  final String customerEmail;
  final String customerId;

  const SubscriptionPlanCards({Key key, this.customerEmail, this.customerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscriptionBloc, SubscriptionState>(
      listener: (BuildContext context, SubscriptionState state) {
        if (state is SubscriptionError) {
          Navigator.of(context).pop();
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage.i18n),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 5),
              ),
            );
        }

        if (state is SubscriptionLoading) {
          showDialog(context: context, child: LoadingIndicator());
        }

        if (state is SubscriptionSuccess) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed("payment/success");
        }
      },
      child: BlocBuilder<SubscriptionPlansBloc, SubscriptionPlansState>(
        builder: (BuildContext context, SubscriptionPlansState state) {
          return state.when(
              subscriptionPlansInitial: () => LoadingIndicator(),
              subscriptionPlansLoaded:
                  (List<SubscriptionPlan> subscriptionPlans,
                          String basePaymentUrl, String gymId) =>
                      Column(children: [
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Text(chooseSub.i18n,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ...subscriptionPlans
                            .map((plan) => Column(
                                  children: <Widget>[
                                    SubscriptionPlanCard(
                                      basePaymentUrl: basePaymentUrl,
                                      plan: plan,
                                      customerId: customerId,
                                      customerEmail: customerEmail,
                                      gymId: gymId,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ))
                            .toList()
                      ]),
              subscriptionPlansEmpty: () => Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Text(noPlansYet.i18n,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ));
        },
      ),
    );
  }
}
