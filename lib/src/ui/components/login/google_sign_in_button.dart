// @dart=2.9

import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleSignInButton extends StatelessWidget {
  final bool darkMode;
  final double borderRadius;

  static const String googleSignIn = 'Sign in with Google';

  GoogleSignInButton({
    this.darkMode = false,
    this.borderRadius = 3.0,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<LoginBloc>().add(LoginWithGoogle()),
      style: ElevatedButton.styleFrom(
        primary: darkMode ? Color(0xFF4285F4) : Colors.white,
        minimumSize: Size(88, 44),
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.borderRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              height: 38.0, // 40dp - 2*1dp border
              width: 38.0, // matches above
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(this.borderRadius),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(
                    "assets/images/google-logo.png",
                  ),
                  height: 20.0,
                  width: 20.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              googleSignIn.i18n,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: darkMode ? Colors.white : Colors.black.withOpacity(0.54),
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
