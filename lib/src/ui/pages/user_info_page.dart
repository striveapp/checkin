import 'package:checkin/src/ui/pages/profile_page.dart';
import 'package:checkin/src/ui/pages/stats_page.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final String userEmail;

  const UserInfoPage({
    Key key,
    @required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(initialPage: isInDebugMode ? 0 : 1),
      physics: isInDebugMode ? null : NeverScrollableScrollPhysics(),
      children: [
        ProfilePage(
          userEmail: userEmail,
        ),
        StatsPage(userEmail: userEmail),
      ],
    );
  }
}
