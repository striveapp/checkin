import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class PasswordlessSignInButton extends StatelessWidget {
  static const String emailMeMagicLink = 'Email me a magic link';

  @override
  Widget build(BuildContext context) {
    _onLoginPasswordless() {
      Navigator.of(context).pushNamed("email-retrieve/");
    }

    return OutlinedButton(
      key: Key('passwordlessButton'),
      onPressed: _onLoginPasswordless,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 0.8,
          color: Theme.of(context).primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPrimary: Theme.of(context).primaryColor,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 44,
        child: Text(
          emailMeMagicLink.i18n,
          style: Theme.of(context).textTheme.headline3.apply(
                color: Theme.of(context).primaryColor,
                fontWeightDelta: 1,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
