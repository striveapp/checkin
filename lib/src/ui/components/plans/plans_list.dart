import 'package:checkin/src/blocs/subscription/bloc.dart';
import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/plans/generic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansList extends StatelessWidget {
  static const String noPlansYet = 'There are not available plans yet';

  final String customerId;

  const PlansList({Key key, this.customerId}) : super(key: key);

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
              content: Text(
                state.errorMessage.i18n,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              backgroundColor: Theme.of(context).accentColor.withAlpha(150),
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
    }, child: BlocBuilder<SubscriptionPlansBloc, SubscriptionPlansState>(
      builder: (BuildContext context, SubscriptionPlansState state) {
        return state.when(
            subscriptionPlansInitial: () => LoadingIndicator(),
            subscriptionPlansLoading: () => LoadingIndicator(),
            subscriptionPlansLoaded: (List<SubscriptionPlan>
                    subscriptionPlans) =>
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    children: [
                      ...subscriptionPlans
                          .map(
                            (plan) =>
                                GenericCard(plan: plan, customerId: customerId),
                          )
                          .toList(),
                    ],
                  ),
                ),
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
    ));
  }
}
