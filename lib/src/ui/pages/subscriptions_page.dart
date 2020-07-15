import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/subscription/bloc.dart';
import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:checkin/src/resources/gym_provider.dart';
import 'package:checkin/src/resources/subscription_plans_provider.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/subscriptions/subscription_plan_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionsPage extends StatelessWidget {
  final String customerEmail;
  final String customerId;

  static const String subscriptions = 'Subscriptions';

  SubscriptionsPage({
    Key key,
    @required this.customerEmail,
    this.customerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: subscriptions.i18n,
        showUserImage: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<GymBloc>(
            create: (BuildContext context) => GymBloc(
                userBloc: BlocProvider.of<UserBloc>(context),
                gymRepository: GymProvider()),
          ),
          BlocProvider<SubscriptionBloc>(
            create: (BuildContext context) => SubscriptionBloc(
              membershipApi: MembershipApi(
                  httpClient: HttpClient(authRepository: AuthProvider())),
              analyticsRepository: RepositoryProvider.of<AnalyticsRepository>(context)
            ),
          ),
          BlocProvider<SubscriptionPlansBloc>(
            create: (BuildContext context) => SubscriptionPlansBloc(
              gymBloc: BlocProvider.of<GymBloc>(context),
              subscriptionPlansRepository: SubscriptionPlansProvider(),
            ),
          ),
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SubscriptionPlanCards(
                  customerEmail: customerEmail,
                  customerId: customerId,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
