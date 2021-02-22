import 'package:flutter/material.dart';

enum ThemeType { Dark, NewLight, Light }

final theme = {
  ThemeType.Dark: ThemeData(
    fontFamily: 'Raleway',
    splashColor: Color(0xFFFF0024),
    primaryColor: Color(0xFFF44336),
    accentColor: Color(0xFFD32F2F),
    brightness: Brightness.dark,
    backgroundColor: Color(0xFF141414),
    buttonColor: Color(0xFF7C4DFF),
    errorColor: Color(0xFFEF5350),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xFFd32f2f),
      selectionHandleColor: Color(0xFFd32f2f).withOpacity(0.75),
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
    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF7C4DFF),
        disabledColor: Color(0xFFBBBBBB),
        colorScheme: ColorScheme.dark(error: Color(0xFFEF5350)),
        height: 48,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0))),
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
  ),
  ThemeType.NewLight: ThemeData(
    fontFamily: 'Raleway',
    splashColor: Color(0xFFFF0024),
    primaryColor: Color(0xFFF44336),
    accentColor: Color(0xFFD32F2F),
    backgroundColor: Color(0xFFEEEEEE),
    buttonColor: Color(0xFF7C4DFF),
    errorColor: Color(0xFFEF5350),
    brightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xFFd32f2f),
      selectionHandleColor: Color(0xFFd32f2f).withOpacity(0.75),
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
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF7C4DFF),
      disabledColor: Color(0xFFBBBBBB),
      colorScheme: ColorScheme.dark(error: Color(0xFFEF5350)),
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
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
  ),
  // todo remove light theme
  ThemeType.Light: ThemeData(
    fontFamily: 'Raleway',
    primaryColor: Color(0xFF242966),
    accentColor: Color(0xFF1B3FE3),
    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF5770FF),
        disabledColor: Color(0xFFBBBBBB),
        colorScheme: ColorScheme.light(error: Color(0xFFEF5350)),
        height: 48,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0))),
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
        color: Color(0xFF2F54FC),
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
  ),
};
