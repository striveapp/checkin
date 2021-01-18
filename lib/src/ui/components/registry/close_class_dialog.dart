import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CloseClassDialog extends StatelessWidget {
  final String selectedGymId;

  const CloseClassDialog({Key key, @required this.selectedGymId}) : super(key: key);

  static const String closingClassDisclaimer = 'Are you sure you want to close this class?';
  static const String goBack = 'Go back';
  static const String closeClass = 'Close class';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      content: Text(closingClassDisclaimer.i18n,
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline3),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      actions: <Widget>[
        RaisedButton(
          key: Key("confirmButton"),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              closeClass.i18n,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          color: Theme.of(context).buttonTheme.colorScheme.error,
          onPressed: () {
            BlocProvider.of<RegistryBloc>(context).add(CloseLesson(
              gymId: selectedGymId,
            ));
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              goBack.i18n,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
