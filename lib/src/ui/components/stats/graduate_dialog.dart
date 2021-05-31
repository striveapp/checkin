import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/stats/graduation_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraduateDialog extends StatelessWidget {
  static const String lessonsForGraduation =
      'The student attended %s of %s classes required for graduation';
  static const String cancel = 'Cancel';
  static const String graduate = 'Graduate';

  const GraduateDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraduationBloc, GraduationState>(
      builder: (context, state) {
        return state.map(
          initialGraduationState: (_) => LoadingIndicator(),
          graduationLoaded: (GraduationLoaded state) {
            return AlertDialog(
              key: Key("graduationDialog"),
              actionsPadding: EdgeInsets.symmetric(horizontal: 8),
              title: Text(
                lessonsForGraduation.i18n
                    .fill([state.attendedLessonsForGrade, _buildForNextLevel(state.forNextLevel)]),
              ),
              titleTextStyle: Theme.of(context).textTheme.headline3,
              contentPadding: EdgeInsets.symmetric(vertical: 25),
              content:
                  GraduationPreview(currentGrade: state.currentGrade, newGrade: state.nextGrade),
              actions: <Widget>[
                ElevatedButton(
                  key: Key("graduateButton"),
                  child: Text(
                    graduate.i18n,
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    context.read<GraduationBloc>().add(Graduate(newGrade: state.nextGrade));
                    Navigator.of(context).pop();
                  },
                ),
                CancelButton(
                  key: Key("cancelButton"),
                  text: cancel.i18n,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _buildForNextLevel(double forNextLevel) =>
      double.infinity == forNextLevel ? "∞" : forNextLevel.toStringAsFixed(0);
}
