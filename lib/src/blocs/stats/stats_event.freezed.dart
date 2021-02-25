// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stats_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StatsEventTearOff {
  const _$StatsEventTearOff();

// ignore: unused_element
  TimespanUpdate timespanUpdated({@required Timespan timespan}) {
    return TimespanUpdate(
      timespan: timespan,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StatsEvent = _$StatsEventTearOff();

/// @nodoc
mixin _$StatsEvent {
  Timespan get timespan;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult timespanUpdated(Timespan timespan),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult timespanUpdated(Timespan timespan),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult timespanUpdated(TimespanUpdate value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult timespanUpdated(TimespanUpdate value),
    @required TResult orElse(),
  });

  $StatsEventCopyWith<StatsEvent> get copyWith;
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
    Object timespan = freezed,
  }) {
    return _then(_value.copyWith(
      timespan: timespan == freezed ? _value.timespan : timespan as Timespan,
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
    Object timespan = freezed,
  }) {
    return _then(TimespanUpdate(
      timespan: timespan == freezed ? _value.timespan : timespan as Timespan,
    ));
  }
}

/// @nodoc
class _$TimespanUpdate with DiagnosticableTreeMixin implements TimespanUpdate {
  const _$TimespanUpdate({@required this.timespan}) : assert(timespan != null);

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

  @override
  $TimespanUpdateCopyWith<TimespanUpdate> get copyWith =>
      _$TimespanUpdateCopyWithImpl<TimespanUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult timespanUpdated(Timespan timespan),
  }) {
    assert(timespanUpdated != null);
    return timespanUpdated(timespan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult timespanUpdated(Timespan timespan),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (timespanUpdated != null) {
      return timespanUpdated(timespan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult timespanUpdated(TimespanUpdate value),
  }) {
    assert(timespanUpdated != null);
    return timespanUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult timespanUpdated(TimespanUpdate value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (timespanUpdated != null) {
      return timespanUpdated(this);
    }
    return orElse();
  }
}

abstract class TimespanUpdate implements StatsEvent {
  const factory TimespanUpdate({@required Timespan timespan}) =
      _$TimespanUpdate;

  @override
  Timespan get timespan;
  @override
  $TimespanUpdateCopyWith<TimespanUpdate> get copyWith;
}
