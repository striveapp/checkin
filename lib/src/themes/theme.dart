import 'package:flutter/material.dart';

enum ThemeType { Dark, Light }

final theme = {
  ThemeType.Dark: ThemeData(
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFFF44336),
      secondary: Color(0xFFD32F2F),
      background: Color(0xFF141414),
      error: Color(0xFFEF5350),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
      ),
      headline2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
      ),
      headline3: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      bodyText1: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      button: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1.25,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xFFd32f2f),
      selectionHandleColor: Color(0xFFd32f2f).withOpacity(0.75),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Color(0xFFd32f2f),
          textStyle: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.25,
          )),
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF7C4DFF),
        disabledColor: Color(0xFFBBBBBB),
        colorScheme: ColorScheme.dark(error: Color(0xFFEF5350)),
        height: 48,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: Color(0xFF7C4DFF),
      onSurface: Color(0xFF7C4DFF),
      minimumSize: Size(88, 48),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 0.8,
            color: Color(0xFFD32F2F),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: Color(0xFFD32F2F)),
    ),
    timePickerTheme: TimePickerThemeData(
        dialHandColor: Color(0xFFd32f2f).withOpacity(0.60),
        hourMinuteTextStyle: TextStyle(
          fontSize: 26,
          letterSpacing: 0.25,
          fontWeight: FontWeight.w700,
        ),
        helpTextStyle: TextStyle(
          fontSize: 12.0,
          letterSpacing: 1.25,
          fontWeight: FontWeight.w400,
        ),
        hourMinuteColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Color(0xFFd32f2f).withAlpha(100);
          }
          return ColorScheme.dark().onSurface.withOpacity(0.12);
        }),
        hourMinuteTextColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return Color(0xFFd32f2f);
            }
            return ColorScheme.dark().onSurface;
          },
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF5350), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF44336), width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF5350), width: 2.0),
          ),
        )),
  ),
  ThemeType.Light: ThemeData(
    fontFamily: 'Raleway',
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color(0xFFF44336),
      secondary: Color(0xFFD32F2F),
      background: Color(0xFFEEEEEE),
      error: Color(0xFFEF5350),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
      ),
      headline2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
      ),
      headline3: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      bodyText1: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      button: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1.25,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xFFd32f2f),
      selectionHandleColor: Color(0xFFd32f2f).withOpacity(0.75),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Color(0xFFd32f2f),
          textStyle: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.25,
          )),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF7C4DFF),
      disabledColor: Color(0xFFBBBBBB),
      colorScheme: ColorScheme.dark(error: Color(0xFFEF5350)),
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: Color(0xFF7C4DFF),
      onSurface: Color(0xFF7C4DFF),
      minimumSize: Size(88, 48),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 0.8,
            color: Color(0xFFD32F2F),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: Color(0xFFD32F2F)),
    ),
    timePickerTheme: TimePickerThemeData(
        dialHandColor: Color(0xFFd32f2f).withOpacity(0.60),
        hourMinuteTextStyle: TextStyle(
          fontSize: 26,
          letterSpacing: 0.25,
          fontWeight: FontWeight.w700,
        ),
        helpTextStyle: TextStyle(
          fontSize: 12.0,
          letterSpacing: 1.25,
          fontWeight: FontWeight.w400,
        ),
        hourMinuteColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Color(0xFFd32f2f).withAlpha(100);
          }
          return ColorScheme.light().onSurface.withOpacity(0.12);
        }),
        hourMinuteTextColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return Color(0xFFd32f2f);
            }
            return ColorScheme.light().onSurface;
          },
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF5350), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF44336), width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEF5350), width: 2.0),
          ),
        )),
  ),
};
