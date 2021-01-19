import 'package:checkin/src/blocs/lessons_stats/lessons_stats_bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/stats/lessons/attendees_counter.dart';
import 'package:checkin/src/ui/components/stats/lessons/attendees_info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

class LessonsStatsPage extends StatelessWidget {
  static const String topStudents = 'Top Students';
  final Master master;

  const LessonsStatsPage({Key key, this.master}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonsStatsBloc>(
        create: (BuildContext context) => LessonsStatsBloc(
            statsBloc: BlocProvider.of<StatsBloc>(context),
            lessonsRepository: RepositoryProvider.of<LessonRepository>(context),
            master: master),
        child: Column(
          children: [
            AttendeesCounter(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(topStudents.i18n, style: Theme.of(context).textTheme.headline1),
                  SizedBox(
                    height: 10,
                  ),
                  AttendeesInfoList()
                ],
              ),
            ),
          ],
        ));
  }
}
