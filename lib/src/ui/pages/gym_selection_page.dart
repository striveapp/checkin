import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class UnselectedGymPage extends StatelessWidget {
  final String userName;

  static const String heyUser = "Welcome %s";
  static const String contactYourGymOwner = "Please contact your gym owner to obtain the referral link";

  UnselectedGymPage({
    @required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(heyUser.i18n.fill([userName]),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .apply(fontSizeDelta: 3)),
                SizedBox(height: 50),
                Text(
                  contactYourGymOwner.i18n,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3.apply(
                        color: Theme.of(context)
                            .textTheme
                            .headline2
                            .color
                            .withAlpha(100),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
