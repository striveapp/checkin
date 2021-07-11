// @dart=2.9

import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/api/payment_api.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/payment_methods/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/pages/membership_page.dart';
import 'package:checkin/src/ui/pages/profile_page.dart';
import 'package:checkin/src/util/url_launcher_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  static const String account = 'Account';

  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => ProfileBloc(
            userRepository: context.read(),
            storageRepository: context.read(),
            imageRepository: context.read(),
          )..add(InitializeProfile()),
        ),
        BlocProvider<GymBloc>(
          create: (BuildContext context) => GymBloc(
            gymRepository: context.read(),
          )..add(InitializeGym()),
        ),
        BlocProvider<PaymentMethodsBloc>(
          create: (BuildContext context) => PaymentMethodsBloc(
            urlLauncherUtil: UrlLauncherUtil(),
            paymentMethodRepository: context.read(),
            userRepository: context.read(),
            paymentApi: PaymentApi(
              httpClient: HttpClient(
                authRepository: context.read(),
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: BaseAppBar(
          title: AccountPage.account.i18n,
          showUserImage: false,
        ),
        body: PageView(
          controller: _pageController,
          children: [
            ProfilePage(pageController: _pageController),
            MembershipPage(),
          ],
        ),
      ),
    );
  }
}
