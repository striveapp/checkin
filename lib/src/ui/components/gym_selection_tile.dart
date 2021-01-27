import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GymSelectionTile extends StatelessWidget {
  final String gymId;
  final User currentUser;

  GymSelectionTile({
    @required this.gymId,
    this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymBloc, GymState>(
      cubit: GymBloc(gymRepository: context.watch<GymRepository>(), gymId: gymId)
        ..add(GymEvent.initializeGym()),
      builder: (BuildContext context, GymState state) {
        return state.map(
          initialGymState: (InitialGymState initialGymState) => LoadingIndicator(),
          gymLoaded: (GymLoaded gymLoaded) => InkWell(
            onTap: () async {
              print('changing gym from [${currentUser.selectedGymId}] to [$gymId]');
              await context.read<UserBloc>().add(UserEvent.updateSelectedGym(
                    newGymId: gymId,
                  ));
              await Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UserImage(
                      userImage: gymLoaded.gym.imageUrl,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      gymLoaded.gym.name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                Radio(
                  value: gymId,
                  groupValue: currentUser?.selectedGymId,
                  onChanged: (value) async {
                    /* just display an active radio */
                  },
                  activeColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
