import 'package:checkin/src/blocs/account/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/membership/membership_card.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

class AccountPage extends StatelessWidget {
  static const String account = 'Account';
  static const String membership = 'Membership';
  static const String profile = 'Profile';

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
            BlocProvider<AccountBloc>(
              create: (BuildContext context) => AccountBloc(
                userBloc: BlocProvider.of<UserBloc>(context),
              ),
            ),
            BlocProvider<MembershipBloc>(
              create: (BuildContext context) => MembershipBloc(
                membershipRepository: MembershipRepository(),
                userBloc: BlocProvider.of<UserBloc>(context),
              ),
            ),
          ],
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (BuildContext context, AccountState state) {
              if (state is AccountLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (state.user.hasActivePayments)
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  membership.i18n,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline
                                      .apply(color: Colors.black87),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: MembershipCard(),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            profile.i18n,
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .apply(color: Colors.black87),
                          ),
                        ),
                        ProfileCard(
                          user: state.user,
                        ),
                        if (isInDebugMode)
                          SizedBox(
                            height: 50,
                          ),
                        if (isInDebugMode)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                key: Key('logoutButton'),
                                color: Colors.red,
                                child: Text("Logout",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                                onPressed: () {
                                  Navigator.popUntil(
                                    context,
                                    ModalRoute.withName(Navigator.defaultRouteName),
                                  );
                                  BlocProvider.of<AuthBloc>(context).add(LogOut());
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }
              return ErrorWidget("unkown state for account_page");
            },
          ),
        ),
      ),
    );
  }
}
