import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/leaderboard/podium_bedge.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PodiumProfile extends StatelessWidget {
  final String profileEmail;
  final int position;
  final Color color;

  const PodiumProfile({Key key, this.profileEmail, this.position, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      cubit: ProfileBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
          userBloc: BlocProvider.of<UserBloc>(context),
          nonCurrentUserEmail: profileEmail),
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoaded) {
          //TODO: this should be simplified https://trello.com/c/EVfSfCQy
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('stats/${state.profileUser.email}');
            },
            child: Column(
              children: <Widget>[
                if (position == 1) ...[
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: color),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: UserImage(
                          key: Key("podium_profile_${position}_$profileEmail"),
                          userImage: state.profileUser.imageUrl,
                          width: 90,
                          height: 90,
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 3,
                        child: PodiumBedge(color: color, text: "1st",)
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.profileUser.name,
                    style: Theme.of(context).textTheme.headline4,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ],
                if (position != 1) ...[
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: color),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: UserImage(
                          userImage: state.profileUser.imageUrl,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      Positioned(
                          right: 2,
                          bottom: 0,
                          child: PodiumBedge(color: color, text: "${position == 2 ? "2nd" : "3rd"}",)
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.profileUser.name,
                    style: Theme.of(context).textTheme.headline4,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ]
              ],
            ),
          );
        }
        return LoadingIndicator();
      },
    );
  }
}
