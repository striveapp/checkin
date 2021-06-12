import 'package:bloc/bloc.dart';
import 'package:checkin/src/themes/theme.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(AppTheme(
            themeData: WidgetsBinding.instance.window.platformBrightness == Brightness.dark
                ? theme[ThemeType.Dark]
                : theme[ThemeType.Light]));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is UpdateTheme) {
      yield AppTheme(themeData: theme[event.themeType]);
    }
  }
}
