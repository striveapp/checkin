// @dart=2.9

import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendeesCounter extends StatelessWidget {
  static const String studentsAccepted = 'students accepted';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsStatsBloc, LessonsStatsState>(
      builder: (BuildContext context, LessonsStatsState state) {
        if (state is LessonsStatsInitial) {
          return LoadingIndicator();
        }
        if (state is LessonsStatsUpdated) {
          return Column(children: <Widget>[
            Text(
              state.totalAttendees.toString(),
              key: Key('matHours'),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .apply(fontSizeFactor: 3, color: Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              AttendeesCounter.studentsAccepted.i18n,
              style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 2),
            )
          ]);
        }

        return ErrorWidget('Unknown state [$state] for attendees_counter');
      },
    );
  }
}
