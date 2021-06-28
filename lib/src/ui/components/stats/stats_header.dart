// @dart=2.9

import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/stats/stats_bloc.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/ui/components/timespan_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsHeader extends StatelessWidget {
  final String headerText;

  StatsHeader({this.headerText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            headerText,
            style: Theme.of(context).textTheme.headline2,
          ),
          TimespanDropdown(
            availableTimespans: StatsBloc.availableTimespans,
            defaultTimespan: Timespan.week,
            onChanged: (Timespan selectedTimespan) {
              context.read<StatsBloc>().add(TimespanUpdate(timespan: selectedTimespan));
            },
          ),
        ],
      ),
    );
  }
}
