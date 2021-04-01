import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCalendarDialog extends StatelessWidget {
  const UpdateCalendarDialog({Key key}) : super(key: key);

  static const String savingNextWeekAsCalendarDisclaimer =
      'You are going to apply the next week of classes as your new calendar';
  static const String takeEffectFrom = 'This will take effect starting from %s';
  static const String cancel = 'Cancel';
  static const String apply = 'Apply';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      content: SizedBox(
        height: 130,
        child: Column(
          children: <Widget>[
            Text(
              savingNextWeekAsCalendarDisclaimer.i18n,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              takeEffectFrom.i18n.fill(["2021-1-11"]),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 2),
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 10),
      actions: <Widget>[
        CancelButton(
          key: Key("confirmButton"),
          text: cancel.i18n,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              apply.i18n,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          onPressed: () {
            context.read<LessonsBloc>().add(UpdateCalendar(
                  initialDay: testDate,
                ));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
