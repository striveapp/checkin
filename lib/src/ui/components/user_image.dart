import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/ui/components/placeholder_image.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserImage extends StatelessWidget {
  final double width;
  final double height;

  const UserImage({
    Key key,
    this.width = 30,
    this.height = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.map(
            initialProfileState: (InitialProfileState state) => PlaceholderImage(
                  width: width,
                  height: height,
                ),
            profileLoaded: (ProfileLoaded state) {
              return IconButton(
                key: Key('accountPageButton'),
                onPressed: () {
                  Navigator.of(context).pushNamed('account');
                },
                icon: RoundedImage(
                  url: state.profileUser.imageUrl,
                  width: width,
                  height: height,
                ),
              );
            });
      },
    );
  }
}
