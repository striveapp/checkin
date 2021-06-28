// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatsStateTearOff {
  const _$StatsStateTearOff();

  InitialStatsState initialStatsState() {
    return const InitialStatsState();
  }

  TimespanUpdated timespanUpdated({required Timespan timespan}) {
    return TimespanUpdated(
      timespan: timespan,
    );
  }
}

/// @nodoc
const $StatsState = _$StatsStateTearOff();

/// @nodoc
mixin _$StatsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialStatsState,
    required TResult Function(Timespan timespan) timespanUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialStatsState,
    TResult Function(Timespan timespan)? timespanUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatsState value) initialStatsState,
    required TResult Function(TimespanUpdated value) timespanUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatsState value)? initialStatsState,
    TResult Function(TimespanUpdated value)? timespanUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsStateCopyWith<$Res> {
  factory $StatsStateCopyWith(
          StatsState value, $Res Function(StatsState) then) =
      _$StatsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$StatsStateCopyWithImpl<$Res> implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._value, this._then);

  final StatsState _value;
  // ignore: unused_field
  final $Res Function(StatsState) _then;
}

/// @nodoc
abstract class $InitialStatsStateCopyWith<$Res> {
  factory $InitialStatsStateCopyWith(
          InitialStatsState value, $Res Function(InitialStatsState) then) =
      _$InitialStatsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialStatsStateCopyWithImpl<$Res>
    extends _$StatsStateCopyWithImpl<$Res>
    implements $InitialStatsStateCopyWith<$Res> {
  _$InitialStatsStateCopyWithImpl(
      InitialStatsState _value, $Res Function(InitialStatsState) _then)
      : super(_value, (v) => _then(v as InitialStatsState));

  @override
  InitialStatsState get _value => super._value as InitialStatsState;
}

/// @nodoc

class _$InitialStatsState
    with DiagnosticableTreeMixin
    implements InitialStatsState {
  const _$InitialStatsState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatsState.initialStatsState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatsState.initialStatsState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialStatsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialStatsState,
    required TResult Function(Timespan timespan) timespanUpdated,
  }) {
    return initialStatsState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialStatsState,
    TResult Function(Timespan timespan)? timespanUpdated,
    required TResult orElse(),
  }) {
    if (initialStatsState != null) {
      return initialStatsState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatsState value) initialStatsState,
    required TResult Function(TimespanUpdated value) timespanUpdated,
  }) {
    return initialStatsState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatsState value)? initialStatsState,
    TResult Function(TimespanUpdated value)? timespanUpdated,
    required TResult orElse(),
  }) {
    if (initialStatsState != null) {
      return initialStatsState(this);
    }
    return orElse();
  }
}

abstract class InitialStatsState implements StatsState {
  const factory InitialStatsState() = _$InitialStatsState;
}

/// @nodoc
abstract class $TimespanUpdatedCopyWith<$Res> {
  factory $TimespanUpdatedCopyWith(
          TimespanUpdated value, $Res Function(TimespanUpdated) then) =
      _$TimespanUpdatedCopyWithImpl<$Res>;
  $Res call({Timespan timespan});
}

/// @nodoc
class _$TimespanUpdatedCopyWithImpl<$Res> extends _$StatsStateCopyWithImpl<$Res>
    implements $TimespanUpdatedCopyWith<$Res> {
  _$TimespanUpdatedCopyWithImpl(
      TimespanUpdated _value, $Res Function(TimespanUpdated) _then)
      : super(_value, (v) => _then(v as TimespanUpdated));

  @override
  TimespanUpdated get _value => super._value as TimespanUpdated;

  @override
  $Res call({
    Object? timespan = freezed,
  }) {
    return _then(TimespanUpdated(
      timespan: timespan == freezed
          ? _value.timespan
          : timespan // ignore: cast_nullable_to_non_nullable
              as Timespan,
    ));
  }
}

/// @nodoc

class _$TimespanUpdated
    with DiagnosticableTreeMixin
    implements TimespanUpdated {
  const _$TimespanUpdated({required this.timespan});

  @override
  final Timespan timespan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatsState.timespanUpdated(timespan: $timespan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatsState.timespanUpdated'))
      ..add(DiagnosticsProperty('timespan', timespan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TimespanUpdated &&
            (identical(other.timespan, timespan) ||
                const DeepCollectionEquality()
                    .equals(other.timespan, timespan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(timespan);

  @JsonKey(ignore: true)
  @override
  $TimespanUpdatedCopyWith<TimespanUpdated> get copyWith =>
      _$TimespanUpdatedCopyWithImpl<TimespanUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialStatsState,
    required TResult Function(Timespan timespan) timespanUpdated,
  }) {
    return timespanUpdated(timespan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialStatsState,
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
    required TResult Function(InitialStatsState value) initialStatsState,
    required TResult Function(TimespanUpdated value) timespanUpdated,
  }) {
    return timespanUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatsState value)? initialStatsState,
    TResult Function(TimespanUpdated value)? timespanUpdated,
    required TResult orElse(),
  }) {
    if (timespanUpdated != null) {
      return timespanUpdated(this);
    }
    return orElse();
  }
}

abstract class TimespanUpdated implements StatsState {
  const factory TimespanUpdated({required Timespan timespan}) =
      _$TimespanUpdated;

  Timespan get timespan => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimespanUpdatedCopyWith<TimespanUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}
