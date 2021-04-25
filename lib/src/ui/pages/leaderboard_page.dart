import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/leaderboard/leaderboard_header.dart';
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
            SizedBox(
              height: 30,
            ),
            LeaderboardHeader(),
            SizedBox(
              height: 20,
            ),
            Podium(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: Ranking()),
          ],
        ),
      ),
    );
  }
}
