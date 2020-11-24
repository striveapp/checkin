// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'theme_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ThemeEventTearOff {
  const _$ThemeEventTearOff();

// ignore: unused_element
  ThemeUpdated themeUpdated({ThemeType themeType}) {
    return ThemeUpdated(
      themeType: themeType,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ThemeEvent = _$ThemeEventTearOff();

/// @nodoc
mixin _$ThemeEvent {
  ThemeType get themeType;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult themeUpdated(ThemeType themeType),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult themeUpdated(ThemeType themeType),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult themeUpdated(ThemeUpdated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult themeUpdated(ThemeUpdated value),
    @required TResult orElse(),
  });

  $ThemeEventCopyWith<ThemeEvent> get copyWith;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res>;
  $Res call({ThemeType themeType});
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res> implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  final ThemeEvent _value;
  // ignore: unused_field
  final $Res Function(ThemeEvent) _then;

  @override
  $Res call({
    Object themeType = freezed,
  }) {
    return _then(_value.copyWith(
      themeType:
          themeType == freezed ? _value.themeType : themeType as ThemeType,
    ));
  }
}

/// @nodoc
abstract class $ThemeUpdatedCopyWith<$Res>
    implements $ThemeEventCopyWith<$Res> {
  factory $ThemeUpdatedCopyWith(
          ThemeUpdated value, $Res Function(ThemeUpdated) then) =
      _$ThemeUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({ThemeType themeType});
}

/// @nodoc
class _$ThemeUpdatedCopyWithImpl<$Res> extends _$ThemeEventCopyWithImpl<$Res>
    implements $ThemeUpdatedCopyWith<$Res> {
  _$ThemeUpdatedCopyWithImpl(
      ThemeUpdated _value, $Res Function(ThemeUpdated) _then)
      : super(_value, (v) => _then(v as ThemeUpdated));

  @override
  ThemeUpdated get _value => super._value as ThemeUpdated;

  @override
  $Res call({
    Object themeType = freezed,
  }) {
    return _then(ThemeUpdated(
      themeType:
          themeType == freezed ? _value.themeType : themeType as ThemeType,
    ));
  }
}

/// @nodoc
class _$ThemeUpdated with DiagnosticableTreeMixin implements ThemeUpdated {
  const _$ThemeUpdated({this.themeType});

  @override
  final ThemeType themeType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeEvent.themeUpdated(themeType: $themeType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeEvent.themeUpdated'))
      ..add(DiagnosticsProperty('themeType', themeType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ThemeUpdated &&
            (identical(other.themeType, themeType) ||
                const DeepCollectionEquality()
                    .equals(other.themeType, themeType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(themeType);

  @override
  $ThemeUpdatedCopyWith<ThemeUpdated> get copyWith =>
      _$ThemeUpdatedCopyWithImpl<ThemeUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult themeUpdated(ThemeType themeType),
  }) {
    assert(themeUpdated != null);
    return themeUpdated(themeType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult themeUpdated(ThemeType themeType),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (themeUpdated != null) {
      return themeUpdated(themeType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult themeUpdated(ThemeUpdated value),
  }) {
    assert(themeUpdated != null);
    return themeUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult themeUpdated(ThemeUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (themeUpdated != null) {
      return themeUpdated(this);
    }
    return orElse();
  }
}

abstract class ThemeUpdated implements ThemeEvent {
  const factory ThemeUpdated({ThemeType themeType}) = _$ThemeUpdated;

  @override
  ThemeType get themeType;
  @override
  $ThemeUpdatedCopyWith<ThemeUpdated> get copyWith;
}
