import 'package:checkin/src/ui/components/gym_selection/gym_dropdown.dart';
import 'package:flutter/material.dart';

class GymSelectionPage extends StatelessWidget {
  final String userName;
  final String userEmail;

  GymSelectionPage({
    @required this.userName,
    @required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Welcome $userName", style: Theme.of(context).textTheme.headline1.apply(color: Colors.black),),
          Text("What's your gym?"),
          GymDropdown(userEmail: userEmail,),
        ],
      ),
    );
  }
}
