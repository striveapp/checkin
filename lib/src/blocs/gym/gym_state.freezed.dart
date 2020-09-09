// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'gym_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GymStateTearOff {
  const _$GymStateTearOff();

// ignore: unused_element
  InitialGymState initialGymState() {
    return const InitialGymState();
  }

// ignore: unused_element
  GymLoaded gymLoaded({@required Gym gym}) {
    return GymLoaded(
      gym: gym,
    );
  }
}

// ignore: unused_element
const $GymState = _$GymStateTearOff();

mixin _$GymState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialGymState(),
    @required Result gymLoaded(Gym gym),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialGymState(),
    Result gymLoaded(Gym gym),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialGymState(InitialGymState value),
    @required Result gymLoaded(GymLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialGymState(InitialGymState value),
    Result gymLoaded(GymLoaded value),
    @required Result orElse(),
  });
}

abstract class $GymStateCopyWith<$Res> {
  factory $GymStateCopyWith(GymState value, $Res Function(GymState) then) =
      _$GymStateCopyWithImpl<$Res>;
}

class _$GymStateCopyWithImpl<$Res> implements $GymStateCopyWith<$Res> {
  _$GymStateCopyWithImpl(this._value, this._then);

  final GymState _value;
  // ignore: unused_field
  final $Res Function(GymState) _then;
}

abstract class $InitialGymStateCopyWith<$Res> {
  factory $InitialGymStateCopyWith(
          InitialGymState value, $Res Function(InitialGymState) then) =
      _$InitialGymStateCopyWithImpl<$Res>;
}

class _$InitialGymStateCopyWithImpl<$Res> extends _$GymStateCopyWithImpl<$Res>
    implements $InitialGymStateCopyWith<$Res> {
  _$InitialGymStateCopyWithImpl(
      InitialGymState _value, $Res Function(InitialGymState) _then)
      : super(_value, (v) => _then(v as InitialGymState));

  @override
  InitialGymState get _value => super._value as InitialGymState;
}

class _$InitialGymState
    with DiagnosticableTreeMixin
    implements InitialGymState {
  const _$InitialGymState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GymState.initialGymState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GymState.initialGymState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialGymState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialGymState(),
    @required Result gymLoaded(Gym gym),
  }) {
    assert(initialGymState != null);
    assert(gymLoaded != null);
    return initialGymState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialGymState(),
    Result gymLoaded(Gym gym),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialGymState != null) {
      return initialGymState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialGymState(InitialGymState value),
    @required Result gymLoaded(GymLoaded value),
  }) {
    assert(initialGymState != null);
    assert(gymLoaded != null);
    return initialGymState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialGymState(InitialGymState value),
    Result gymLoaded(GymLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialGymState != null) {
      return initialGymState(this);
    }
    return orElse();
  }
}

abstract class InitialGymState implements GymState {
  const factory InitialGymState() = _$InitialGymState;
}

abstract class $GymLoadedCopyWith<$Res> {
  factory $GymLoadedCopyWith(GymLoaded value, $Res Function(GymLoaded) then) =
      _$GymLoadedCopyWithImpl<$Res>;
  $Res call({Gym gym});

  $GymCopyWith<$Res> get gym;
}

class _$GymLoadedCopyWithImpl<$Res> extends _$GymStateCopyWithImpl<$Res>
    implements $GymLoadedCopyWith<$Res> {
  _$GymLoadedCopyWithImpl(GymLoaded _value, $Res Function(GymLoaded) _then)
      : super(_value, (v) => _then(v as GymLoaded));

  @override
  GymLoaded get _value => super._value as GymLoaded;

  @override
  $Res call({
    Object gym = freezed,
  }) {
    return _then(GymLoaded(
      gym: gym == freezed ? _value.gym : gym as Gym,
    ));
  }

  @override
  $GymCopyWith<$Res> get gym {
    if (_value.gym == null) {
      return null;
    }
    return $GymCopyWith<$Res>(_value.gym, (value) {
      return _then(_value.copyWith(gym: value));
    });
  }
}

class _$GymLoaded with DiagnosticableTreeMixin implements GymLoaded {
  const _$GymLoaded({@required this.gym}) : assert(gym != null);

  @override
  final Gym gym;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GymState.gymLoaded(gym: $gym)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GymState.gymLoaded'))
      ..add(DiagnosticsProperty('gym', gym));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GymLoaded &&
            (identical(other.gym, gym) ||
                const DeepCollectionEquality().equals(other.gym, gym)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gym);

  @override
  $GymLoadedCopyWith<GymLoaded> get copyWith =>
      _$GymLoadedCopyWithImpl<GymLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialGymState(),
    @required Result gymLoaded(Gym gym),
  }) {
    assert(initialGymState != null);
    assert(gymLoaded != null);
    return gymLoaded(gym);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialGymState(),
    Result gymLoaded(Gym gym),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gymLoaded != null) {
      return gymLoaded(gym);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialGymState(InitialGymState value),
    @required Result gymLoaded(GymLoaded value),
  }) {
    assert(initialGymState != null);
    assert(gymLoaded != null);
    return gymLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialGymState(InitialGymState value),
    Result gymLoaded(GymLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gymLoaded != null) {
      return gymLoaded(this);
    }
    return orElse();
  }
}

abstract class GymLoaded implements GymState {
  const factory GymLoaded({@required Gym gym}) = _$GymLoaded;

  Gym get gym;
  $GymLoadedCopyWith<GymLoaded> get copyWith;
}
