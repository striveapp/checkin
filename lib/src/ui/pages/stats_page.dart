import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/attended_lessons_list.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/mat_time_counter.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsPage extends StatelessWidget {
  static const String stats = 'Stats';

  final String _userEmail;

  StatsPage({
    Key key,
    @required String userEmail,
  })  : assert(userEmail != null),
        _userEmail = userEmail,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StatsPage.stats.i18n,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<StatsBloc>(
              create: (context) => StatsBloc(
                    statsRepository: StatsRepository(),
                    dateUtil: DateUtil(),
                    userEmail: _userEmail,
                  )),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
                userRepository: UserRepository(),
                nonCurrentUserEmail: _userEmail,
                userBloc: BlocProvider.of<UserBloc>(context)),
          )
        ],
        child: BlocBuilder<StatsBloc, StatsState>(
            builder: (BuildContext context, StatsState state) {
          if (state is StatsUninitialized) {
            return LoadingIndicator();
          }
          if (state is StatsLoaded) {
            return SingleChildScrollView(
              child: Container(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "User".i18n,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .apply(color: Colors.black87),
                    ),
                    ProfileCard(userEmail: _userEmail),
                    DropdownButton<String>(
                      value: state.timeSpan,
                      items: <String>[
                        constants.WEEK,
                        constants.MONTH,
                        constants.YEAR
                      ]
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(_capitalize(value.i18n)),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        BlocProvider.of<StatsBloc>(context)
                            .add(LoadStats(timeSpan: value));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MatTimeCounter(
                        timeSpan: state.timeSpan,
                        counter: state.attendedLessons.length,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AttendedLessonsList(attendedLessons: state.attendedLessons),
                  ],
                ),
              )),
            );
          }
          return ErrorWidget("Unknown State [$state] received in: stats_page");
        }),
      ),
    );
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
