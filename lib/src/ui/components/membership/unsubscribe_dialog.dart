import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnsubscribeDialog {
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
                    Localization.of(
                        context)
                        .aboutToPermanentlyDeleteSubscription,
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
                  Localization.of(context)
                      .cannotBeUndone,
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
                  Localization.of(context)
                      .keepSubscription,
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
                  Localization.of(context)
                      .unsubscribe,
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
