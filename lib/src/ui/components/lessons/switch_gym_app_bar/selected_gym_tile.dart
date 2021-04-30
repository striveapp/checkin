import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';

class SelectedGymTile extends StatelessWidget {
  final Gym gym;

  SelectedGymTile({
    this.gym,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key("gym_${gym.id}"),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            RoundedImage(
              url: gym.imageUrl,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              gym.name,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Icon(
            Icons.adjust,
            color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
