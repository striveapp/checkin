import 'package:checkin/src/ui/pages/user_stats_page.dart';
import 'package:flutter/material.dart';

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
    return UserStatsPage(userEmail: userEmail,);
  }
}