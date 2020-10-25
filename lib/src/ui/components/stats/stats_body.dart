import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/pages/lessons_stats_page.dart';
import 'package:checkin/src/ui/pages/user_stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoaded) {
          if (state.profileUser.isOwner) {
            return LessonsStatsPage(master: Master.fromUser(state.profileUser));
          }

          return UserStatsPage(user: state.profileUser);
        }

        if (state is InitialProfileState) {
          return LoadingIndicator();
        }

        return ErrorWidget('Unknow state in StatsPage $state');
      },
    );
  }
}
