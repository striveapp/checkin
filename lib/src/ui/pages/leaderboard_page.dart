import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
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
      body: BlocProvider( create: (BuildContext context) => LeaderboardBloc(),
              child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
          builder: (BuildContext context, LeaderboardState state) {
            if (state is LeaderboardLoaded) {
              return ListView.builder(itemCount: state.users.length, itemBuilder: (BuildContext context, int index) {
                UserWithHistory user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  leading: UserImage(userImage: user.imageUrl,),
                  trailing: Text(user.history.attendedLessons.length.toString()),
                 );
              });
            }

            return ErrorWidget('Unknown state $state in LeaderboardPage');
          },
        ),
      ),
    );
  }
}
