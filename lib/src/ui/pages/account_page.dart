import 'package:checkin/src/blocs/account/bloc.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/membership_card.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
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
          title: "Account",
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
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Membership",
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .apply(color: Colors.black87),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: MembershipCard(user: state.user,),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Profile",
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .apply(color: Colors.black87),
                          ),
                        ),
                        ProfileCard(user: state.user,),
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
