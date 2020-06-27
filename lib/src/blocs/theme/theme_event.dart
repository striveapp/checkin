import 'package:checkin/src/themes/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.freezed.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.themeUpdated({ThemeType themeType}) = ThemeUpdated;
}