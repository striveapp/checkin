// @dart=2.9

import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/stats/user/lesson_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendedLessonCards extends StatelessWidget {
  static const String noClassesAttended = "No classes attended %s";

  const AttendedLessonCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsBloc, UserStatsState>(
      builder: (BuildContext context, UserStatsState state) => state.map(
        userStatsUninitialized: (UserStatsUninitialized state) =>
            SliverToBoxAdapter(child: EmptyWidget()),
        userStatsLoaded: (UserStatsLoaded state) {
          return state.attendedLessons.length == 0
              ? SliverToBoxAdapter(
                  child: Center(
                      child: Text(
                    noClassesAttended.gender(state.timespan.name),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  )),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => LessonInfoCard(
                      lesson: state.attendedLessons[index],
                    ),
                    childCount: state.attendedLessons.length,
                  ),
                );
        },
      ),
    );
  }
}
