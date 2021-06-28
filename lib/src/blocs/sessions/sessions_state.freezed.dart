// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sessions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SessionsStateTearOff {
  const _$SessionsStateTearOff();

  InitialSessionsState initialSessionsState() {
    return const InitialSessionsState();
  }

  SessionsUnlimited sessionsUnlimited() {
    return const SessionsUnlimited();
  }

  SessionsLoaded sessionsLoaded(
      {required double totalLessonsOfPlan, required double attendedLessons}) {
    return SessionsLoaded(
      totalLessonsOfPlan: totalLessonsOfPlan,
      attendedLessons: attendedLessons,
    );
  }

  SessionsWarning sessionsWarning(
      {required double totalLessonsOfPlan, required double attendedLessons}) {
    return SessionsWarning(
      totalLessonsOfPlan: totalLessonsOfPlan,
      attendedLessons: attendedLessons,
    );
  }
}

/// @nodoc
const $SessionsState = _$SessionsStateTearOff();

/// @nodoc
mixin _$SessionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialSessionsState,
    required TResult Function() sessionsUnlimited,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsLoaded,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsWarning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialSessionsState,
    TResult Function()? sessionsUnlimited,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsLoaded,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsWarning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSessionsState value) initialSessionsState,
    required TResult Function(SessionsUnlimited value) sessionsUnlimited,
    required TResult Function(SessionsLoaded value) sessionsLoaded,
    required TResult Function(SessionsWarning value) sessionsWarning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSessionsState value)? initialSessionsState,
    TResult Function(SessionsUnlimited value)? sessionsUnlimited,
    TResult Function(SessionsLoaded value)? sessionsLoaded,
    TResult Function(SessionsWarning value)? sessionsWarning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsStateCopyWith<$Res> {
  factory $SessionsStateCopyWith(
          SessionsState value, $Res Function(SessionsState) then) =
      _$SessionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SessionsStateCopyWithImpl<$Res>
    implements $SessionsStateCopyWith<$Res> {
  _$SessionsStateCopyWithImpl(this._value, this._then);

  final SessionsState _value;
  // ignore: unused_field
  final $Res Function(SessionsState) _then;
}

/// @nodoc
abstract class $InitialSessionsStateCopyWith<$Res> {
  factory $InitialSessionsStateCopyWith(InitialSessionsState value,
          $Res Function(InitialSessionsState) then) =
      _$InitialSessionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialSessionsStateCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res>
    implements $InitialSessionsStateCopyWith<$Res> {
  _$InitialSessionsStateCopyWithImpl(
      InitialSessionsState _value, $Res Function(InitialSessionsState) _then)
      : super(_value, (v) => _then(v as InitialSessionsState));

  @override
  InitialSessionsState get _value => super._value as InitialSessionsState;
}

/// @nodoc

class _$InitialSessionsState
    with DiagnosticableTreeMixin
    implements InitialSessionsState {
  const _$InitialSessionsState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsState.initialSessionsState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsState.initialSessionsState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialSessionsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialSessionsState,
    required TResult Function() sessionsUnlimited,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsLoaded,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsWarning,
  }) {
    return initialSessionsState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialSessionsState,
    TResult Function()? sessionsUnlimited,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsLoaded,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsWarning,
    required TResult orElse(),
  }) {
    if (initialSessionsState != null) {
      return initialSessionsState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSessionsState value) initialSessionsState,
    required TResult Function(SessionsUnlimited value) sessionsUnlimited,
    required TResult Function(SessionsLoaded value) sessionsLoaded,
    required TResult Function(SessionsWarning value) sessionsWarning,
  }) {
    return initialSessionsState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSessionsState value)? initialSessionsState,
    TResult Function(SessionsUnlimited value)? sessionsUnlimited,
    TResult Function(SessionsLoaded value)? sessionsLoaded,
    TResult Function(SessionsWarning value)? sessionsWarning,
    required TResult orElse(),
  }) {
    if (initialSessionsState != null) {
      return initialSessionsState(this);
    }
    return orElse();
  }
}

abstract class InitialSessionsState implements SessionsState {
  const factory InitialSessionsState() = _$InitialSessionsState;
}

