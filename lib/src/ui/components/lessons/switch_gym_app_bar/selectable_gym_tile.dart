// @dart=2.9

import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectableGymTile extends StatefulWidget {
  final String gymId;
  final String userEmail;

  SelectableGymTile({
    @required this.gymId,
    @required this.userEmail,
  });

  @override
  _SelectableGymTileState createState() => _SelectableGymTileState();
}

class _SelectableGymTileState extends State<SelectableGymTile> {
  GymBloc _bloc;

  @override
  void dispose() {
    super.dispose();
    // _bloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = GymBloc(
      gymRepository: context.read(),
      gymId: widget.gymId,
    );

    return InkWell(
      key: Key("gym_${widget.gymId}"),
      onTap: () async {
        context.read<ProfileBloc>().add(UpdateSelectedGym(
              userEmail: widget.userEmail,
              newGymId: widget.gymId,
            ));
        await Navigator.pop(context);
      },
      child: BlocBuilder<GymBloc, GymState>(
        bloc: _bloc..add(InitializeGym()),
        builder: (context, state) {
          return state.map(
            initialGymState: (InitialGymState state) => EmptyWidget(),
            gymLoaded: (GymLoaded state) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RoundedImage(
                      url: state.gym.imageUrl,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.gym.name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    Icons.lens_outlined,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
