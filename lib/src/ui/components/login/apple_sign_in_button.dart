import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInButton extends StatelessWidget {
  static const String appleSignIn = 'Sign in with Apple';

  final bool darkMode;

  const AppleSignInButton({Key key, this.darkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: SignInWithAppleButton(
        text: appleSignIn.i18n,
        iconAlignment: IconAlignment.left,
        height: 44,
        style: darkMode ? SignInWithAppleButtonStyle.white : SignInWithAppleButtonStyle.black,
        onPressed: () {
          context.read<LoginBloc>().add(LoginWithApple());
        },
      ),
    );
  }
}
