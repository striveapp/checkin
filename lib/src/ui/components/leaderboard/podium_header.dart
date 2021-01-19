import 'package:checkin/src/ui/components/leaderboard/podium_profile.dart';
import 'package:flutter/material.dart';

class PodiumHeader extends StatelessWidget {
  final String firstProfileEmail;
  final String secondProfileEmail;
  final String thirdProfileEmail;

  const PodiumHeader(
      {Key key, this.firstProfileEmail, this.secondProfileEmail, this.thirdProfileEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: PodiumProfile(
                position: 2,
                profileEmail: secondProfileEmail,
                color: Color(0xffC0C0C0),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: PodiumProfile(
                position: 1,
                profileEmail: firstProfileEmail,
                color: Color(0xeeCFB53B),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: PodiumProfile(
                  position: 3, profileEmail: thirdProfileEmail, color: Color(0xeecd7f32)),
            ),
          ),
        ],
      ),
    );
  }
}
