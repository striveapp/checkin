import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:checkin/src/localization/localization.dart';

class AppleSignInButton extends StatelessWidget {
  static const String appleSignIn = 'Sign in with Apple';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65),
      child: SignInWithAppleButton(
        text: appleSignIn.i18n,
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginWithApple());
        },
      ),
    );
  }
}
