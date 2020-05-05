import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
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
    return Scaffold(
      appBar: BaseAppBar(
        title: stats.i18n,
        showUserImage: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
                userRepository: UserRepository(),
                nonCurrentUserEmail: userEmail,
                userBloc: BlocProvider.of<UserBloc>(context)),
          ),
          BlocProvider<StatsBloc>(
            create: (context) =>
                StatsBloc()..add(TimespanUpdate(timespan: constants.WEEK)),
          ),
        ],
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: <Widget>[
                  StatsHeader(userEmail: userEmail),
                  StatsBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
