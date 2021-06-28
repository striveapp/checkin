// @dart=2.9

import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/leaderboard/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ranking extends StatelessWidget {
  static const String noLeaderboard = 'There are not enough people to show the ranking';

  const Ranking({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaderboardBloc, LeaderboardState>(
      builder: (context, state) {
        return state.map(
          leaderboardInitial: (LeaderboardInitial state) => EmptyWidget(),
          leaderboardLoaded: (LeaderboardLoaded state) => state.isAvailable
              ? ListView.builder(
                  itemCount: state.restOfTheUsers.length,
                  itemBuilder: (BuildContext context, int index) => ProfileTile(
                        key: Key('tile_${index + 4}_${state.restOfTheUsers[index].email}'),
                        profileEmail: state.restOfTheUsers[index].email,
                        attendedClasses: state.restOfTheUsers[index].attendedLessons.length,
                        position: index + 4,
                      ))
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  child: Text(
                    noLeaderboard.i18n,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
        );
      },
    );
  }
}
