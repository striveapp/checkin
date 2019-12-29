import 'package:checkin/src/blocs/user/bloc.dart';
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
    @required this.title,
    this.actions,
    this.backgroundColor,
    this.showUserImage=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        var currentUser;
        if( state is UserSuccess ) {
          currentUser = state.currentUser;
        }
        debugPrint("drawing AppBar with user [$currentUser]");

        return AppBar(
          centerTitle: true,
          backgroundColor: this.backgroundColor ?? Theme.of(context).primaryColor,
          title: Text(this.title, style: Theme.of(context).textTheme.headline),
          actions: <Widget>[
            if (showUserImage && currentUser != null)
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: IconButton(
                    key: Key('accountPageButton'),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('account');
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

      },
    );
      }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
