import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:checkin/src/themes/theme.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState.appTheme(themeData: theme[ThemeType.Light]);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeUpdated) {
      yield ThemeState.appTheme(themeData: theme[event.themeType]);
    }
  }
}
