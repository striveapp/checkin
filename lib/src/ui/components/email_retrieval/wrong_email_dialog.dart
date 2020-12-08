import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class WrongEmailDialog extends StatelessWidget {
  static const String theEmailYouInsertedMightNotBeCorrect =
      'The email you inserted might not be correct';
  static const String goBack = 'Go back';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      content: Text(theEmailYouInsertedMightNotBeCorrect.i18n,
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline3),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      actions: <Widget>[
        RaisedButton(
          key: Key("goBack"),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              goBack.i18n,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.settings.name == "email-retrieve/");
          },
        ),
      ],
    );
  }
}
