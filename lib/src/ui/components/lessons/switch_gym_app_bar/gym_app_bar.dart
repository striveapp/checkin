// @dart=2.9

import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/switch_gym/bloc.dart';
import 'package:checkin/src/blocs/switch_gym/switch_gym_bloc.dart';
import 'package:checkin/src/blocs/switch_gym/switch_gym_state.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/lessons/switch_gym_app_bar/gym_selection_modal.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GymAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchGymBloc(
        userRepository: context.read(),
        gymRepository: context.read(),
      )..add(InitializeSwitchGym()),
      child: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: GymAppBarTitle(),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: UserImage(),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}

class GymAppBarTitle extends StatelessWidget {
  const GymAppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchGymBloc, SwitchGymsState>(
      builder: (context, state) {
        return state.map(
          switchGymsInitial: (SwitchGymsInitial state) => EmptyWidget(),
          knownGymsLoaded: (KnownGymsLoaded state) {
            return GestureDetector(
              onTap: state.showDropdown
                  ? () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        ),
                        context: context,
                        builder: (_) => BlocProvider.value(
                          value: context.read<ProfileBloc>(),
                          child: GymSelectionModal(
                            selectedGym: state.selectedGym,
                            knownGymIds: state.knowGymsIds,
                            currentUser: state.currentUser,
                          ),
                        ),
                      );
                    }
                  : DISABLED_BUTTON,
              child: Row(
                key: Key("gymSelectionDropdown"),
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.selectedGym.name,
                      style: Theme.of(context).textTheme.headline2.apply(color: Colors.white)),
                  SizedBox(
                    width: 5,
                  ),
                  if (state.showDropdown)
                    RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                        ))
                ],
              ),
            );
          },
        );
      },
    );
  }
}
