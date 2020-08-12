import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:checkin/src/themes/theme.dart';
import 'package:flutter/scheduler.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    var brightness = SchedulerBinding.instance?.window?.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    if (darkModeOn) {
      return ThemeState.appTheme(themeData: theme[ThemeType.Dark]);
    }

    return ThemeState.appTheme(themeData: theme[ThemeType.NewLight]);
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeUpdated) {
      yield ThemeState.appTheme(themeData: theme[event.themeType]);
    }
  }
}
