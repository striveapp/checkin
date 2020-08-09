import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/gym_selection/gym_selection_buttons.dart';
import 'package:flutter/material.dart';

class GymSelectionPage extends StatelessWidget {
  final String userName;
  final String userEmail;

  static const String heyUser = "Welcome %s";
  static const String selectYourGym = "Select your gym";

  GymSelectionPage({
    @required this.userName,
    @required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
          child: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(heyUser.i18n.fill([userName]),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .apply(fontSizeDelta: 3)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    selectYourGym.i18n,
                    style: Theme.of(context).textTheme.headline2.apply(
                          color: Theme.of(context)
                              .textTheme
                              .headline2
                              .color
                              .withAlpha(100),
                        ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GymSelectionButtons(
                    userEmail: userEmail,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
