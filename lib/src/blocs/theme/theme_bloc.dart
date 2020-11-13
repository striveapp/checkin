import 'package:bloc/bloc.dart';
import 'package:checkin/src/themes/theme.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(AppTheme(
          themeData: theme[ThemeType.NewLight],
        ));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeUpdated) {
      yield AppTheme(themeData: theme[event.themeType]);
    }
  }
}
