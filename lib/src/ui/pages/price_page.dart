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
import 'package:checkin/src/ui/components/plans/plans_list.dart';
import 'package:checkin/src/ui/components/plans/price/price_footer.dart';
import 'package:checkin/src/ui/components/plans/price/price_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PricePage extends StatelessWidget {
  static const String prices = 'Prices';

  final String customerId;
  final String planId;

  PricePage({
    Key key,
    @required this.planId,
    this.customerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: prices.i18n,
        showUserImage: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<GymBloc>(
            create: (BuildContext context) =>
                GymBloc(
                    userBloc: BlocProvider.of<UserBloc>(context),
                    gymRepository: GymProvider()),
          ),
          BlocProvider<SubscriptionBloc>(
            create: (BuildContext context) =>
                SubscriptionBloc(
                    gymBloc: BlocProvider.of<GymBloc>(context),
                    membershipApi: MembershipApi(
                        httpClient: HttpClient(authRepository: AuthProvider())),
                    analyticsRepository:
                    RepositoryProvider.of<AnalyticsRepository>(context)),
          ),
          BlocProvider<SubscriptionPlansBloc>(
            create: (BuildContext context) =>
                SubscriptionPlansBloc(
                  planId: planId,
                  gymBloc: BlocProvider.of<GymBloc>(context),
                  subscriptionPlansRepository: SubscriptionPlansProvider(),
                ),
          ),
        ],
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            PriceHeader(),
            SizedBox(height: 15,),
            Expanded(child: PlansList(customerId: customerId,)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: PriceFooter(),
            )
          ],
        ),
      ),
    );
  }
}
