import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/gym_selection/gym_selection_buttons.dart';
import 'package:flutter/material.dart';

class GymSelectionPage extends StatelessWidget {
  final String userName;
  final String userEmail;

  static const String heyUser = "Hey %s";
  static const String whatsYourGym = "What's your gym?";

  GymSelectionPage({
    @required this.userName,
    @required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
                          .apply(fontSizeDelta: 4)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    whatsYourGym.i18n,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .apply(color: Colors.white54),
                  ),
                  SizedBox(
                    height: 60,
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
