// @dart=2.9

import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnsubscribeDialog {
  static const String aboutToPermanentlyDeleteSubscription =
      'You are about to permanently cancel your subscription.';
  static const String cannotBeUndone = 'This operation cannot be undone';
  static const String keepSubscription = 'Keep Subscription';
  static const String unsubscribe = 'Unsubscribe';

  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<MembershipBloc>(context),
        child: AlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              children: <Widget>[
                Text(aboutToPermanentlyDeleteSubscription.i18n,
                    textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 20,
                ),
                Text(
                  cannotBeUndone.i18n,
                  style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 2),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  keepSubscription.i18n,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CancelButton(
              text: unsubscribe.i18n,
              onPressed: () {
                BlocProvider.of<MembershipBloc>(context).add(Unsubscribe());
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
