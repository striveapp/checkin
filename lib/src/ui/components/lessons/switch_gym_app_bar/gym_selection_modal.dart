import 'dart:math';

import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/lessons/switch_gym_app_bar/selectable_gym_tile.dart';
import 'package:checkin/src/ui/components/lessons/switch_gym_app_bar/selected_gym_tile.dart';
import 'package:flutter/material.dart';

class GymSelectionModal extends StatelessWidget {
  final List<String> knownGymIds;
  final Gym selectedGym;
  final User currentUser;

  const GymSelectionModal({
    Key key,
    @required this.knownGymIds,
    @required this.selectedGym,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: Key("gymSelectionModal"),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: max(knownGymIds.length * 80.0, 200),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.maximize_rounded,
                size: 50,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: AvailableGyms(
                selectedGym: selectedGym,
                knownGymIds: knownGymIds,
                currentUser: currentUser,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailableGyms extends StatelessWidget {
  final Gym selectedGym;
  final List<String> knownGymIds;
  final User currentUser;

  const AvailableGyms({
    Key key,
    @required this.selectedGym,
    @required this.knownGymIds,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        SelectedGymTile(gym: selectedGym),
        ...knownGymIds
            .where((knownGymId) => selectedGym.id != knownGymId)
            .map((knownGymId) => Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SelectableGymTile(
                      gymId: knownGymId,
                      userEmail: currentUser.email,
                    ),
                  ],
                ))
      ],
    );
  }
}
