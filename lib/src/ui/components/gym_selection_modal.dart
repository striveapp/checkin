import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/gym_selection_tile.dart';
import 'package:flutter/material.dart';

class GymSelectionModal extends StatelessWidget {
  final User currentUser;

  GymSelectionModal({this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 200,
      ),
      child: Column(
        children: [
          Icon(Icons.remove_rounded, size: 50, color: Colors.grey,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,),
            child: GymSelectionTile( // on top selected gym
              gymId: currentUser.selectedGymId,
              currentUser: currentUser,
            ),
          ),
          ...currentUser.knownGymIds.where((knownGymId) => currentUser.selectedGymId != knownGymId)
              .map((knownGymId) =>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,),
                child: GymSelectionTile(
                  gymId: knownGymId,
                  currentUser: currentUser,
            ),
          ),)
        ],
      ),
    );
  }
}
