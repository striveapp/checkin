import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class RegistryMissingDialog extends StatelessWidget {

  static const String thisClassHasBeenCancelled = 'This class has been cancelled';
  static const String goToClasses = 'Go to classes';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      content: Text(thisClassHasBeenCancelled.i18n,
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline3),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      actions: <Widget>[
        RaisedButton(
          key: Key("goBack"),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              goToClasses.i18n,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName(Navigator.defaultRouteName));
          },
        ),
      ],
    );
  }
}
