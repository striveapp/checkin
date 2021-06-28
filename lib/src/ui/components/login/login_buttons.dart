// @dart=2.9

import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/login/apple_sign_in_button.dart';
import 'package:checkin/src/ui/components/login/google_sign_in_button.dart';
import 'package:checkin/src/ui/components/login/passwordless_sign_in_button.dart';
import 'package:checkin/src/ui/components/login/test_login_buttons.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:platform/platform.dart';

class LoginButtons extends StatelessWidget {
  static const String or = 'or';

  final Color striveColor;

  LoginButtons(this.striveColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GoogleSignInButton(
          key: Key('loginButton'),
          darkMode: _isDarkMode(context),
          borderRadius: 8.0,
        ),
        if (LocalPlatform().isIOS)
          AppleSignInButton(
            darkMode: _isDarkMode(context),
          ),
        Text(
          or.i18n,
          style: Theme.of(context).textTheme.headline3.apply(
                color: striveColor,
              ),
        ),
        PasswordlessSignInButton(),
        if (isInDebugMode) TestLoginButtons()
      ],
    );
  }

  bool _isDarkMode(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
}
