// @dart=2.9

import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:flutter/material.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      content: SizedBox(
        height: 300,
        child: Column(
          children: <Widget>[
            Text("Hey Tobuto welcome to Strive".i18n,
                textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4),
            SizedBox(
              height: 20,
            ),
            Text(
              "This is our demo experience for you to play around!".i18n,
              style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 2),
            ),
            Column(
              children: [
                ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Create your gym".i18n,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CancelButton(
                  key: Key("confirmButton"),
                  text: "Later, i'm just taking a look".i18n,
                  onPressed: () {
                    Logger.log.i("imacat");
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Note: if your gym uses Strive ask you gym owner to send you the referral link".i18n,
              style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 2),
            ),
          ],
        ),
      ),
    );
  }
}
