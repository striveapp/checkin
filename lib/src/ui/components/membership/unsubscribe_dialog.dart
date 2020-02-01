import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

class UnsubscribeDialog {
  static const String aboutToPermanentlyDeleteSubscription = 'You are about to permanently cancel your subscription.';
  static const String cannotBeUndone = 'This operation cannot be undone';
  static const String keepSubscription = 'Keep Subscription';
  static const String unsubscribe = 'Unsubscribe';

  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<
            MembershipBloc>(context),
        child: AlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              children: <Widget>[
                Text(
                    aboutToPermanentlyDeleteSubscription.i18n,
                    textAlign:
                    TextAlign.center,
                    style:
                    Theme.of(context)
                        .textTheme
                        .body1),
                SizedBox(
                  height: 20,
                ),
                Text(
                  cannotBeUndone.i18n,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(
                      fontWeightDelta:
                      2),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Padding(
                padding:
                EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10),
                child: Text(
                  keepSubscription.i18n,
                  style: Theme.of(context)
                      .textTheme
                      .button,
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pop();
              },
            ),
            RaisedButton(
              color: Theme.of(context)
                  .buttonTheme
                  .colorScheme
                  .error,
              child: Padding(
                padding:
                EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10),
                child: Text(
                  unsubscribe.i18n,
                  style: Theme.of(context)
                      .textTheme
                      .button,
                ),
              ),
              onPressed: () {
                BlocProvider.of<
                    MembershipBloc>(
                    context)
                    .add(Unsubscribe());
                Navigator.of(context)
                    .pop();
              },
            ),
          ],
        ));
  }
}
