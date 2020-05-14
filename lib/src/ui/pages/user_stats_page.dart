import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/stats/user/attended_lessons_list.dart';
import 'package:checkin/src/ui/components/stats/user/mat_time_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatsPage extends StatelessWidget {
  final User _user;

  UserStatsPage({
    Key key,
    @required User user,
  })  : assert(user != null),
        _user = user,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsBloc, UserStatsState>(
        bloc: UserStatsBloc(
          statsRepository: StatsRepository(),
          user: _user,
          statsBloc: BlocProvider.of<StatsBloc>(context)
        ),
        builder: (BuildContext context, UserStatsState state) {
      if (state is UserStatsUninitialized) {
        return LoadingIndicator();
      }
      if (state is UserStatsLoaded) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MatTimeCounter(
                timeSpan: state.timespan,
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
      return ErrorWidget("Unknown State [$state] received in: user_stats_page");
    });
  }
}
