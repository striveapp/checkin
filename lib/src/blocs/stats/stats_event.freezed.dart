// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stats_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatsEventTearOff {
  const _$StatsEventTearOff();

  TimespanUpdate timespanUpdated({required Timespan timespan}) {
    return TimespanUpdate(
      timespan: timespan,
    );
  }
}

/// @nodoc
const $StatsEvent = _$StatsEventTearOff();

/// @nodoc
mixin _$StatsEvent {
  Timespan get timespan => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Timespan timespan) timespanUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Timespan timespan)? timespanUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimespanUpdate value) timespanUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimespanUpdate value)? timespanUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatsEventCopyWith<StatsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsEventCopyWith<$Res> {
  factory $StatsEventCopyWith(
          StatsEvent value, $Res Function(StatsEvent) then) =
      _$StatsEventCopyWithImpl<$Res>;
  $Res call({Timespan timespan});
}

/// @nodoc
class _$StatsEventCopyWithImpl<$Res> implements $StatsEventCopyWith<$Res> {
  _$StatsEventCopyWithImpl(this._value, this._then);

  final StatsEvent _value;
  // ignore: unused_field
  final $Res Function(StatsEvent) _then;

  @override
  $Res call({
    Object? timespan = freezed,
  }) {
    return _then(_value.copyWith(
      timespan: timespan == freezed
          ? _value.timespan
          : timespan // ignore: cast_nullable_to_non_nullable
              as Timespan,
    ));
  }
}

/// @nodoc
abstract class $TimespanUpdateCopyWith<$Res>
    implements $StatsEventCopyWith<$Res> {
  factory $TimespanUpdateCopyWith(
          TimespanUpdate value, $Res Function(TimespanUpdate) then) =
      _$TimespanUpdateCopyWithImpl<$Res>;
  @override
  $Res call({Timespan timespan});
}

/// @nodoc
class _$TimespanUpdateCopyWithImpl<$Res> extends _$StatsEventCopyWithImpl<$Res>
    implements $TimespanUpdateCopyWith<$Res> {
  _$TimespanUpdateCopyWithImpl(
      TimespanUpdate _value, $Res Function(TimespanUpdate) _then)
      : super(_value, (v) => _then(v as TimespanUpdate));

  @override
  TimespanUpdate get _value => super._value as TimespanUpdate;

  @override
  $Res call({
    Object? timespan = freezed,
  }) {
    return _then(TimespanUpdate(
      timespan: timespan == freezed
          ? _value.timespan
          : timespan // ignore: cast_nullable_to_non_nullable
              as Timespan,
    ));
  }
}

/// @nodoc

class _$TimespanUpdate with DiagnosticableTreeMixin implements TimespanUpdate {
  const _$TimespanUpdate({required this.timespan});

  @override
  final Timespan timespan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatsEvent.timespanUpdated(timespan: $timespan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatsEvent.timespanUpdated'))
      ..add(DiagnosticsProperty('timespan', timespan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TimespanUpdate &&
            (identical(other.timespan, timespan) ||
                const DeepCollectionEquality()
                    .equals(other.timespan, timespan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(timespan);

  @JsonKey(ignore: true)
  @override
  $TimespanUpdateCopyWith<TimespanUpdate> get copyWith =>
      _$TimespanUpdateCopyWithImpl<TimespanUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Timespan timespan) timespanUpdated,
  }) {
    return timespanUpdated(timespan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Timespan timespan)? timespanUpdated,
    required TResult orElse(),
  }) {
    if (timespanUpdated != null) {
      return timespanUpdated(timespan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimespanUpdate value) timespanUpdated,
  }) {
    return timespanUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimespanUpdate value)? timespanUpdated,
    required TResult orElse(),
  }) {
    if (timespanUpdated != null) {
      return timespanUpdated(this);
    }
    return orElse();
  }
}

abstract class TimespanUpdate implements StatsEvent {
  const factory TimespanUpdate({required Timespan timespan}) = _$TimespanUpdate;

  @override
  Timespan get timespan => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $TimespanUpdateCopyWith<TimespanUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
