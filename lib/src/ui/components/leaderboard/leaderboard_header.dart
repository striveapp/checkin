// @dart=2.9

import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/ui/components/timespan_toggles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardHeader extends StatelessWidget {
  const LeaderboardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimespanToggles(
      availableTimespans: LeaderboardBloc.availableTimespans,
      defaultTimespan: Timespan.year,
      onPressed: (int index) {
        context
            .read<LeaderboardBloc>()
            .add(UpdateTimespan(timespan: LeaderboardBloc.availableTimespans[index]));
      },
    );
  }
}
