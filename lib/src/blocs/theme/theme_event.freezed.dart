// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'theme_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeEventTearOff {
  const _$ThemeEventTearOff();

  UpdateTheme updateTheme({ThemeType? themeType}) {
    return UpdateTheme(
      themeType: themeType,
    );
  }
}

/// @nodoc
const $ThemeEvent = _$ThemeEventTearOff();

/// @nodoc
mixin _$ThemeEvent {
  ThemeType? get themeType => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeType? themeType) updateTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeType? themeType)? updateTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateTheme value) updateTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateTheme value)? updateTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeEventCopyWith<ThemeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res>;
  $Res call({ThemeType? themeType});
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res> implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  final ThemeEvent _value;
  // ignore: unused_field
  final $Res Function(ThemeEvent) _then;

  @override
  $Res call({
    Object? themeType = freezed,
  }) {
    return _then(_value.copyWith(
      themeType: themeType == freezed
          ? _value.themeType
          : themeType // ignore: cast_nullable_to_non_nullable
              as ThemeType?,
    ));
  }
}

/// @nodoc
abstract class $UpdateThemeCopyWith<$Res> implements $ThemeEventCopyWith<$Res> {
  factory $UpdateThemeCopyWith(
          UpdateTheme value, $Res Function(UpdateTheme) then) =
      _$UpdateThemeCopyWithImpl<$Res>;
  @override
  $Res call({ThemeType? themeType});
}

/// @nodoc
class _$UpdateThemeCopyWithImpl<$Res> extends _$ThemeEventCopyWithImpl<$Res>
    implements $UpdateThemeCopyWith<$Res> {
  _$UpdateThemeCopyWithImpl(
      UpdateTheme _value, $Res Function(UpdateTheme) _then)
      : super(_value, (v) => _then(v as UpdateTheme));

  @override
  UpdateTheme get _value => super._value as UpdateTheme;

  @override
  $Res call({
    Object? themeType = freezed,
  }) {
    return _then(UpdateTheme(
      themeType: themeType == freezed
          ? _value.themeType
          : themeType // ignore: cast_nullable_to_non_nullable
              as ThemeType?,
    ));
  }
}

/// @nodoc

class _$UpdateTheme with DiagnosticableTreeMixin implements UpdateTheme {
  const _$UpdateTheme({this.themeType});

  @override
  final ThemeType? themeType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeEvent.updateTheme(themeType: $themeType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeEvent.updateTheme'))
      ..add(DiagnosticsProperty('themeType', themeType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateTheme &&
            (identical(other.themeType, themeType) ||
                const DeepCollectionEquality()
                    .equals(other.themeType, themeType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(themeType);

  @JsonKey(ignore: true)
  @override
  $UpdateThemeCopyWith<UpdateTheme> get copyWith =>
      _$UpdateThemeCopyWithImpl<UpdateTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeType? themeType) updateTheme,
  }) {
    return updateTheme(themeType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeType? themeType)? updateTheme,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(themeType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateTheme value) updateTheme,
  }) {
    return updateTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateTheme value)? updateTheme,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(this);
    }
    return orElse();
  }
}

abstract class UpdateTheme implements ThemeEvent {
  const factory UpdateTheme({ThemeType? themeType}) = _$UpdateTheme;

  @override
  ThemeType? get themeType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $UpdateThemeCopyWith<UpdateTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
