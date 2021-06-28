// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_stats_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStatsEventTearOff {
  const _$UserStatsEventTearOff();

  InitializeUserStats initializeUserStats() {
    return const InitializeUserStats();
  }

  UserStatsUpdated userStatsUpdated(
      {required List<Lesson> attendedLessons, required Timespan timespan}) {
    return UserStatsUpdated(
      attendedLessons: attendedLessons,
      timespan: timespan,
    );
  }
}

/// @nodoc
const $UserStatsEvent = _$UserStatsEventTearOff();

/// @nodoc
mixin _$UserStatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUserStats,
    required TResult Function(List<Lesson> attendedLessons, Timespan timespan)
        userStatsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUserStats,
    TResult Function(List<Lesson> attendedLessons, Timespan timespan)?
        userStatsUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeUserStats value) initializeUserStats,
    required TResult Function(UserStatsUpdated value) userStatsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeUserStats value)? initializeUserStats,
    TResult Function(UserStatsUpdated value)? userStatsUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsEventCopyWith<$Res> {
  factory $UserStatsEventCopyWith(
          UserStatsEvent value, $Res Function(UserStatsEvent) then) =
      _$UserStatsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStatsEventCopyWithImpl<$Res>
    implements $UserStatsEventCopyWith<$Res> {
  _$UserStatsEventCopyWithImpl(this._value, this._then);

  final UserStatsEvent _value;
  // ignore: unused_field
  final $Res Function(UserStatsEvent) _then;
}

/// @nodoc
abstract class $InitializeUserStatsCopyWith<$Res> {
  factory $InitializeUserStatsCopyWith(
          InitializeUserStats value, $Res Function(InitializeUserStats) then) =
      _$InitializeUserStatsCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeUserStatsCopyWithImpl<$Res>
    extends _$UserStatsEventCopyWithImpl<$Res>
    implements $InitializeUserStatsCopyWith<$Res> {
  _$InitializeUserStatsCopyWithImpl(
      InitializeUserStats _value, $Res Function(InitializeUserStats) _then)
      : super(_value, (v) => _then(v as InitializeUserStats));

  @override
  InitializeUserStats get _value => super._value as InitializeUserStats;
}

/// @nodoc

class _$InitializeUserStats
    with DiagnosticableTreeMixin
    implements InitializeUserStats {
  const _$InitializeUserStats();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserStatsEvent.initializeUserStats()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserStatsEvent.initializeUserStats'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeUserStats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUserStats,
    required TResult Function(List<Lesson> attendedLessons, Timespan timespan)
        userStatsUpdated,
  }) {
    return initializeUserStats();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUserStats,
    TResult Function(List<Lesson> attendedLessons, Timespan timespan)?
        userStatsUpdated,
    required TResult orElse(),
  }) {
    if (initializeUserStats != null) {
      return initializeUserStats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeUserStats value) initializeUserStats,
    required TResult Function(UserStatsUpdated value) userStatsUpdated,
  }) {
    return initializeUserStats(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeUserStats value)? initializeUserStats,
    TResult Function(UserStatsUpdated value)? userStatsUpdated,
    required TResult orElse(),
  }) {
    if (initializeUserStats != null) {
      return initializeUserStats(this);
    }
    return orElse();
  }
}

abstract class InitializeUserStats implements UserStatsEvent {
  const factory InitializeUserStats() = _$InitializeUserStats;
}

/// @nodoc
abstract class $UserStatsUpdatedCopyWith<$Res> {
  factory $UserStatsUpdatedCopyWith(
          UserStatsUpdated value, $Res Function(UserStatsUpdated) then) =
      _$UserStatsUpdatedCopyWithImpl<$Res>;
  $Res call({List<Lesson> attendedLessons, Timespan timespan});
}

/// @nodoc
class _$UserStatsUpdatedCopyWithImpl<$Res>
    extends _$UserStatsEventCopyWithImpl<$Res>
    implements $UserStatsUpdatedCopyWith<$Res> {
  _$UserStatsUpdatedCopyWithImpl(
      UserStatsUpdated _value, $Res Function(UserStatsUpdated) _then)
      : super(_value, (v) => _then(v as UserStatsUpdated));

  @override
  UserStatsUpdated get _value => super._value as UserStatsUpdated;

  @override
  $Res call({
    Object? attendedLessons = freezed,
    Object? timespan = freezed,
  }) {
    return _then(UserStatsUpdated(
      attendedLessons: attendedLessons == freezed
          ? _value.attendedLessons
          : attendedLessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      timespan: timespan == freezed
          ? _value.timespan
          : timespan // ignore: cast_nullable_to_non_nullable
              as Timespan,
    ));
  }
}

/// @nodoc

class _$UserStatsUpdated
    with DiagnosticableTreeMixin
    implements UserStatsUpdated {
  const _$UserStatsUpdated(
      {required this.attendedLessons, required this.timespan});

  @override
  final List<Lesson> attendedLessons;
  @override
  final Timespan timespan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserStatsEvent.userStatsUpdated(attendedLessons: $attendedLessons, timespan: $timespan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserStatsEvent.userStatsUpdated'))
      ..add(DiagnosticsProperty('attendedLessons', attendedLessons))
      ..add(DiagnosticsProperty('timespan', timespan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserStatsUpdated &&
            (identical(other.attendedLessons, attendedLessons) ||
                const DeepCollectionEquality()
                    .equals(other.attendedLessons, attendedLessons)) &&
            (identical(other.timespan, timespan) ||
                const DeepCollectionEquality()
                    .equals(other.timespan, timespan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(attendedLessons) ^
      const DeepCollectionEquality().hash(timespan);

  @JsonKey(ignore: true)
  @override
  $UserStatsUpdatedCopyWith<UserStatsUpdated> get copyWith =>
      _$UserStatsUpdatedCopyWithImpl<UserStatsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUserStats,
    required TResult Function(List<Lesson> attendedLessons, Timespan timespan)
        userStatsUpdated,
  }) {
    return userStatsUpdated(attendedLessons, timespan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUserStats,
    TResult Function(List<Lesson> attendedLessons, Timespan timespan)?
        userStatsUpdated,
    required TResult orElse(),
  }) {
    if (userStatsUpdated != null) {
      return userStatsUpdated(attendedLessons, timespan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeUserStats value) initializeUserStats,
    required TResult Function(UserStatsUpdated value) userStatsUpdated,
  }) {
    return userStatsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeUserStats value)? initializeUserStats,
    TResult Function(UserStatsUpdated value)? userStatsUpdated,
    required TResult orElse(),
  }) {
    if (userStatsUpdated != null) {
      return userStatsUpdated(this);
    }
    return orElse();
  }
}

abstract class UserStatsUpdated implements UserStatsEvent {
  const factory UserStatsUpdated(
      {required List<Lesson> attendedLessons,
      required Timespan timespan}) = _$UserStatsUpdated;

  List<Lesson> get attendedLessons => throw _privateConstructorUsedError;
  Timespan get timespan => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatsUpdatedCopyWith<UserStatsUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}
