import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/profile_infos.dart';
import 'package:checkin/src/ui/components/timespan_toggles.dart';
import 'package:checkin/src/ui/pages/lessons_stats_page.dart';
import 'package:checkin/src/ui/pages/user_stats_page.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsPage extends StatelessWidget {
  final String userEmail;

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
        title: UserStatsPage.stats.i18n,
        showUserImage: false,
      ),
      body: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
            userRepository: UserRepository(),
            nonCurrentUserEmail: userEmail,
            userBloc: BlocProvider.of<UserBloc>(context)),
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ProfileInfos(
                        userEmail: userEmail,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: TimespanToggles(),
                      ),
                    ],
                  ),

                  BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (BuildContext context, ProfileState state) {
                        if (state is ProfileSuccess) {
                          if (state.profileUser.isOwner && isInDebugMode) {
                            return LessonsStatsPage();
                          }

                          return UserStatsPage(
                            userEmail: userEmail,
                          );
                        }

                        if (state is ProfileLoading) {
                          return LoadingIndicator();
                        }

                        return ErrorWidget('Unknow state in StatsPage $state');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
