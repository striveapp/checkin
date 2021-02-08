import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterDialog extends StatelessWidget {
  final User currentUser;

  const RegisterDialog({Key key, @required this.currentUser}) : super(key: key);

  static const String userFinishedAvailableSessions =
      'You used all available sessions for your plan.';
  static const String cancel = 'Cancel';
  static const String continueAnyway = 'Register anyway';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      content: Text(userFinishedAvailableSessions.i18n,
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline3),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      actions: <Widget>[
        ElevatedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              continueAnyway.i18n,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          onPressed: () {
            BlocProvider.of<RegistryBloc>(context).add(Register(
              gymId: currentUser.selectedGymId,
              attendee: Attendee.fromUser(currentUser),
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
