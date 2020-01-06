import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembershipCard extends StatelessWidget {
  final User user;

  MembershipCard({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${Localization.of(context).email}:",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .apply(fontWeightDelta: 1),
                  ),
                  Text(
                    user.email,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${Localization.of(context).creditCard}:",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .apply(fontWeightDelta: 1),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.credit_card),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "•••• •••• •••• ${user.subscription.cardLastFourDigits}",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(Localization.of(context).nextBilling,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .apply(color: Colors.black87)),
                    Text("1st Gen 2020",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle.apply(
                            fontWeightDelta: 1,
                            color: Theme.of(context).accentColor)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            Localization.of(context).unsubscribe,
                            style: Theme.of(context).textTheme.button,
                          ),
                          color:
                              Theme.of(context).buttonTheme.colorScheme.error,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                  value:
                                      BlocProvider.of<MembershipBloc>(context),
                                  child: AlertDialog(
                                    content: SizedBox(
                                      height: 100,
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                              Localization.of(context).aboutToPermanentlyDeleteSubscription,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .body1),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            Localization.of(context).cannotBeUndone,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1
                                                .apply(fontWeightDelta: 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      RaisedButton(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: Text(
                                            Localization.of(context).keepSubscription,
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      RaisedButton(
                                        color: Theme.of(context)
                                            .buttonTheme
                                            .colorScheme
                                            .error,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: Text(
                                            Localization.of(context).unsubscribe,
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<MembershipBloc>(context).add(Unsubscribe());
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  )),
                            );
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            Localization.of(context).changePlan,
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("subscriptions/${user.email}");
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
