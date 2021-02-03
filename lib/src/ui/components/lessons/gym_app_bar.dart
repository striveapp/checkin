import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/gym_selection_modal.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';

class GymAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        var currentUser;
        if (state is UserSuccess) {
          currentUser = state.currentUser;
        }

        return AppBar(
          centerTitle: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: GestureDetector(
            onTap: isInDebugMode
                ? () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                        context: context,
                        builder: (_) => BlocProvider.value(
                            value: context.read<UserBloc>(),
                            child: GymSelectionModal(currentUser: currentUser)));
                  }
                : DISABLED_BUTTON,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<GymBloc, GymState>(buildWhen: (GymState prev, GymState curr) {
                  if (prev is GymLoaded && curr is GymLoaded) {
                    return prev.gym.name != curr.gym.name;
                  }
                  return prev is InitialGymState;
                }, builder: (BuildContext context, GymState state) {
                  return state.map(
                    initialGymState: (InitialGymState state) => EmptyWidget(),
                    gymLoaded: (GymLoaded gymLoaded) => Text(gymLoaded.gym.name,
                        style: Theme.of(context).textTheme.headline2.apply(color: Colors.white)),
                  );
                }),
                SizedBox(
                  width: 5,
                ),
                if (isInDebugMode)
                  RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                      ))
              ],
            ),
          ),
          actions: <Widget>[
            if (currentUser != null)
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: IconButton(
                    key: Key('accountPageButton'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('account');
                    },
                    icon: UserImage(
                      userImage: currentUser.imageUrl,
                      width: 30,
                      height: 30,
                    )),
              ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
