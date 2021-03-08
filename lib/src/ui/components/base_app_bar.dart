import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/config.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget> actions;
  final bool showUserImage;

  const BaseAppBar({
    Key key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.showUserImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: this.backgroundColor ?? Theme.of(context).primaryColor,
      title: title == null || title.isEmpty
          ? EmptyWidget()
          : Text(
              this.title,
              style: Theme.of(context).textTheme.headline1.apply(color: Colors.white),
            ),
      actions: <Widget>[
        if (showUserImage)
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
                key: Key('accountPageButton'),
                onPressed: () {
                  Navigator.of(context).pushNamed('account');
                },
                icon: ProfileImage()),
          ),
        if (actions != null) ...actions
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
      return state.map(
          initialProfileState: (InitialProfileState state) => RoundedImage(
                userImage: DEFAULT_USER_IMAGE_URL,
                width: 30,
                height: 30,
              ),
          profileLoaded: (ProfileLoaded state) => RoundedImage(
                userImage: state.profileUser.imageUrl,
                width: 30,
                height: 30,
              ));
    });
  }
}