/// @nodoc
abstract class $SessionsUnlimitedCopyWith<$Res> {
  factory $SessionsUnlimitedCopyWith(
          SessionsUnlimited value, $Res Function(SessionsUnlimited) then) =
      _$SessionsUnlimitedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SessionsUnlimitedCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res>
    implements $SessionsUnlimitedCopyWith<$Res> {
  _$SessionsUnlimitedCopyWithImpl(
      SessionsUnlimited _value, $Res Function(SessionsUnlimited) _then)
      : super(_value, (v) => _then(v as SessionsUnlimited));

  @override
  SessionsUnlimited get _value => super._value as SessionsUnlimited;
}

/// @nodoc

class _$SessionsUnlimited
    with DiagnosticableTreeMixin
    implements SessionsUnlimited {
  const _$SessionsUnlimited();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsState.sessionsUnlimited()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsState.sessionsUnlimited'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SessionsUnlimited);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialSessionsState,
    required TResult Function() sessionsUnlimited,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsLoaded,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsWarning,
  }) {
    return sessionsUnlimited();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialSessionsState,
    TResult Function()? sessionsUnlimited,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsLoaded,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsWarning,
    required TResult orElse(),
  }) {
    if (sessionsUnlimited != null) {
      return sessionsUnlimited();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSessionsState value) initialSessionsState,
    required TResult Function(SessionsUnlimited value) sessionsUnlimited,
    required TResult Function(SessionsLoaded value) sessionsLoaded,
    required TResult Function(SessionsWarning value) sessionsWarning,
  }) {
    return sessionsUnlimited(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSessionsState value)? initialSessionsState,
    TResult Function(SessionsUnlimited value)? sessionsUnlimited,
    TResult Function(SessionsLoaded value)? sessionsLoaded,
    TResult Function(SessionsWarning value)? sessionsWarning,
    required TResult orElse(),
  }) {
    if (sessionsUnlimited != null) {
      return sessionsUnlimited(this);
    }
    return orElse();
  }
}

abstract class SessionsUnlimited implements SessionsState {
  const factory SessionsUnlimited() = _$SessionsUnlimited;
}

/// @nodoc
abstract class $SessionsLoadedCopyWith<$Res> {
  factory $SessionsLoadedCopyWith(
          SessionsLoaded value, $Res Function(SessionsLoaded) then) =
      _$SessionsLoadedCopyWithImpl<$Res>;
  $Res call({double totalLessonsOfPlan, double attendedLessons});
}

/// @nodoc
class _$SessionsLoadedCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res>
    implements $SessionsLoadedCopyWith<$Res> {
  _$SessionsLoadedCopyWithImpl(
      SessionsLoaded _value, $Res Function(SessionsLoaded) _then)
      : super(_value, (v) => _then(v as SessionsLoaded));

  @override
  SessionsLoaded get _value => super._value as SessionsLoaded;

  @override
  $Res call({
    Object? totalLessonsOfPlan = freezed,
    Object? attendedLessons = freezed,
  }) {
    return _then(SessionsLoaded(
      totalLessonsOfPlan: totalLessonsOfPlan == freezed
          ? _value.totalLessonsOfPlan
          : totalLessonsOfPlan // ignore: cast_nullable_to_non_nullable
              as double,
      attendedLessons: attendedLessons == freezed
          ? _value.attendedLessons
          : attendedLessons // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SessionsLoaded with DiagnosticableTreeMixin implements SessionsLoaded {
  const _$SessionsLoaded(
      {required this.totalLessonsOfPlan, required this.attendedLessons});

  @override
  final double totalLessonsOfPlan;
  @override
  final double attendedLessons;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsState.sessionsLoaded(totalLessonsOfPlan: $totalLessonsOfPlan, attendedLessons: $attendedLessons)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsState.sessionsLoaded'))
      ..add(DiagnosticsProperty('totalLessonsOfPlan', totalLessonsOfPlan))
      ..add(DiagnosticsProperty('attendedLessons', attendedLessons));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionsLoaded &&
            (identical(other.totalLessonsOfPlan, totalLessonsOfPlan) ||
                const DeepCollectionEquality()
                    .equals(other.totalLessonsOfPlan, totalLessonsOfPlan)) &&
            (identical(other.attendedLessons, attendedLessons) ||
                const DeepCollectionEquality()
                    .equals(other.attendedLessons, attendedLessons)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalLessonsOfPlan) ^
      const DeepCollectionEquality().hash(attendedLessons);

  @JsonKey(ignore: true)
  @override
  $SessionsLoadedCopyWith<SessionsLoaded> get copyWith =>
      _$SessionsLoadedCopyWithImpl<SessionsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialSessionsState,
    required TResult Function() sessionsUnlimited,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsLoaded,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsWarning,
  }) {
    return sessionsLoaded(totalLessonsOfPlan, attendedLessons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialSessionsState,
    TResult Function()? sessionsUnlimited,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsLoaded,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsWarning,
    required TResult orElse(),
  }) {
    if (sessionsLoaded != null) {
      return sessionsLoaded(totalLessonsOfPlan, attendedLessons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSessionsState value) initialSessionsState,
    required TResult Function(SessionsUnlimited value) sessionsUnlimited,
    required TResult Function(SessionsLoaded value) sessionsLoaded,
    required TResult Function(SessionsWarning value) sessionsWarning,
  }) {
    return sessionsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSessionsState value)? initialSessionsState,
    TResult Function(SessionsUnlimited value)? sessionsUnlimited,
    TResult Function(SessionsLoaded value)? sessionsLoaded,
    TResult Function(SessionsWarning value)? sessionsWarning,
    required TResult orElse(),
  }) {
    if (sessionsLoaded != null) {
      return sessionsLoaded(this);
    }
    return orElse();
  }
}

