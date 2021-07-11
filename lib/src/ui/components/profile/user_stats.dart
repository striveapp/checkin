// @dart=2.9

import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/stats/stats_header.dart';
import 'package:checkin/src/ui/components/stats/user/attended_lessons_list.dart';
import 'package:checkin/src/ui/components/stats/user/class_progress_indicator_shrinkable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStats extends StatelessWidget {
  static const String classes = "Classes";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatsHeader(
          headerText: classes.i18n,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: Stats()),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  const Stats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.map(
            initialProfileState: (_) => EmptyWidget(),
            profileLoaded: (ProfileLoaded state) => BlocProvider(
                  create: (context) => UserStatsBloc(
                    statsRepository: context.read(),
                    statsBloc: context.read(),
                    userEmail: state.profileUser.email,
                    selectedGymId: state.profileUser.selectedGymId,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: ClassProgressionIndicatorShrinkable(
                          min: 120,
                          max: 200,
                        ),
                      ),
                      AttendedLessonCards(),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 45,
                        ),
                      ),
                    ],
                  ),
                ));
      },
    );
  }
}
