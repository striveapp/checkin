import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/leaderboard/no_leaderboard_banner.dart';
import 'package:checkin/src/ui/components/leaderboard/podium_header.dart';
import 'package:checkin/src/ui/components/leaderboard/profile_tile.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

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
        create: (BuildContext context) =>
            LeaderboardBloc(statsRepository: StatsRepository()),
        child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
          builder: (BuildContext context, LeaderboardState state) {
            if (state is LeaderboardInitial) {
              return LoadingIndicator();
            }

            if(state is LeaderboardNotAvailable) {
              return NoLeaderboardBanner();
            }

            if (state is LeaderboardLoaded) {
              List<UserHistory> userHistoryWithoutPodium = state.usersHistory.sublist(3);
              return Column(
                children: <Widget>[
                  Expanded(flex:1,
                      child: PodiumHeader(
                        firstProfileEmail: state.usersHistory[0].email,
                        secondProfileEmail: state.usersHistory[1].email,
                        thirdProfileEmail: state.usersHistory[2].email,
                      )
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                        itemCount: userHistoryWithoutPodium.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProfileTile(
                            key: Key('tile_${index + 4}_${userHistoryWithoutPodium[index].email}'),
                            profileEmail: userHistoryWithoutPodium[index].email,
                            attendedClasses: userHistoryWithoutPodium[index].attendedLessons.length,
                            position: index + 4,
                            );
                        }),
                  ),
                ],
              );
            }
            return ErrorWidget('Unknown state $state in LeaderboardPage');
          },
        ),
      ),
    );
  }
}
