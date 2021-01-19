import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_config.freezed.dart';
part 'lesson_config.g.dart';

@freezed
abstract class LessonConfig with _$LessonConfig {
  factory LessonConfig({
    final String type,
    final String color,
  }) = _LessonConfig;

  factory LessonConfig.fromJson(Map<String, dynamic> json) => _$LessonConfigFromJson(json);
}
