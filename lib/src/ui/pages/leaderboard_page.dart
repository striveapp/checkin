import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/leaderboard/podium_header.dart';
import 'package:checkin/src/ui/components/leaderboard/profile_tile.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Leaderboard',
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

            //TODO: needs a state to handle the case for when you have less than 3 users

            if (state is LeaderboardLoaded) {
              return Column(
                children: <Widget>[
                  Expanded(flex:1,
                      child: PodiumHeader(
                        firstProfileEmail: state.usersHistory[0].email,
                        secondProfileEmail: state.usersHistory[1].email,
                        thirdProfileEmail: state.usersHistory[2].email,
                      )
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                        itemCount: state.usersHistory.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ProfileTile(
                              profileEmail: state.usersHistory[index].email,
                              attendedClasses: state
                                  .usersHistory[index].attendedLessons.length,
                              position: index + 1,
                            )),
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
