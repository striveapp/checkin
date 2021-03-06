// @dart=2.9

import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/util/intent_launcher_util.dart';
import 'package:flutter/material.dart';

class CheckEmailView extends StatelessWidget {
  final String email;
  static const String checkYourEmail = "Check your email!";
  static const String toConfirmEmail =
      "To confirm your email address, tap the link in the email we sent to";
  static const String openEmailApp = "open email app";
  static const String whichEmailAppDoYouUseFor = "Which email app do you use for %s?";

  const CheckEmailView({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Column(
              children: [
                Icon(
                  Icons.email,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 100,
                ),
                SizedBox(
                  height: 55,
                ),
                Text(
                  checkYourEmail.i18n,
                  style: Theme.of(context).textTheme.headline1.apply(
                        fontWeightDelta: 1,
                      ),
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: toConfirmEmail.i18n,
                          style: Theme.of(context).textTheme.headline3.apply(
                              color: Theme.of(context).textTheme.headline3.color.withAlpha(100)),
                        ),
                        TextSpan(
                          text: " ${email}",
                          style: Theme.of(context).textTheme.headline3.apply(
                                fontWeightDelta: 1,
                              ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                openEmailApp.i18n.toUpperCase(),
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () async {
                IntentLauncherUtil().launchEmailApp(
                  chooserTitle: whichEmailAppDoYouUseFor.i18n.fill([email]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
