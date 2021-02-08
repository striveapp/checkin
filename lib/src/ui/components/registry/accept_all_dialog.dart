import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcceptAllDialog extends StatelessWidget {
  final String selectedGymId;

  const AcceptAllDialog({Key key, @required this.selectedGymId}) : super(key: key);

  static const String acceptingAllTheStudentsDisclaimer =
      'You are going to confirm all the students in class';
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      content: Text(acceptingAllTheStudentsDisclaimer.i18n,
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline3),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      actions: <Widget>[
        ElevatedButton(
          key: Key("confirmButton"),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              confirm.i18n,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          onPressed: () {
            BlocProvider.of<RegistryBloc>(context).add(AcceptAttendees(
              gymId: selectedGymId,
            ));
            Navigator.of(context).pop();
          },
        ),
        CancelButton(
          text: cancel.i18n,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
