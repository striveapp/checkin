import 'package:flutter/material.dart';
import 'package:checkin/src/localization/localization.dart';

class NoLeaderboardBanner extends StatelessWidget {
  static const String noLeaderboard = 'The Leaderboard is not available yet';

  @override
  Widget build(BuildContext context) {
    return Text(
        NoLeaderboardBanner.noLeaderboard.i18n,
        style: Theme.of(context).textTheme.headline1.apply(color: Colors.black87)
    );
  }
}