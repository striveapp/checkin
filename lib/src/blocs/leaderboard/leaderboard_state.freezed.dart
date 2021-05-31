// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'leaderboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LeaderboardStateTearOff {
  const _$LeaderboardStateTearOff();

// ignore: unused_element
  LeaderboardInitial leaderboardInitial() {
    return const LeaderboardInitial();
  }

// ignore: unused_element
  LeaderboardLoaded leaderboardLoaded(
      {@required List<UserHistory> podium,
      @required List<UserHistory> restOfTheUsers,
      bool isAvailable = true}) {
    return LeaderboardLoaded(
      podium: podium,
      restOfTheUsers: restOfTheUsers,
      isAvailable: isAvailable,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LeaderboardState = _$LeaderboardStateTearOff();

/// @nodoc
mixin _$LeaderboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult leaderboardInitial(),
    @required
        TResult leaderboardLoaded(
            List<UserHistory> podium, List<UserHistory> restOfTheUsers, bool isAvailable),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult leaderboardInitial(),
    TResult leaderboardLoaded(
        List<UserHistory> podium, List<UserHistory> restOfTheUsers, bool isAvailable),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult leaderboardInitial(LeaderboardInitial value),
    @required TResult leaderboardLoaded(LeaderboardLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult leaderboardInitial(LeaderboardInitial value),
    TResult leaderboardLoaded(LeaderboardLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LeaderboardStateCopyWith<$Res> {
  factory $LeaderboardStateCopyWith(LeaderboardState value, $Res Function(LeaderboardState) then) =
      _$LeaderboardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LeaderboardStateCopyWithImpl<$Res> implements $LeaderboardStateCopyWith<$Res> {
  _$LeaderboardStateCopyWithImpl(this._value, this._then);

  final LeaderboardState _value;
  // ignore: unused_field
  final $Res Function(LeaderboardState) _then;
}

/// @nodoc
abstract class $LeaderboardInitialCopyWith<$Res> {
  factory $LeaderboardInitialCopyWith(
          LeaderboardInitial value, $Res Function(LeaderboardInitial) then) =
      _$LeaderboardInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$LeaderboardInitialCopyWithImpl<$Res> extends _$LeaderboardStateCopyWithImpl<$Res>
    implements $LeaderboardInitialCopyWith<$Res> {
  _$LeaderboardInitialCopyWithImpl(
      LeaderboardInitial _value, $Res Function(LeaderboardInitial) _then)
      : super(_value, (v) => _then(v as LeaderboardInitial));

  @override
  LeaderboardInitial get _value => super._value as LeaderboardInitial;
}

/// @nodoc
class _$LeaderboardInitial with DiagnosticableTreeMixin implements LeaderboardInitial {
  const _$LeaderboardInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LeaderboardState.leaderboardInitial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LeaderboardState.leaderboardInitial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LeaderboardInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult leaderboardInitial(),
    @required
        TResult leaderboardLoaded(
            List<UserHistory> podium, List<UserHistory> restOfTheUsers, bool isAvailable),
  }) {
    assert(leaderboardInitial != null);
    assert(leaderboardLoaded != null);
    return leaderboardInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult leaderboardInitial(),
    TResult leaderboardLoaded(
        List<UserHistory> podium, List<UserHistory> restOfTheUsers, bool isAvailable),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (leaderboardInitial != null) {
      return leaderboardInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult leaderboardInitial(LeaderboardInitial value),
    @required TResult leaderboardLoaded(LeaderboardLoaded value),
  }) {
    assert(leaderboardInitial != null);
    assert(leaderboardLoaded != null);
    return leaderboardInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult leaderboardInitial(LeaderboardInitial value),
    TResult leaderboardLoaded(LeaderboardLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (leaderboardInitial != null) {
      return leaderboardInitial(this);
    }
    return orElse();
  }
}

abstract class LeaderboardInitial implements LeaderboardState {
  const factory LeaderboardInitial() = _$LeaderboardInitial;
}

/// @nodoc
abstract class $LeaderboardLoadedCopyWith<$Res> {
  factory $LeaderboardLoadedCopyWith(
          LeaderboardLoaded value, $Res Function(LeaderboardLoaded) then) =
      _$LeaderboardLoadedCopyWithImpl<$Res>;
  $Res call({List<UserHistory> podium, List<UserHistory> restOfTheUsers, bool isAvailable});
}

/// @nodoc
class _$LeaderboardLoadedCopyWithImpl<$Res> extends _$LeaderboardStateCopyWithImpl<$Res>
    implements $LeaderboardLoadedCopyWith<$Res> {
  _$LeaderboardLoadedCopyWithImpl(LeaderboardLoaded _value, $Res Function(LeaderboardLoaded) _then)
      : super(_value, (v) => _then(v as LeaderboardLoaded));

  @override
  LeaderboardLoaded get _value => super._value as LeaderboardLoaded;

  @override
  $Res call({
    Object podium = freezed,
    Object restOfTheUsers = freezed,
    Object isAvailable = freezed,
  }) {
    return _then(LeaderboardLoaded(
      podium: podium == freezed ? _value.podium : podium as List<UserHistory>,
      restOfTheUsers:
          restOfTheUsers == freezed ? _value.restOfTheUsers : restOfTheUsers as List<UserHistory>,
      isAvailable: isAvailable == freezed ? _value.isAvailable : isAvailable as bool,
    ));
  }
}

/// @nodoc
class _$LeaderboardLoaded with DiagnosticableTreeMixin implements LeaderboardLoaded {
  const _$LeaderboardLoaded(
      {@required this.podium, @required this.restOfTheUsers, this.isAvailable = true})
      : assert(podium != null),
        assert(restOfTheUsers != null),
        assert(isAvailable != null);

  @override
  final List<UserHistory> podium;
  @override
  final List<UserHistory> restOfTheUsers;
  @JsonKey(defaultValue: true)
  @override
  final bool isAvailable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LeaderboardState.leaderboardLoaded(podium: $podium, restOfTheUsers: $restOfTheUsers, isAvailable: $isAvailable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LeaderboardState.leaderboardLoaded'))
      ..add(DiagnosticsProperty('podium', podium))
      ..add(DiagnosticsProperty('restOfTheUsers', restOfTheUsers))
      ..add(DiagnosticsProperty('isAvailable', isAvailable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LeaderboardLoaded &&
            (identical(other.podium, podium) ||
                const DeepCollectionEquality().equals(other.podium, podium)) &&
            (identical(other.restOfTheUsers, restOfTheUsers) ||
                const DeepCollectionEquality().equals(other.restOfTheUsers, restOfTheUsers)) &&
            (identical(other.isAvailable, isAvailable) ||
                const DeepCollectionEquality().equals(other.isAvailable, isAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(podium) ^
      const DeepCollectionEquality().hash(restOfTheUsers) ^
      const DeepCollectionEquality().hash(isAvailable);

  @JsonKey(ignore: true)
  @override
  $LeaderboardLoadedCopyWith<LeaderboardLoaded> get copyWith =>
      _$LeaderboardLoadedCopyWithImpl<LeaderboardLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult leaderboardInitial(),
    @required
        TResult leaderboardLoaded(
            List<UserHistory> podium, List<UserHistory> restOfTheUsers, bool isAvailable),
  }) {
    assert(leaderboardInitial != null);
    assert(leaderboardLoaded != null);
    return leaderboardLoaded(podium, restOfTheUsers, isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult leaderboardInitial(),
    TResult leaderboardLoaded(
        List<UserHistory> podium, List<UserHistory> restOfTheUsers, bool isAvailable),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (leaderboardLoaded != null) {
      return leaderboardLoaded(podium, restOfTheUsers, isAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult leaderboardInitial(LeaderboardInitial value),
    @required TResult leaderboardLoaded(LeaderboardLoaded value),
  }) {
    assert(leaderboardInitial != null);
    assert(leaderboardLoaded != null);
    return leaderboardLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult leaderboardInitial(LeaderboardInitial value),
    TResult leaderboardLoaded(LeaderboardLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (leaderboardLoaded != null) {
      return leaderboardLoaded(this);
    }
    return orElse();
  }
}

abstract class LeaderboardLoaded implements LeaderboardState {
  const factory LeaderboardLoaded(
      {@required List<UserHistory> podium,
      @required List<UserHistory> restOfTheUsers,
      bool isAvailable}) = _$LeaderboardLoaded;

  List<UserHistory> get podium;
  List<UserHistory> get restOfTheUsers;
  bool get isAvailable;
  @JsonKey(ignore: true)
  $LeaderboardLoadedCopyWith<LeaderboardLoaded> get copyWith;
}
