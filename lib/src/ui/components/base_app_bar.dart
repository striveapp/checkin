import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/user_image.dart';
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
    return BlocProvider(
      create: (BuildContext context) => ProfileBloc(
        userRepository: context.read(),
        storageRepository: context.read(),
        imageRepository: context.read(),
      )..add(InitializeProfile()),
      child: AppBar(
        centerTitle: true,
        backgroundColor: this.backgroundColor ?? Theme.of(context).primaryColor,
        title: title == null || title.isEmpty
            ? EmptyWidget()
            : Text(this.title,
                style: Theme.of(context).textTheme.headline1.apply(color: Colors.white)),
        actions: <Widget>[
          if (showUserImage)
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: UserImage(),
            ),
          if (actions != null) ...actions
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
