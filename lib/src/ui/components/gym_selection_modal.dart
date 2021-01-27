import 'dart:math';

import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/gym_selection_tile.dart';
import 'package:flutter/material.dart';

class GymSelectionModal extends StatelessWidget {
  final User currentUser;

  GymSelectionModal({this.currentUser});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: max(currentUser.knownGymIds.length * 80.0, 200),
        ),
        child: Column(
          children: [
            Icon(
              Icons.remove_rounded,
              size: 50,
              color: Colors.grey,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // on top selected gym
                  GymSelectionTile(
                    gymId: currentUser.selectedGymId,
                    currentUser: currentUser,
                  ),
                  ...currentUser.knownGymIds
                      .where((knownGymId) => currentUser.selectedGymId != knownGymId)
                      .map((knownGymId) => Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              GymSelectionTile(
                                gymId: knownGymId,
                                currentUser: currentUser,
                              ),
                            ],
                          ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
