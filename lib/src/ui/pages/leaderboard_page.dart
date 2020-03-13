import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
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
            if (state is LeaderboardLoaded) {
              return ListView.builder(
                  itemCount: state.usersHistory.length,
                  itemBuilder: (BuildContext context, int index) => ProfileTile(
                        profileEmail: state.usersHistory[index].email,
                        attendedClasses:
                            state.usersHistory[index].attendedLessons.length,
                      ));
            }
            
            if(state is LeaderboardInitial) {
              return LoadingIndicator();
            }

            return ErrorWidget('Unknown state $state in LeaderboardPage');
          },
        ),
      ),
    );
  }
}

//TODO: this can be moved in a separate file
class ProfileTile extends StatelessWidget {
  final String profileEmail;
  final int attendedClasses;

  const ProfileTile({Key key, this.profileEmail, this.attendedClasses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: ProfileBloc(
          userRepository: UserRepository(),
          userBloc: BlocProvider.of<UserBloc>(context),
          nonCurrentUserEmail: profileEmail),
      builder: (BuildContext context, ProfileState profileState) {
        if (profileState is ProfileSuccess) {
          return ListTile(
            leading: UserImage(
              userImage: profileState.profileUser.imageUrl,
            ),
            title: Text(profileState.profileUser.name),
            trailing: Text(attendedClasses.toString()),
          );
        }
        //TODO: this can be improved to use List tile with placeholders
        return LoadingIndicator();
      },
    );
  }
}
