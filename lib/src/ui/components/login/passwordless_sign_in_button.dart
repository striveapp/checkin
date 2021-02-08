import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class PasswordlessSignInButton extends StatelessWidget {
  static const String emailMeMagicLink = 'Email me a magic link';

  @override
  Widget build(BuildContext context) {
    _onLoginPasswordless() {
      Navigator.of(context).pushNamed("email-retrieve/");
    }

    return ElevatedButton(
      key: Key('passwordlessButton'),
      onPressed: _onLoginPasswordless,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFF44336),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          gradient: LinearGradient(
              colors: [Color(0xFFF44336), Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minWidth: 88.0, minHeight: 50.0),
          child: Text(
            emailMeMagicLink.i18n,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1.25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
