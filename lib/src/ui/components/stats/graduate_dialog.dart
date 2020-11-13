import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/stats/graduation_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

class GraduateDialog extends StatelessWidget {
  static const String notReadyYet =
      'The student doesn\'t yet have the classes required for graduation';
  static const String readyForGraduation =
      'The student has all the classes required for graduation';
  static const String cancel = 'Cancel';
  static const String graduate = 'Graduate';
  static const String graduateAnyway = 'Graduate Anyway';

  final GraduationState graduationState;
  final Grade currentUserGrade;

  const GraduateDialog({
    Key key,
    @required this.graduationState,
    @required this.currentUserGrade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return graduationState.maybeWhen(
        notReadyForGraduation: (Grade newGrade) => AlertDialog(
          key: Key("graduationDialog"),
          actionsPadding: EdgeInsets.symmetric(horizontal: 8),
          title: Text(
            notReadyYet.i18n,
          ),
          titleTextStyle: Theme.of(context).textTheme.headline3,
          contentPadding: EdgeInsets.symmetric(vertical: 25),
          content: GraduationPreview(currentGrade: currentUserGrade, newGrade: newGrade),
          actions: <Widget>[
            RaisedButton(
              key: Key("graduateButton"),
              child: Text(
                graduateAnyway.i18n,
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                context.read<GraduationBloc>().add(Graduate(newGrade: newGrade));
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              key: Key("cancelButton"),
              color: Theme.of(context).buttonTheme.colorScheme.error,
              child: Text(
                cancel.i18n,
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        readyForGraduation: (Grade newGrade) => AlertDialog(
              key: Key("graduationDialog"),
              actionsPadding: EdgeInsets.symmetric(horizontal: 8),
              title: Text(
                readyForGraduation.i18n,
              ),
              titleTextStyle: Theme.of(context).textTheme.headline3,
              contentPadding: EdgeInsets.symmetric(vertical: 25),
              content: GraduationPreview(currentGrade: currentUserGrade, newGrade: newGrade),
              actions: <Widget>[
                RaisedButton(
                  key: Key("graduateButton"),
                  child: Text(
                    graduate.i18n,
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    context.read<GraduationBloc>().add(Graduate(newGrade: newGrade));
                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  key: Key("cancelButton"),
                  color: Theme.of(context).buttonTheme.colorScheme.error,
                  child: Text(
                    cancel.i18n,
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
        orElse: () => LoadingIndicator());
  }
}
