import 'package:checkin/src/blocs/lessons_stats/lessons_stats_bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/stats/lessons/attendee_info_card.dart';
import 'package:checkin/src/ui/components/stats/lessons/attendees_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsStatsPage extends StatelessWidget {
  final Master master;

  const LessonsStatsPage({Key key, this.master}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonsStatsBloc>(
        create: (BuildContext context) => LessonsStatsBloc(
            statsBloc: BlocProvider.of<StatsBloc>(context),
            lessonsRepository:
                RepositoryProvider.of<LessonRepository>(context),
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
                  Text(
                    'Top Students:',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .apply(color: Colors.black87),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AttendeeInfoCard(),
                  AttendeeInfoCard(),
                  AttendeeInfoCard(),
                ],
              ),
            ),
          ],
        ));
  }
}
