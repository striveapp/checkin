// @dart=2.9

import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/blocs/graduation/graduation_bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/public_profile/profile_info.dart';
import 'package:checkin/src/ui/components/public_profile/user_stats.dart';
import 'package:checkin/src/ui/components/stats/graduate_fab.dart';
import 'package:checkin/src/util/graduation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublicProfilePage extends StatelessWidget {
  static const String profile = "Profile";
  final String userEmail;

  const PublicProfilePage({
    Key key,
    @required this.userEmail,
  }) : super(key: key);

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
        BlocProvider<GraduationBloc>(
          create: (_) => GraduationBloc(
            graduationSystemRepository: context.read(),
            userRepository: context.read(),
            statsRepository: context.read(),
            graduationUtils: GraduationUtil(),
            userToGraduateEmail: userEmail,
          )..add(InitializeGraduation()),
        ),
      ],
      child: Scaffold(
        appBar: BaseAppBar(
          title: profile.i18n,
          showUserImage: false,
        ),
        floatingActionButton: GraduateFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: <Widget>[
                ProfileInfo(),
                SizedBox(
                  height: 25,
                ),
                Expanded(child: UserStats())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
