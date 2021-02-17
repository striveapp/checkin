// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserStatsStateTearOff {
  const _$UserStatsStateTearOff();

// ignore: unused_element
  UserStatsUninitialized userStatsUninitialized() {
    return const UserStatsUninitialized();
  }

// ignore: unused_element
  UserStatsLoaded userStatsLoaded(
      {@required List<Lesson> attendedLessons, @required Timespan timespan}) {
    return UserStatsLoaded(
      attendedLessons: attendedLessons,
      timespan: timespan,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserStatsState = _$UserStatsStateTearOff();

/// @nodoc
mixin _$UserStatsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult userStatsUninitialized(),
    @required TResult userStatsLoaded(List<Lesson> attendedLessons, Timespan timespan),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult userStatsUninitialized(),
    TResult userStatsLoaded(List<Lesson> attendedLessons, Timespan timespan),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult userStatsUninitialized(UserStatsUninitialized value),
    @required TResult userStatsLoaded(UserStatsLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult userStatsUninitialized(UserStatsUninitialized value),
    TResult userStatsLoaded(UserStatsLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $UserStatsStateCopyWith<$Res> {
  factory $UserStatsStateCopyWith(UserStatsState value, $Res Function(UserStatsState) then) =
      _$UserStatsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStatsStateCopyWithImpl<$Res> implements $UserStatsStateCopyWith<$Res> {
  _$UserStatsStateCopyWithImpl(this._value, this._then);

  final UserStatsState _value;
  // ignore: unused_field
  final $Res Function(UserStatsState) _then;
}

/// @nodoc
abstract class $UserStatsUninitializedCopyWith<$Res> {
  factory $UserStatsUninitializedCopyWith(
          UserStatsUninitialized value, $Res Function(UserStatsUninitialized) then) =
      _$UserStatsUninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStatsUninitializedCopyWithImpl<$Res> extends _$UserStatsStateCopyWithImpl<$Res>
    implements $UserStatsUninitializedCopyWith<$Res> {
  _$UserStatsUninitializedCopyWithImpl(
      UserStatsUninitialized _value, $Res Function(UserStatsUninitialized) _then)
      : super(_value, (v) => _then(v as UserStatsUninitialized));

  @override
  UserStatsUninitialized get _value => super._value as UserStatsUninitialized;
}

/// @nodoc
class _$UserStatsUninitialized with DiagnosticableTreeMixin implements UserStatsUninitialized {
  const _$UserStatsUninitialized();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserStatsState.userStatsUninitialized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserStatsState.userStatsUninitialized'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserStatsUninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult userStatsUninitialized(),
    @required TResult userStatsLoaded(List<Lesson> attendedLessons, Timespan timespan),
  }) {
    assert(userStatsUninitialized != null);
    assert(userStatsLoaded != null);
    return userStatsUninitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult userStatsUninitialized(),
    TResult userStatsLoaded(List<Lesson> attendedLessons, Timespan timespan),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (userStatsUninitialized != null) {
      return userStatsUninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult userStatsUninitialized(UserStatsUninitialized value),
    @required TResult userStatsLoaded(UserStatsLoaded value),
  }) {
    assert(userStatsUninitialized != null);
    assert(userStatsLoaded != null);
    return userStatsUninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult userStatsUninitialized(UserStatsUninitialized value),
    TResult userStatsLoaded(UserStatsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (userStatsUninitialized != null) {
      return userStatsUninitialized(this);
    }
    return orElse();
  }
}

abstract class UserStatsUninitialized implements UserStatsState {
  const factory UserStatsUninitialized() = _$UserStatsUninitialized;
}

/// @nodoc
abstract class $UserStatsLoadedCopyWith<$Res> {
  factory $UserStatsLoadedCopyWith(UserStatsLoaded value, $Res Function(UserStatsLoaded) then) =
      _$UserStatsLoadedCopyWithImpl<$Res>;
  $Res call({List<Lesson> attendedLessons, Timespan timespan});
}

/// @nodoc
class _$UserStatsLoadedCopyWithImpl<$Res> extends _$UserStatsStateCopyWithImpl<$Res>
    implements $UserStatsLoadedCopyWith<$Res> {
  _$UserStatsLoadedCopyWithImpl(UserStatsLoaded _value, $Res Function(UserStatsLoaded) _then)
      : super(_value, (v) => _then(v as UserStatsLoaded));

  @override
  UserStatsLoaded get _value => super._value as UserStatsLoaded;

  @override
  $Res call({
    Object attendedLessons = freezed,
    Object timespan = freezed,
  }) {
    return _then(UserStatsLoaded(
      attendedLessons:
          attendedLessons == freezed ? _value.attendedLessons : attendedLessons as List<Lesson>,
      timespan: timespan == freezed ? _value.timespan : timespan as Timespan,
    ));
  }
}

/// @nodoc
class _$UserStatsLoaded with DiagnosticableTreeMixin implements UserStatsLoaded {
  const _$UserStatsLoaded({@required this.attendedLessons, @required this.timespan})
      : assert(attendedLessons != null),
        assert(timespan != null);

  @override
  final List<Lesson> attendedLessons;
  @override
  final Timespan timespan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserStatsState.userStatsLoaded(attendedLessons: $attendedLessons, timespan: $timespan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserStatsState.userStatsLoaded'))
      ..add(DiagnosticsProperty('attendedLessons', attendedLessons))
      ..add(DiagnosticsProperty('timespan', timespan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserStatsLoaded &&
            (identical(other.attendedLessons, attendedLessons) ||
                const DeepCollectionEquality().equals(other.attendedLessons, attendedLessons)) &&
            (identical(other.timespan, timespan) ||
                const DeepCollectionEquality().equals(other.timespan, timespan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(attendedLessons) ^
      const DeepCollectionEquality().hash(timespan);

  @override
  $UserStatsLoadedCopyWith<UserStatsLoaded> get copyWith =>
      _$UserStatsLoadedCopyWithImpl<UserStatsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult userStatsUninitialized(),
    @required TResult userStatsLoaded(List<Lesson> attendedLessons, Timespan timespan),
  }) {
    assert(userStatsUninitialized != null);
    assert(userStatsLoaded != null);
    return userStatsLoaded(attendedLessons, timespan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult userStatsUninitialized(),
    TResult userStatsLoaded(List<Lesson> attendedLessons, Timespan timespan),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (userStatsLoaded != null) {
      return userStatsLoaded(attendedLessons, timespan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult userStatsUninitialized(UserStatsUninitialized value),
    @required TResult userStatsLoaded(UserStatsLoaded value),
  }) {
    assert(userStatsUninitialized != null);
    assert(userStatsLoaded != null);
    return userStatsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult userStatsUninitialized(UserStatsUninitialized value),
    TResult userStatsLoaded(UserStatsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (userStatsLoaded != null) {
      return userStatsLoaded(this);
    }
    return orElse();
  }
}

abstract class UserStatsLoaded implements UserStatsState {
  const factory UserStatsLoaded(
      {@required List<Lesson> attendedLessons, @required Timespan timespan}) = _$UserStatsLoaded;

  List<Lesson> get attendedLessons;
  Timespan get timespan;
  $UserStatsLoadedCopyWith<UserStatsLoaded> get copyWith;
}
