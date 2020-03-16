import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PodiumProfile extends StatelessWidget {
  final String profileEmail;
  final int position;

  const PodiumProfile({Key key, this.profileEmail, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: ProfileBloc(
          userRepository: UserRepository(),
          userBloc: BlocProvider.of<UserBloc>(context),
          nonCurrentUserEmail: profileEmail),
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileSuccess) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('stats/${state.profileUser.email}');
            },
            child: Column(
              children: <Widget>[
                if (position == 1) ...[
                  Text(
                    position.toString(),
                  ),
                  UserImage(
                    userImage: state.profileUser.imageUrl,
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(state.profileUser.name),
                ],
                if (position != 1) ...[
                  Text(position.toString()),
                  UserImage(
                    userImage: state.profileUser.imageUrl,
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(state.profileUser.name),
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
