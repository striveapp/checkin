import 'package:checkin/src/themes/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.freezed.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  // todo this should be renamed into UpdateBrightness, and if dark logic should be centralized into the bloc
  const factory ThemeEvent.updateTheme({ThemeType? themeType}) = UpdateTheme;
}
