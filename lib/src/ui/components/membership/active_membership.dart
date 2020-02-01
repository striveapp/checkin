import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/ui/components/membership/unsubscribe_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:checkin/src/localization/localization.dart';

class ActiveMembershipView extends StatelessWidget {
  final Membership membership;
  static const String email = 'Email:';
  static const String creditCard = 'Card:';
  static const String nextBilling = 'The next billing date is:';
  static const String unsubscribe = 'Unsubscribe';

  const ActiveMembershipView({Key key, this.membership}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                email.i18n,
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .apply(fontWeightDelta: 1),
              ),
              Text(
                membership.email,
                style: Theme.of(context).textTheme.subtitle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                creditCard.i18n,
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
                    "•••• •••• •••• ${membership.cardLastFourDigits}",
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
                Text(nextBilling.i18n,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .apply(color: Colors.black87)),
                Text(
                    DateFormat('dd MMM y').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            membership.currentPeriodEnd *
                                1000)),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .apply(
                        fontWeightDelta: 1,
                        color:
                        Theme.of(context).accentColor)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        unsubscribe.i18n,
                        style:
                        Theme.of(context).textTheme.button,
                      ),
                      color: Theme.of(context)
                          .buttonTheme
                          .colorScheme
                          .error,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => UnsubscribeDialog().build(context),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}