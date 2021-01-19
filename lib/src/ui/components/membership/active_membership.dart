import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/ui/components/membership/remaining_lessons_indicator.dart';
import 'package:checkin/src/ui/components/membership/unsubscribe_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActiveMembershipView extends StatelessWidget {
  final Membership membership;
  static const String nextBilling = 'The next billing date is ';
  static const String unsubscribe = 'Unsubscribe';
  static const String yourSubscription = 'Your subscription';
  static const String remainingSessions = 'Remaining sessions';

  const ActiveMembershipView({Key key, this.membership}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                yourSubscription.i18n,
                style: Theme.of(context).textTheme.headline3.apply(fontWeightDelta: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  membership.name,
                  style: Theme.of(context).textTheme.headline3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                remainingSessions.i18n,
                style: Theme.of(context).textTheme.headline3.apply(fontWeightDelta: 1),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: RemainingLessonsIndicator(
                    totalLessonsOfPlan: membership.totalLessonsOfPlan,
                  )),
              SizedBox(
                height: 15,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: nextBilling.i18n, style: Theme.of(context).textTheme.headline3),
                      TextSpan(
                          text: DateFormat('dd MMM y').format(DateTime.fromMillisecondsSinceEpoch(
                              membership.currentPeriodEnd * 1000)),
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .apply(fontWeightDelta: 1, color: Theme.of(context).accentColor)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: RaisedButton(
                  child: Text(
                    unsubscribe.i18n,
                    style: Theme.of(context).textTheme.button,
                  ),
                  color: Theme.of(context).buttonTheme.colorScheme.error,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => UnsubscribeDialog().build(context),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
