import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';

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
                    "Billing email:",
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
                    "Card:",
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
                    Text("The next billing date is",
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
                            "Unsubscribe",
                            style: Theme.of(context).textTheme.button,
                          ),
                          color:
                              Theme.of(context).buttonTheme.colorScheme.error,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 100,
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                            "You are about to permanently cancel your subscription.",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1),
                                        SizedBox(height: 20,),
                                        Text(
                                          "This operation cannot be undone",
                                          style:
                                              Theme.of(context).textTheme.body1.apply(fontWeightDelta: 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    RaisedButton(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                        child: Text(
                                          "Keep Subscription",
                                          style:
                                          Theme.of(context).textTheme.button,
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
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                        child: Text(
                                          "Unsubscribe",
                                          style:
                                          Theme.of(context).textTheme.button,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            "Change Plan",
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed("subscriptions");
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
