import 'package:checkin/src/ui/components/stats/profile_infos.dart';
import 'package:checkin/src/ui/components/timespan_toggles.dart';
import 'package:flutter/material.dart';

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
          child: TimespanToggles(),
        ),
      ],
    );
  }
}
