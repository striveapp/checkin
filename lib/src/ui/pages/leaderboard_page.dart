import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/leaderboard/podium.dart';
import 'package:checkin/src/ui/components/leaderboard/ranking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardPage extends StatelessWidget {
  static const String leaderboard = 'Leaderboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: leaderboard.i18n,
        showUserImage: false,
      ),
      body: BlocProvider(
        create: (BuildContext context) => LeaderboardBloc(
          userRepository: context.read(),
          statsRepository: context.read(),
        )..add(InitializeLeaderboard()),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Podium(),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: Ranking(),
            ),
          ],
        ),
      ),
    );
  }
}
