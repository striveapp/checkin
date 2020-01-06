import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/subscription_plan_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionsPage extends StatelessWidget {
  final String customerEmail;

  SubscriptionsPage({
    Key key,
    @required this.customerEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Localization.of(context).subscriptions,
        showUserImage: false,
      ),
      body: BlocProvider<SubscriptionPlansBloc>(
        create: (BuildContext context) =>
            SubscriptionPlansBloc(
                subscriptionPlansRepository: SubscriptionPlansRepository()),
        child: BlocBuilder<SubscriptionPlansBloc, SubscriptionPlansState>(
          builder: (BuildContext context, SubscriptionPlansState state) {
            if (state is SubscriptionPlansLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                            Localization.of(context).chooseSubAndStartTraining,
                            textAlign: TextAlign.center,
                            style: Theme
                                .of(context)
                                .textTheme
                                .subtitle),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                          children: state.subscriptionPlans
                              .map((plan) =>
                              Column(
                                children: <Widget>[
                                  SubscriptionPlanCard(
                                    plan: plan,
                                    customerEmail: customerEmail,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ))
                              .toList()),
                    ],
                  ),
                ),
              );
            }

            if (state is SubscriptionPlansInitial) {
              return LoadingIndicator();
            }
            return ErrorWidget("unkown state for subscriptions_page");
          },
        ),
      ),
    );
  }
}
