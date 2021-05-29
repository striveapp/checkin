import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/stats/graduate_fab.dart';
import 'package:checkin/src/ui/components/stats/stats_body.dart';
import 'package:checkin/src/ui/components/stats/stats_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsPage extends StatelessWidget {
  final String userEmail;
  static const String stats = 'Stats';

  StatsPage({
    Key key,
    @required String userEmail,
  })  : assert(userEmail != null),
        this.userEmail = userEmail,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatsBloc>(
          create: (context) => StatsBloc()..add(TimespanUpdate(timespan: Timespan.week)),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(
            userRepository: context.read(),
            storageRepository: context.read(),
            imageRepository: context.read(),
            nonCurrentUserEmail: userEmail,
          )..add(InitializeProfile()),
        ),
      ],
      child: Scaffold(
        appBar: BaseAppBar(
          title: stats.i18n,
          showUserImage: false,
        ),
        floatingActionButton: GraduateFab(userEmail: userEmail),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: <Widget>[
                StatsHeader(userEmail: userEmail),
                Expanded(child: StatsBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
