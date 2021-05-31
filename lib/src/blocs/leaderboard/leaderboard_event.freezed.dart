// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'leaderboard_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LeaderboardEventTearOff {
  const _$LeaderboardEventTearOff();

// ignore: unused_element
  InitializeLeaderboard initializeLeaderboard() {
    return const InitializeLeaderboard();
  }

// ignore: unused_element
  LeaderboardUpdated leaderboardUpdated(
      {@required List<UserHistory> usersHistory}) {
    return LeaderboardUpdated(
      usersHistory: usersHistory,
    );
  }

// ignore: unused_element
  UpdateTimespan updateTimespan({@required Timespan timespan}) {
    return UpdateTimespan(
      timespan: timespan,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LeaderboardEvent = _$LeaderboardEventTearOff();

/// @nodoc
mixin _$LeaderboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLeaderboard(),
    @required TResult leaderboardUpdated(List<UserHistory> usersHistory),
    @required TResult updateTimespan(Timespan timespan),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLeaderboard(),
    TResult leaderboardUpdated(List<UserHistory> usersHistory),
    TResult updateTimespan(Timespan timespan),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLeaderboard(InitializeLeaderboard value),
    @required TResult leaderboardUpdated(LeaderboardUpdated value),
    @required TResult updateTimespan(UpdateTimespan value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLeaderboard(InitializeLeaderboard value),
    TResult leaderboardUpdated(LeaderboardUpdated value),
    TResult updateTimespan(UpdateTimespan value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LeaderboardEventCopyWith<$Res> {
  factory $LeaderboardEventCopyWith(
          LeaderboardEvent value, $Res Function(LeaderboardEvent) then) =
      _$LeaderboardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LeaderboardEventCopyWithImpl<$Res>
    implements $LeaderboardEventCopyWith<$Res> {
  _$LeaderboardEventCopyWithImpl(this._value, this._then);

  final LeaderboardEvent _value;
  // ignore: unused_field
  final $Res Function(LeaderboardEvent) _then;
}

/// @nodoc
abstract class $InitializeLeaderboardCopyWith<$Res> {
  factory $InitializeLeaderboardCopyWith(InitializeLeaderboard value,
          $Res Function(InitializeLeaderboard) then) =
      _$InitializeLeaderboardCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeLeaderboardCopyWithImpl<$Res>
    extends _$LeaderboardEventCopyWithImpl<$Res>
    implements $InitializeLeaderboardCopyWith<$Res> {
  _$InitializeLeaderboardCopyWithImpl(
      InitializeLeaderboard _value, $Res Function(InitializeLeaderboard) _then)
      : super(_value, (v) => _then(v as InitializeLeaderboard));

  @override
  InitializeLeaderboard get _value => super._value as InitializeLeaderboard;
}

/// @nodoc
class _$InitializeLeaderboard
    with DiagnosticableTreeMixin
    implements InitializeLeaderboard {
  const _$InitializeLeaderboard();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LeaderboardEvent.initializeLeaderboard()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'LeaderboardEvent.initializeLeaderboard'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeLeaderboard);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLeaderboard(),
    @required TResult leaderboardUpdated(List<UserHistory> usersHistory),
    @required TResult updateTimespan(Timespan timespan),
  }) {
    assert(initializeLeaderboard != null);
    assert(leaderboardUpdated != null);
    assert(updateTimespan != null);
    return initializeLeaderboard();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLeaderboard(),
    TResult leaderboardUpdated(List<UserHistory> usersHistory),
    TResult updateTimespan(Timespan timespan),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeLeaderboard != null) {
      return initializeLeaderboard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLeaderboard(InitializeLeaderboard value),
    @required TResult leaderboardUpdated(LeaderboardUpdated value),
    @required TResult updateTimespan(UpdateTimespan value),
  }) {
    assert(initializeLeaderboard != null);
    assert(leaderboardUpdated != null);
    assert(updateTimespan != null);
    return initializeLeaderboard(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLeaderboard(InitializeLeaderboard value),
    TResult leaderboardUpdated(LeaderboardUpdated value),
    TResult updateTimespan(UpdateTimespan value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeLeaderboard != null) {
      return initializeLeaderboard(this);
    }
    return orElse();
  }
}

abstract class InitializeLeaderboard implements LeaderboardEvent {
  const factory InitializeLeaderboard() = _$InitializeLeaderboard;
}

/// @nodoc
abstract class $LeaderboardUpdatedCopyWith<$Res> {
  factory $LeaderboardUpdatedCopyWith(
          LeaderboardUpdated value, $Res Function(LeaderboardUpdated) then) =
      _$LeaderboardUpdatedCopyWithImpl<$Res>;
  $Res call({List<UserHistory> usersHistory});
}

/// @nodoc
class _$LeaderboardUpdatedCopyWithImpl<$Res>
    extends _$LeaderboardEventCopyWithImpl<$Res>
    implements $LeaderboardUpdatedCopyWith<$Res> {
  _$LeaderboardUpdatedCopyWithImpl(
      LeaderboardUpdated _value, $Res Function(LeaderboardUpdated) _then)
      : super(_value, (v) => _then(v as LeaderboardUpdated));

  @override
  LeaderboardUpdated get _value => super._value as LeaderboardUpdated;

  @override
  $Res call({
    Object usersHistory = freezed,
  }) {
    return _then(LeaderboardUpdated(
      usersHistory: usersHistory == freezed
          ? _value.usersHistory
          : usersHistory as List<UserHistory>,
    ));
  }
}

/// @nodoc
class _$LeaderboardUpdated
    with DiagnosticableTreeMixin
    implements LeaderboardUpdated {
  const _$LeaderboardUpdated({@required this.usersHistory})
      : assert(usersHistory != null);

  @override
  final List<UserHistory> usersHistory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LeaderboardEvent.leaderboardUpdated(usersHistory: $usersHistory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LeaderboardEvent.leaderboardUpdated'))
      ..add(DiagnosticsProperty('usersHistory', usersHistory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LeaderboardUpdated &&
            (identical(other.usersHistory, usersHistory) ||
                const DeepCollectionEquality()
                    .equals(other.usersHistory, usersHistory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(usersHistory);

  @JsonKey(ignore: true)
  @override
  $LeaderboardUpdatedCopyWith<LeaderboardUpdated> get copyWith =>
      _$LeaderboardUpdatedCopyWithImpl<LeaderboardUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLeaderboard(),
    @required TResult leaderboardUpdated(List<UserHistory> usersHistory),
    @required TResult updateTimespan(Timespan timespan),
  }) {
    assert(initializeLeaderboard != null);
    assert(leaderboardUpdated != null);
    assert(updateTimespan != null);
    return leaderboardUpdated(usersHistory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLeaderboard(),
    TResult leaderboardUpdated(List<UserHistory> usersHistory),
    TResult updateTimespan(Timespan timespan),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (leaderboardUpdated != null) {
      return leaderboardUpdated(usersHistory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLeaderboard(InitializeLeaderboard value),
    @required TResult leaderboardUpdated(LeaderboardUpdated value),
    @required TResult updateTimespan(UpdateTimespan value),
  }) {
    assert(initializeLeaderboard != null);
    assert(leaderboardUpdated != null);
    assert(updateTimespan != null);
    return leaderboardUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLeaderboard(InitializeLeaderboard value),
    TResult leaderboardUpdated(LeaderboardUpdated value),
    TResult updateTimespan(UpdateTimespan value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (leaderboardUpdated != null) {
      return leaderboardUpdated(this);
    }
    return orElse();
  }
}

abstract class LeaderboardUpdated implements LeaderboardEvent {
  const factory LeaderboardUpdated({@required List<UserHistory> usersHistory}) =
      _$LeaderboardUpdated;

  List<UserHistory> get usersHistory;
  @JsonKey(ignore: true)
  $LeaderboardUpdatedCopyWith<LeaderboardUpdated> get copyWith;
}

/// @nodoc
abstract class $UpdateTimespanCopyWith<$Res> {
  factory $UpdateTimespanCopyWith(
          UpdateTimespan value, $Res Function(UpdateTimespan) then) =
      _$UpdateTimespanCopyWithImpl<$Res>;
  $Res call({Timespan timespan});
}

/// @nodoc
class _$UpdateTimespanCopyWithImpl<$Res>
    extends _$LeaderboardEventCopyWithImpl<$Res>
    implements $UpdateTimespanCopyWith<$Res> {
  _$UpdateTimespanCopyWithImpl(
      UpdateTimespan _value, $Res Function(UpdateTimespan) _then)
      : super(_value, (v) => _then(v as UpdateTimespan));

  @override
  UpdateTimespan get _value => super._value as UpdateTimespan;

  @override
  $Res call({
    Object timespan = freezed,
  }) {
    return _then(UpdateTimespan(
      timespan: timespan == freezed ? _value.timespan : timespan as Timespan,
    ));
  }
}

/// @nodoc
class _$UpdateTimespan with DiagnosticableTreeMixin implements UpdateTimespan {
  const _$UpdateTimespan({@required this.timespan}) : assert(timespan != null);

  @override
  final Timespan timespan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LeaderboardEvent.updateTimespan(timespan: $timespan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LeaderboardEvent.updateTimespan'))
      ..add(DiagnosticsProperty('timespan', timespan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateTimespan &&
            (identical(other.timespan, timespan) ||
                const DeepCollectionEquality()
                    .equals(other.timespan, timespan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(timespan);

  @JsonKey(ignore: true)
  @override
  $UpdateTimespanCopyWith<UpdateTimespan> get copyWith =>
      _$UpdateTimespanCopyWithImpl<UpdateTimespan>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLeaderboard(),
    @required TResult leaderboardUpdated(List<UserHistory> usersHistory),
    @required TResult updateTimespan(Timespan timespan),
  }) {
    assert(initializeLeaderboard != null);
    assert(leaderboardUpdated != null);
    assert(updateTimespan != null);
    return updateTimespan(timespan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLeaderboard(),
    TResult leaderboardUpdated(List<UserHistory> usersHistory),
    TResult updateTimespan(Timespan timespan),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateTimespan != null) {
      return updateTimespan(timespan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLeaderboard(InitializeLeaderboard value),
    @required TResult leaderboardUpdated(LeaderboardUpdated value),
    @required TResult updateTimespan(UpdateTimespan value),
  }) {
    assert(initializeLeaderboard != null);
    assert(leaderboardUpdated != null);
    assert(updateTimespan != null);
    return updateTimespan(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLeaderboard(InitializeLeaderboard value),
    TResult leaderboardUpdated(LeaderboardUpdated value),
    TResult updateTimespan(UpdateTimespan value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateTimespan != null) {
      return updateTimespan(this);
    }
    return orElse();
  }
}

abstract class UpdateTimespan implements LeaderboardEvent {
  const factory UpdateTimespan({@required Timespan timespan}) =
      _$UpdateTimespan;

  Timespan get timespan;
  @JsonKey(ignore: true)
  $UpdateTimespanCopyWith<UpdateTimespan> get copyWith;
}
