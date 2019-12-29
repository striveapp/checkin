import 'package:checkin/src/blocs/account/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/membership_card.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Subscriptions",
        showUserImage: false,
      ),
      body: BlocProvider<AccountBloc>(
        create: (BuildContext context) => AccountBloc(
          userBloc: BlocProvider.of<UserBloc>(context),
        ),
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (BuildContext context, AccountState state) {
            if (state is AccountLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Choose a subcription plan and start training hard",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                        ),
                      ),
                      SizedBox(height: 50,),
                      Column(
                        children: <Widget>[
                          Container(
                              height: 150,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Year Plan",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline
                                                .apply(fontSizeFactor: 1.2, color: Colors.black87),
                                          ),
                                          Text(
                                            "All classes all days (1 year)",
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "€800",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline
                                                .apply(
                                                    fontSizeFactor: 1.7,
                                                    color: Theme.of(context)
                                                        .accentColor),
                                          ),
                                          Text(
                                            "/yr",
                                            style: Theme.of(context)
                                                .textTheme
                                                .display1
                                                .apply(color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(height: 25,),
                          Container(
                              height: 150,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Full Plan",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline
                                                  .apply(fontSizeFactor: 1.3, color: Colors.black87),
                                            ),
                                            Text(
                                              "All classes all days",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .body2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "€75",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline
                                                .apply(
                                                    fontSizeFactor: 1.7,
                                                    color: Theme.of(context)
                                                        .accentColor),
                                          ),
                                          Text(
                                            "/mo",
                                            style: Theme.of(context)
                                                .textTheme
                                                .display1
                                                .apply(color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(height: 25,),
                          Container(
                              height: 150,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Starter Plan",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline
                                                  .apply(fontSizeFactor: 1.3, color: Colors.black87),
                                            ),
                                            Text(
                                              "Maximim 2 class per week",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .body2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "€65",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline
                                                .apply(
                                                fontSizeFactor: 1.7,
                                                color: Theme.of(context)
                                                    .accentColor),
                                          ),
                                          Text(
                                            "/mo",
                                            style: Theme.of(context)
                                                .textTheme
                                                .display1
                                                .apply(color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return ErrorWidget("unkown state for account_page");
          },
        ),
      ),
    );
  }
}