abstract class SessionsLoaded implements SessionsState {
  const factory SessionsLoaded(
      {required double totalLessonsOfPlan,
      required double attendedLessons}) = _$SessionsLoaded;

  double get totalLessonsOfPlan => throw _privateConstructorUsedError;
  double get attendedLessons => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionsLoadedCopyWith<SessionsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsWarningCopyWith<$Res> {
  factory $SessionsWarningCopyWith(
          SessionsWarning value, $Res Function(SessionsWarning) then) =
      _$SessionsWarningCopyWithImpl<$Res>;
  $Res call({double totalLessonsOfPlan, double attendedLessons});
}

/// @nodoc
class _$SessionsWarningCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res>
    implements $SessionsWarningCopyWith<$Res> {
  _$SessionsWarningCopyWithImpl(
      SessionsWarning _value, $Res Function(SessionsWarning) _then)
      : super(_value, (v) => _then(v as SessionsWarning));

  @override
  SessionsWarning get _value => super._value as SessionsWarning;

  @override
  $Res call({
    Object? totalLessonsOfPlan = freezed,
    Object? attendedLessons = freezed,
  }) {
    return _then(SessionsWarning(
      totalLessonsOfPlan: totalLessonsOfPlan == freezed
          ? _value.totalLessonsOfPlan
          : totalLessonsOfPlan // ignore: cast_nullable_to_non_nullable
              as double,
      attendedLessons: attendedLessons == freezed
          ? _value.attendedLessons
          : attendedLessons // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SessionsWarning
    with DiagnosticableTreeMixin
    implements SessionsWarning {
  const _$SessionsWarning(
      {required this.totalLessonsOfPlan, required this.attendedLessons});

  @override
  final double totalLessonsOfPlan;
  @override
  final double attendedLessons;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsState.sessionsWarning(totalLessonsOfPlan: $totalLessonsOfPlan, attendedLessons: $attendedLessons)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsState.sessionsWarning'))
      ..add(DiagnosticsProperty('totalLessonsOfPlan', totalLessonsOfPlan))
      ..add(DiagnosticsProperty('attendedLessons', attendedLessons));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionsWarning &&
            (identical(other.totalLessonsOfPlan, totalLessonsOfPlan) ||
                const DeepCollectionEquality()
                    .equals(other.totalLessonsOfPlan, totalLessonsOfPlan)) &&
            (identical(other.attendedLessons, attendedLessons) ||
                const DeepCollectionEquality()
                    .equals(other.attendedLessons, attendedLessons)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalLessonsOfPlan) ^
      const DeepCollectionEquality().hash(attendedLessons);

  @JsonKey(ignore: true)
  @override
  $SessionsWarningCopyWith<SessionsWarning> get copyWith =>
      _$SessionsWarningCopyWithImpl<SessionsWarning>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialSessionsState,
    required TResult Function() sessionsUnlimited,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsLoaded,
    required TResult Function(double totalLessonsOfPlan, double attendedLessons)
        sessionsWarning,
  }) {
    return sessionsWarning(totalLessonsOfPlan, attendedLessons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialSessionsState,
    TResult Function()? sessionsUnlimited,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsLoaded,
    TResult Function(double totalLessonsOfPlan, double attendedLessons)?
        sessionsWarning,
    required TResult orElse(),
  }) {
    if (sessionsWarning != null) {
      return sessionsWarning(totalLessonsOfPlan, attendedLessons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSessionsState value) initialSessionsState,
    required TResult Function(SessionsUnlimited value) sessionsUnlimited,
    required TResult Function(SessionsLoaded value) sessionsLoaded,
    required TResult Function(SessionsWarning value) sessionsWarning,
  }) {
    return sessionsWarning(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSessionsState value)? initialSessionsState,
    TResult Function(SessionsUnlimited value)? sessionsUnlimited,
    TResult Function(SessionsLoaded value)? sessionsLoaded,
    TResult Function(SessionsWarning value)? sessionsWarning,
    required TResult orElse(),
  }) {
    if (sessionsWarning != null) {
      return sessionsWarning(this);
    }
    return orElse();
  }
}

abstract class SessionsWarning implements SessionsState {
  const factory SessionsWarning(
      {required double totalLessonsOfPlan,
      required double attendedLessons}) = _$SessionsWarning;

  double get totalLessonsOfPlan => throw _privateConstructorUsedError;
  double get attendedLessons => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionsWarningCopyWith<SessionsWarning> get copyWith =>
      throw _privateConstructorUsedError;
}
