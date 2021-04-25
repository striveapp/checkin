import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/ui/components/profile_infos.dart';
import 'package:checkin/src/ui/components/timespan_toggles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsHeader extends StatelessWidget {
  final String userEmail;

  StatsHeader({this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: ProfileInfos(
            userEmail: userEmail,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: TimespanToggles(
            availableTimespans: StatsBloc.availableTimespans,
            defaultTimespan: Timespan.week,
            onPressed: (int index) {
              context
                  .read<StatsBloc>()
                  .add(TimespanUpdate(timespan: StatsBloc.availableTimespans[index]));
            },
          ),
        ),
      ],
    );
  }
}
