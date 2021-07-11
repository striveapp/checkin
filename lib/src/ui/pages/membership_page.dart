// @dart=2.9

import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/membership/membership_card.dart';
import 'package:checkin/src/ui/components/membership/payment_methods/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembershipPage extends StatelessWidget {
  static const String membership = 'Membership';
  static const String paymentMethods = 'Payment Methods';

  const MembershipPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.map(
          initialProfileState: (_) => EmptyWidget(),
          profileLoaded: (ProfileLoaded state) => MultiBlocProvider(
            providers: [
              BlocProvider<UserStatsBloc>(
                create: (BuildContext context) => UserStatsBloc(
                  statsRepository: context.read(),
                  userEmail: state.profileUser.email,
                  selectedGymId: state.profileUser.selectedGymId,
                  statsBloc: StatsBloc()..add(TimespanUpdate(timespan: Timespan.month)),
                ),
              ),
              BlocProvider<MembershipBloc>(
                create: (BuildContext context) => MembershipBloc(
                  analyticsRepository: context.read(),
                  membershipApi:
                      MembershipApi(httpClient: HttpClient(authRepository: context.read())),
                  membershipRepository: context.read(),
                  userEmail: state.profileUser.email,
                  selectedGymId: state.profileUser.selectedGymId,
                ),
              )
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(membership.i18n, style: Theme.of(context).textTheme.headline1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: MembershipCard(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(paymentMethods.i18n, style: Theme.of(context).textTheme.headline1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: PaymentMethodsCard(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
