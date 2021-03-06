// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'gym_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GymStateTearOff {
  const _$GymStateTearOff();

  InitialGymState initialGymState() {
    return const InitialGymState();
  }

  GymLoaded gymLoaded({required Gym gym}) {
    return GymLoaded(
      gym: gym,
    );
  }
}

/// @nodoc
const $GymState = _$GymStateTearOff();

/// @nodoc
mixin _$GymState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialGymState,
    required TResult Function(Gym gym) gymLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialGymState,
    TResult Function(Gym gym)? gymLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialGymState value) initialGymState,
    required TResult Function(GymLoaded value) gymLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGymState value)? initialGymState,
    TResult Function(GymLoaded value)? gymLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymStateCopyWith<$Res> {
  factory $GymStateCopyWith(GymState value, $Res Function(GymState) then) =
      _$GymStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GymStateCopyWithImpl<$Res> implements $GymStateCopyWith<$Res> {
  _$GymStateCopyWithImpl(this._value, this._then);

  final GymState _value;
  // ignore: unused_field
  final $Res Function(GymState) _then;
}

/// @nodoc
abstract class $InitialGymStateCopyWith<$Res> {
  factory $InitialGymStateCopyWith(
          InitialGymState value, $Res Function(InitialGymState) then) =
      _$InitialGymStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialGymStateCopyWithImpl<$Res> extends _$GymStateCopyWithImpl<$Res>
    implements $InitialGymStateCopyWith<$Res> {
  _$InitialGymStateCopyWithImpl(
      InitialGymState _value, $Res Function(InitialGymState) _then)
      : super(_value, (v) => _then(v as InitialGymState));

  @override
  InitialGymState get _value => super._value as InitialGymState;
}

/// @nodoc

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
  TResult when<TResult extends Object?>({
    required TResult Function() initialGymState,
    required TResult Function(Gym gym) gymLoaded,
  }) {
    return initialGymState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialGymState,
    TResult Function(Gym gym)? gymLoaded,
    required TResult orElse(),
  }) {
    if (initialGymState != null) {
      return initialGymState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialGymState value) initialGymState,
    required TResult Function(GymLoaded value) gymLoaded,
  }) {
    return initialGymState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGymState value)? initialGymState,
    TResult Function(GymLoaded value)? gymLoaded,
    required TResult orElse(),
  }) {
    if (initialGymState != null) {
      return initialGymState(this);
    }
    return orElse();
  }
}

abstract class InitialGymState implements GymState {
  const factory InitialGymState() = _$InitialGymState;
}

/// @nodoc
abstract class $GymLoadedCopyWith<$Res> {
  factory $GymLoadedCopyWith(GymLoaded value, $Res Function(GymLoaded) then) =
      _$GymLoadedCopyWithImpl<$Res>;
  $Res call({Gym gym});

  $GymCopyWith<$Res> get gym;
}

/// @nodoc
class _$GymLoadedCopyWithImpl<$Res> extends _$GymStateCopyWithImpl<$Res>
    implements $GymLoadedCopyWith<$Res> {
  _$GymLoadedCopyWithImpl(GymLoaded _value, $Res Function(GymLoaded) _then)
      : super(_value, (v) => _then(v as GymLoaded));

  @override
  GymLoaded get _value => super._value as GymLoaded;

  @override
  $Res call({
    Object? gym = freezed,
  }) {
    return _then(GymLoaded(
      gym: gym == freezed
          ? _value.gym
          : gym // ignore: cast_nullable_to_non_nullable
              as Gym,
    ));
  }

  @override
  $GymCopyWith<$Res> get gym {
    return $GymCopyWith<$Res>(_value.gym, (value) {
      return _then(_value.copyWith(gym: value));
    });
  }
}

/// @nodoc

class _$GymLoaded with DiagnosticableTreeMixin implements GymLoaded {
  const _$GymLoaded({required this.gym});

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

  @JsonKey(ignore: true)
  @override
  $GymLoadedCopyWith<GymLoaded> get copyWith =>
      _$GymLoadedCopyWithImpl<GymLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialGymState,
    required TResult Function(Gym gym) gymLoaded,
  }) {
    return gymLoaded(gym);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialGymState,
    TResult Function(Gym gym)? gymLoaded,
    required TResult orElse(),
  }) {
    if (gymLoaded != null) {
      return gymLoaded(gym);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialGymState value) initialGymState,
    required TResult Function(GymLoaded value) gymLoaded,
  }) {
    return gymLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGymState value)? initialGymState,
    TResult Function(GymLoaded value)? gymLoaded,
    required TResult orElse(),
  }) {
    if (gymLoaded != null) {
      return gymLoaded(this);
    }
    return orElse();
  }
}

abstract class GymLoaded implements GymState {
  const factory GymLoaded({required Gym gym}) = _$GymLoaded;

  Gym get gym => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GymLoadedCopyWith<GymLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
