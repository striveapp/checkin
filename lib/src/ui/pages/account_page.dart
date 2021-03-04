import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/api/payment_api.dart';
import 'package:checkin/src/blocs/account/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/blocs/payment_methods/payment_methods_bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/payment_method_provider.dart';
import 'package:checkin/src/ui/components/account/payment.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:checkin/src/util/url_launcher_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  static const String account = 'Account';
  static const String profile = 'Profile';

  final String errorMessage;

  AccountPage({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: BaseAppBar(
          title: account.i18n,
          showUserImage: false,
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileBloc>(
              create: (BuildContext context) => ProfileBloc(
                userRepository: context.read<UserRepository>(),
                storageRepository: context.read(),
                imageRepository: context.read(),
              )..add(InitializeProfile()),
            ),
            BlocProvider<AccountBloc>(
              create: (BuildContext context) => AccountBloc(
                analyticsRepository: context.read<AnalyticsRepository>(),
                userRepository: context.read<UserRepository>(),
              ),
            ),
            BlocProvider<GymBloc>(
              create: (BuildContext context) => GymBloc(
                gymRepository: context.read<GymRepository>(),
              )..add(InitializeGym()),
            ),
            BlocProvider<PaymentMethodsBloc>(
              create: (BuildContext context) => PaymentMethodsBloc(
                urlLauncherUtil: UrlLauncherUtil(),
                paymentMethodRepository: PaymentMethodProvider(),
                userRepository: context.read<UserRepository>(),
                paymentApi: PaymentApi(
                  httpClient: HttpClient(
                    authRepository: context.read<AuthRepository>(),
                  ),
                ),
              ),
            ),
          ],
          child: BlocListener<AccountBloc, AccountState>(
            listener: (BuildContext context, AccountState state) {
              if (state is AccountError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      backgroundColor: Theme.of(context).accentColor.withAlpha(150),
                      duration: Duration(seconds: 5),
                    ),
                  );
              }
            },
            child: BlocBuilder<AccountBloc, AccountState>(
              buildWhen: (AccountState previous, AccountState current) =>
                  !(current is AccountError),
              builder: (BuildContext context, AccountState state) {
                if (errorMessage != null) {
                  BlocProvider.of<AccountBloc>(context)
                      .add(AccountDisplayError(errorMessage: errorMessage));
                }

                if (state is AccountInitial) {
                  return LoadingIndicator();
                }

                if (state is AccountLoaded) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<UserStatsBloc>(
                        create: (BuildContext context) => UserStatsBloc(
                          statsRepository: RepositoryProvider.of<StatsRepository>(context),
                          userEmail: state.user.email,
                          selectedGymId: state.user.selectedGymId,
                          statsBloc: StatsBloc()..add(TimespanUpdate(timespan: Timespan.week)),
                        ),
                      ),
                      BlocProvider<MembershipBloc>(
                        create: (BuildContext context) => MembershipBloc(
                            analyticsRepository: context.read<AnalyticsRepository>(),
                            membershipApi: MembershipApi(
                                httpClient:
                                    HttpClient(authRepository: context.read<AuthRepository>())),
                            membershipRepository:
                                RepositoryProvider.of<MembershipRepository>(context),
                            userEmail: state.user.email,
                            selectedGymId: state.user.selectedGymId),
                      )
                    ],
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Payment(userHasActivePayments: state.user.hasActivePayments),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child:
                                  Text(profile.i18n, style: Theme.of(context).textTheme.headline1),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: ProfileCard(
                                  userEmail: state.user.email, isOwner: state.user.isOwner),
                            ),
                            if (state.user.selectedGymId == "test")
                              SizedBox(
                                height: 50,
                              ),
                            if (state.user.selectedGymId == "test")
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: CancelButton(
                                      key: Key('logoutButton'),
                                      text: "Logout",
                                      onPressed: () {
                                        Navigator.popUntil(
                                          context,
                                          ModalRoute.withName(Navigator.defaultRouteName),
                                        );
                                        BlocProvider.of<AuthBloc>(context).add(LogOut());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return ErrorWidget("unkown state for account_page");
              },
            ),
          ),
        ),
      ),
    );
  }
}
