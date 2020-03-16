import 'package:checkin/src/ui/components/leaderboard/podium_profile.dart';
import 'package:flutter/material.dart';

class PodiumHeader extends StatelessWidget {
  final String firstProfileEmail;
  final String secondProfileEmail;
  final String thirdProfileEmail;

  const PodiumHeader({Key key, this.firstProfileEmail, this.secondProfileEmail, this.thirdProfileEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: PodiumProfile(position: 2, profileEmail: secondProfileEmail,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: PodiumProfile(position: 1, profileEmail: firstProfileEmail,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: PodiumProfile(position: 3, profileEmail: thirdProfileEmail,),
          ),
        ],
      ),
    );
  }
}
