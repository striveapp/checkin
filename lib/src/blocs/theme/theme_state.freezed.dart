// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  AppTheme appTheme({ThemeData themeData}) {
    return AppTheme(
      themeData: themeData,
    );
  }
}

// ignore: unused_element
const $ThemeState = _$ThemeStateTearOff();

mixin _$ThemeState {
  ThemeData get themeData;

  $ThemeStateCopyWith<ThemeState> get copyWith;
}

abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({ThemeData themeData});
}

class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object themeData = freezed,
  }) {
    return _then(_value.copyWith(
      themeData:
          themeData == freezed ? _value.themeData : themeData as ThemeData,
    ));
  }
}

abstract class $AppThemeCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory $AppThemeCopyWith(AppTheme value, $Res Function(AppTheme) then) =
      _$AppThemeCopyWithImpl<$Res>;
  @override
  $Res call({ThemeData themeData});
}

class _$AppThemeCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements $AppThemeCopyWith<$Res> {
  _$AppThemeCopyWithImpl(AppTheme _value, $Res Function(AppTheme) _then)
      : super(_value, (v) => _then(v as AppTheme));

  @override
  AppTheme get _value => super._value as AppTheme;

  @override
  $Res call({
    Object themeData = freezed,
  }) {
    return _then(AppTheme(
      themeData:
          themeData == freezed ? _value.themeData : themeData as ThemeData,
    ));
  }
}

class _$AppTheme with DiagnosticableTreeMixin implements AppTheme {
  const _$AppTheme({this.themeData});

  @override
  final ThemeData themeData;

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

  @override
  $AppThemeCopyWith<AppTheme> get copyWith =>
      _$AppThemeCopyWithImpl<AppTheme>(this, _$identity);
}

abstract class AppTheme implements ThemeState {
  const factory AppTheme({ThemeData themeData}) = _$AppTheme;

  @override
  ThemeData get themeData;
  @override
  $AppThemeCopyWith<AppTheme> get copyWith;
}
