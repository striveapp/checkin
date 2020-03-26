import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_bloc.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/ui/components/attended_lessons_list.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/mat_time_counter.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatsPage extends StatelessWidget {
  static const String stats = 'Stats';

  final String _userEmail;
  final String _timestamp;

  UserStatsPage({
    Key key,
    @required String userEmail,
    @required String timestamp,
  })  : assert(userEmail != null && timestamp != null),
        _userEmail = userEmail,
        _timestamp = timestamp,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsBloc, UserStatsState>(
        bloc: UserStatsBloc(
          statsRepository: StatsRepository(),
          dateUtil: DateUtil(),
          userEmail: _userEmail,
        )..add(LoadStats(timespan: _timestamp)),
        builder: (BuildContext context, UserStatsState state) {
      if (state is StatsUninitialized) {
        return LoadingIndicator();
      }
      if (state is StatsLoaded) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MatTimeCounter(
                timeSpan: _timestamp,
                counter: state.attendedLessons.length,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AttendedLessonsList(attendedLessons: state.attendedLessons),
          ],
        );
      }
      return ErrorWidget("Unknown State [$state] received in: stats_page");
    });
  }
}
