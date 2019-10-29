import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final User currentUser;
  final Color backgroundColor;
  final List<Widget> actions;

  const BaseAppBar({
    Key key,
    @required this.title,
    this.actions,
    this.currentUser,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: this.backgroundColor ?? Color(0xFF242966),
      title: Text(this.title, style: Theme.of(context).textTheme.headline),
      actions: <Widget>[
        if (this.currentUser != null)
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
                key: Key('profilePageButton'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('profile/${currentUser.email}');
                },
                icon: UserImage(
                  userImage: currentUser.imageUrl,
                  width: 30,
                  height: 30,
                )),
          ),
        if (actions != null) ...actions
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
