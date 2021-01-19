import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/subscription/bloc.dart';
import 'package:checkin/src/blocs/subscription_plans/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/resources/subscription_plans_provider.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/plans/plans_callout.dart';
import 'package:checkin/src/ui/components/plans/plans_footer.dart';
import 'package:checkin/src/ui/components/plans/plans_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansPage extends StatelessWidget {
  final String customerId;

  static const String subscriptions = 'Subscriptions';

  PlansPage({
    Key key,
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
              gymRepository: context.read<GymRepository>(),
            )..add(InitializeGym()),
          ),
          BlocProvider<SubscriptionBloc>(
            create: (BuildContext context) => SubscriptionBloc(
                gymBloc: context.read<GymBloc>(),
                membershipApi: MembershipApi(
                    httpClient: HttpClient(authRepository: context.read<AuthRepository>())),
                analyticsRepository: RepositoryProvider.of<AnalyticsRepository>(context)),
          ),
          BlocProvider<SubscriptionPlansBloc>(
            create: (BuildContext context) => SubscriptionPlansBloc(
              gymBloc: BlocProvider.of<GymBloc>(context),
              subscriptionPlansRepository: SubscriptionPlansProvider(),
            ),
          ),
        ],
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PlansCallout(),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(child: PlansList(customerId: customerId)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: PlansFooter(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
