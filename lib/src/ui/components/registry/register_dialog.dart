import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

class RegisterDialog extends StatelessWidget {
  final User currentUser;

  const RegisterDialog({Key key, @required this.currentUser}) : super(key: key);

  static const String userFinishedAvailableSessions = 'You used all available sessions for your plan.';
  static const String cancel = 'Cancel';
  static const String continueAnyway = 'Register anyway';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 80,
        child: Text(
            userFinishedAvailableSessions.i18n,
            textAlign:
            TextAlign.center,
            style:
            Theme.of(context)
                .textTheme
                .headline4),
      ),
      actions: <Widget>[
        RaisedButton(
          child: Padding(
            padding:
            EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10),
            child: Text(
              continueAnyway.i18n,
              style: Theme.of(context)
                  .textTheme
                  .button,
            ),
          ),
          onPressed: () {
            BlocProvider.of<RegistryBloc>(context).add(Register(
              attendee: Attendee.fromUser(currentUser),
            ));
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
              cancel.i18n,
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
      ],
    );
  }
}
