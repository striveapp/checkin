import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final bool darkMode;
  final double borderRadius;
  final VoidCallback onPressed;

  GoogleSignInButton(
      {@required this.onPressed,
        this.darkMode = false,
        this.borderRadius = 3.0,
        Key key})
      :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40.0,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.borderRadius),
      ),
      child: RaisedButton(
        onPressed: onPressed,
        color: darkMode ? Color(0xFF4285F4) : Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // The Google design guidelines aren't consistent. The dark mode
            // seems to have a perfect square of white around the logo, with a
            // thin 1dp (ish) border. However, since the height of the button
            // is 40dp and the logo is 18dp, it suggests the bottom and top
            // padding is (40 - 18) * 0.5 = 11. That's 10dp once we account for
            // the thin border.
            //
            // The design guidelines suggest 8dp padding to the left of the
            // logo, which doesn't allow us to center the image (given the 10dp
            // above). Something needs to give - either the 8dp is wrong or the
            // 40dp should be 36dp. I've opted to increase left padding to 10dp.
            Padding(
              padding: const EdgeInsets.all(1.0),
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
                    height: 18.0,
                    width: 18.0,
                  ),
                ),
              ),
            ),

            SizedBox(width: 14.0 /* 24.0 - 10dp padding */),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 14.0, 8.0),
              child: Text(
                Localization.of(context).googleSignin,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  color:
                  darkMode ? Colors.white : Colors.black.withOpacity(0.54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}