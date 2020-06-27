import 'package:flutter/material.dart';

enum ThemeType { Dark, Light }

final theme = {
  ThemeType.Dark: ThemeData(
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
    primaryColor: Color(0xFF242966),
    accentColor: Color(0xFF1B3FE3),
    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF5770FF),
        disabledColor: Color(0xFFBBBBBB),
        colorScheme: ColorScheme.dark(error: Color(0xFFEF5350)),
        height: 48,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0))),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 0.25,
      ),
      headline2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        letterSpacing: 0.25,
      ),
      headline3: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
        letterSpacing: 0.25,
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Color(0xFF2F54FC),
        letterSpacing: 0.4,
      ),
      bodyText1: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
        letterSpacing: 0.4,
      ),
      button: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1.25,
      ),
    ),
  ),
  ThemeType.Light: ThemeData(
    fontFamily: 'Raleway',
    primaryColor: Color(0xFF242966),
    accentColor: Color(0xFF1B3FE3),
    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF5770FF),
        disabledColor: Color(0xFFBBBBBB),
        colorScheme: ColorScheme.light(error: Color(0xFFEF5350)),
        height: 48,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0))),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 0.25,
      ),
      headline2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        letterSpacing: 0.25,
      ),
      headline3: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
        letterSpacing: 0.25,
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Color(0xFF2F54FC),
        letterSpacing: 0.4,
      ),
      bodyText1: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
        letterSpacing: 0.4,
      ),
      button: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1.25,
      ),
    ),
  ),
};
