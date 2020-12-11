// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lesson_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
LessonConfig _$LessonConfigFromJson(Map<String, dynamic> json) {
  return _LessonConfig.fromJson(json);
}

/// @nodoc
class _$LessonConfigTearOff {
  const _$LessonConfigTearOff();

// ignore: unused_element
  _LessonConfig call({String type, String color}) {
    return _LessonConfig(
      type: type,
      color: color,
    );
  }

// ignore: unused_element
  LessonConfig fromJson(Map<String, Object> json) {
    return LessonConfig.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $LessonConfig = _$LessonConfigTearOff();

/// @nodoc
mixin _$LessonConfig {
  String get type;
  String get color;

  Map<String, dynamic> toJson();
  $LessonConfigCopyWith<LessonConfig> get copyWith;
}

/// @nodoc
abstract class $LessonConfigCopyWith<$Res> {
  factory $LessonConfigCopyWith(
          LessonConfig value, $Res Function(LessonConfig) then) =
      _$LessonConfigCopyWithImpl<$Res>;
  $Res call({String type, String color});
}

/// @nodoc
class _$LessonConfigCopyWithImpl<$Res> implements $LessonConfigCopyWith<$Res> {
  _$LessonConfigCopyWithImpl(this._value, this._then);

  final LessonConfig _value;
  // ignore: unused_field
  final $Res Function(LessonConfig) _then;

  @override
  $Res call({
    Object type = freezed,
    Object color = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as String,
      color: color == freezed ? _value.color : color as String,
    ));
  }
}

/// @nodoc
abstract class _$LessonConfigCopyWith<$Res>
    implements $LessonConfigCopyWith<$Res> {
  factory _$LessonConfigCopyWith(
          _LessonConfig value, $Res Function(_LessonConfig) then) =
      __$LessonConfigCopyWithImpl<$Res>;
  @override
  $Res call({String type, String color});
}

/// @nodoc
class __$LessonConfigCopyWithImpl<$Res> extends _$LessonConfigCopyWithImpl<$Res>
    implements _$LessonConfigCopyWith<$Res> {
  __$LessonConfigCopyWithImpl(
      _LessonConfig _value, $Res Function(_LessonConfig) _then)
      : super(_value, (v) => _then(v as _LessonConfig));

  @override
  _LessonConfig get _value => super._value as _LessonConfig;

  @override
  $Res call({
    Object type = freezed,
    Object color = freezed,
  }) {
    return _then(_LessonConfig(
      type: type == freezed ? _value.type : type as String,
      color: color == freezed ? _value.color : color as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LessonConfig implements _LessonConfig {
  _$_LessonConfig({this.type, this.color});

  factory _$_LessonConfig.fromJson(Map<String, dynamic> json) =>
      _$_$_LessonConfigFromJson(json);

  @override
  final String type;
  @override
  final String color;

  @override
  String toString() {
    return 'LessonConfig(type: $type, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LessonConfig &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(color);

  @override
  _$LessonConfigCopyWith<_LessonConfig> get copyWith =>
      __$LessonConfigCopyWithImpl<_LessonConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LessonConfigToJson(this);
  }
}

abstract class _LessonConfig implements LessonConfig {
  factory _LessonConfig({String type, String color}) = _$_LessonConfig;

  factory _LessonConfig.fromJson(Map<String, dynamic> json) =
      _$_LessonConfig.fromJson;

  @override
  String get type;
  @override
  String get color;
  @override
  _$LessonConfigCopyWith<_LessonConfig> get copyWith;
}
