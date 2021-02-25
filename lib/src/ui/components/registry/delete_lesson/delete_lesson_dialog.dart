import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteLessonDialog extends StatelessWidget {
  final String selectedGymId;

  const DeleteLessonDialog({Key key, @required this.selectedGymId}) : super(key: key);

  static const String deletingClassDisclaimer = 'Are you sure you want to permanently delete this class?';
  static const String cannotBeUndone = 'This operation cannot be undone';
  static const String goBack = 'Go back';
  static const String deleteClass = 'Delete class';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      content: SizedBox(
        height: 100,
        child: Column(
          children: <Widget>[
            Text(deletingClassDisclaimer.i18n,
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
      actionsPadding: EdgeInsets.only(right: 10),
      actions: <Widget>[
        CancelButton(
          key: Key("confirmButton"),
          text: deleteClass.i18n,
          onPressed: () {
            BlocProvider.of<RegistryBloc>(context).add(DeleteLesson(
              gymId: selectedGymId,
            ));
            Navigator.of(context).popUntil(ModalRoute.withName(Navigator.defaultRouteName));
          },
        ),
        ElevatedButton(
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
