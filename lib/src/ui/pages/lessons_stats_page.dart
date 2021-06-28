// @dart=2.9

import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/blocs/lessons_stats/lessons_stats_bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/ui/components/stats/lessons/attendees_counter.dart';
import 'package:checkin/src/ui/components/stats/lessons/attendees_info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsStatsPage extends StatelessWidget {
  static const String topStudents = 'Top Students';
  final Master master;

  const LessonsStatsPage({Key key, this.master}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonsStatsBloc>(
        create: (BuildContext context) => LessonsStatsBloc(
            statsBloc: context.read(),
            gymRepository: context.read(),
            lessonsRepository: context.read(),
            master: master)
          ..add(InitializeLessonsStats()),
        child: Column(
          children: [
            AttendeesCounter(),
            SizedBox(
              height: 30,
            ),
            Text(
              topStudents.i18n,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: AttendeesInfoList()),
          ],
        ));
  }
}
