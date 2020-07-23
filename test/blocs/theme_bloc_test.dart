import 'package:checkin/src/blocs/theme/bloc.dart';
import 'package:checkin/src/themes/theme.dart';
import 'package:test/test.dart';

void main() {
  group("ThemeBloc", () {
    ThemeBloc themeBloc;

    tearDown(() {
      themeBloc?.close();
    });

    group("initial state", () {
      test("initial state is AppTheme", () {
        themeBloc = ThemeBloc();
        expect(themeBloc.initialState, AppTheme(themeData: theme[ThemeType.Light]));
      });
    });

    group("ThemeUpdated", () {
      test("should emits AppTheme and passing the new ThemeType", () {
        themeBloc = ThemeBloc();
        final ThemeType newThemeType = ThemeType.NewLight;
        themeBloc.add(ThemeEvent.themeUpdated(themeType: newThemeType));

        final expectedState = [
          AppTheme(themeData: theme[ThemeType.Light]),
          AppTheme(themeData: theme[newThemeType]),
        ];

        expectLater(
          themeBloc,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}
