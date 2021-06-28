// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  AppTheme appTheme({ThemeData? themeData}) {
    return AppTheme(
      themeData: themeData,
    );
  }
}

/// @nodoc
const $ThemeState = _$ThemeStateTearOff();

/// @nodoc
mixin _$ThemeState {
  ThemeData? get themeData => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData? themeData) appTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData? themeData)? appTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppTheme value) appTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppTheme value)? appTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({ThemeData? themeData});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object? themeData = freezed,
  }) {
    return _then(_value.copyWith(
      themeData: themeData == freezed
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
    ));
  }
}

/// @nodoc
abstract class $AppThemeCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory $AppThemeCopyWith(AppTheme value, $Res Function(AppTheme) then) =
      _$AppThemeCopyWithImpl<$Res>;
  @override
  $Res call({ThemeData? themeData});
}

/// @nodoc
class _$AppThemeCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements $AppThemeCopyWith<$Res> {
  _$AppThemeCopyWithImpl(AppTheme _value, $Res Function(AppTheme) _then)
      : super(_value, (v) => _then(v as AppTheme));

  @override
  AppTheme get _value => super._value as AppTheme;

  @override
  $Res call({
    Object? themeData = freezed,
  }) {
    return _then(AppTheme(
      themeData: themeData == freezed
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
    ));
  }
}

/// @nodoc

class _$AppTheme with DiagnosticableTreeMixin implements AppTheme {
  const _$AppTheme({this.themeData});

  @override
  final ThemeData? themeData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState.appTheme(themeData: $themeData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeState.appTheme'))
      ..add(DiagnosticsProperty('themeData', themeData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppTheme &&
            (identical(other.themeData, themeData) ||
                const DeepCollectionEquality()
                    .equals(other.themeData, themeData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(themeData);

  @JsonKey(ignore: true)
  @override
  $AppThemeCopyWith<AppTheme> get copyWith =>
      _$AppThemeCopyWithImpl<AppTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData? themeData) appTheme,
  }) {
    return appTheme(themeData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData? themeData)? appTheme,
    required TResult orElse(),
  }) {
    if (appTheme != null) {
      return appTheme(themeData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppTheme value) appTheme,
  }) {
    return appTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppTheme value)? appTheme,
    required TResult orElse(),
  }) {
    if (appTheme != null) {
      return appTheme(this);
    }
    return orElse();
  }
}

abstract class AppTheme implements ThemeState {
  const factory AppTheme({ThemeData? themeData}) = _$AppTheme;

  @override
  ThemeData? get themeData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $AppThemeCopyWith<AppTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
