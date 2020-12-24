import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/theme/bloc.dart';
import 'package:checkin/src/themes/theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ThemeBloc", () {

    group("initial state", () {
      ThemeBloc themeBloc;

      setUp(() {
        TestWidgetsFlutterBinding.ensureInitialized();

        themeBloc = ThemeBloc();
      });

      test('is AppTheme', () {
        expect(themeBloc.state, AppTheme(themeData: theme[ThemeType.NewLight]));
      });

      tearDown(() {
        themeBloc?.close();
      });
    });

    group("on ThemeUpdated event", () {
      final ThemeType newThemeType = ThemeType.Dark;

      blocTest(
        "should emit AppTheme setting the new theme",
        build: () => ThemeBloc(),
        act: (bloc) => bloc.add(UpdateTheme(themeType: newThemeType)),
        expect: [AppTheme(themeData: theme[newThemeType])],
      );
    });
  });
}
