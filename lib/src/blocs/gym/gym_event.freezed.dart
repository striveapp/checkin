// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'gym_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GymEventTearOff {
  const _$GymEventTearOff();

  GymUpdated gymUpdated({required Gym gym}) {
    return GymUpdated(
      gym: gym,
    );
  }

  InitializeGym initializeGym() {
    return const InitializeGym();
  }
}

/// @nodoc
const $GymEvent = _$GymEventTearOff();

/// @nodoc
mixin _$GymEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Gym gym) gymUpdated,
    required TResult Function() initializeGym,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Gym gym)? gymUpdated,
    TResult Function()? initializeGym,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GymUpdated value) gymUpdated,
    required TResult Function(InitializeGym value) initializeGym,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GymUpdated value)? gymUpdated,
    TResult Function(InitializeGym value)? initializeGym,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymEventCopyWith<$Res> {
  factory $GymEventCopyWith(GymEvent value, $Res Function(GymEvent) then) =
      _$GymEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GymEventCopyWithImpl<$Res> implements $GymEventCopyWith<$Res> {
  _$GymEventCopyWithImpl(this._value, this._then);

  final GymEvent _value;
  // ignore: unused_field
  final $Res Function(GymEvent) _then;
}

/// @nodoc
abstract class $GymUpdatedCopyWith<$Res> {
  factory $GymUpdatedCopyWith(
          GymUpdated value, $Res Function(GymUpdated) then) =
      _$GymUpdatedCopyWithImpl<$Res>;
  $Res call({Gym gym});

  $GymCopyWith<$Res> get gym;
}

/// @nodoc
class _$GymUpdatedCopyWithImpl<$Res> extends _$GymEventCopyWithImpl<$Res>
    implements $GymUpdatedCopyWith<$Res> {
  _$GymUpdatedCopyWithImpl(GymUpdated _value, $Res Function(GymUpdated) _then)
      : super(_value, (v) => _then(v as GymUpdated));

  @override
  GymUpdated get _value => super._value as GymUpdated;

  @override
  $Res call({
    Object? gym = freezed,
  }) {
    return _then(GymUpdated(
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

class _$GymUpdated with DiagnosticableTreeMixin implements GymUpdated {
  const _$GymUpdated({required this.gym});

  @override
  final Gym gym;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GymEvent.gymUpdated(gym: $gym)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GymEvent.gymUpdated'))
      ..add(DiagnosticsProperty('gym', gym));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GymUpdated &&
            (identical(other.gym, gym) ||
                const DeepCollectionEquality().equals(other.gym, gym)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gym);

  @JsonKey(ignore: true)
  @override
  $GymUpdatedCopyWith<GymUpdated> get copyWith =>
      _$GymUpdatedCopyWithImpl<GymUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Gym gym) gymUpdated,
    required TResult Function() initializeGym,
  }) {
    return gymUpdated(gym);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Gym gym)? gymUpdated,
    TResult Function()? initializeGym,
    required TResult orElse(),
  }) {
    if (gymUpdated != null) {
      return gymUpdated(gym);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GymUpdated value) gymUpdated,
    required TResult Function(InitializeGym value) initializeGym,
  }) {
    return gymUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GymUpdated value)? gymUpdated,
    TResult Function(InitializeGym value)? initializeGym,
    required TResult orElse(),
  }) {
    if (gymUpdated != null) {
      return gymUpdated(this);
    }
    return orElse();
  }
}

abstract class GymUpdated implements GymEvent {
  const factory GymUpdated({required Gym gym}) = _$GymUpdated;

  Gym get gym => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GymUpdatedCopyWith<GymUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializeGymCopyWith<$Res> {
  factory $InitializeGymCopyWith(
          InitializeGym value, $Res Function(InitializeGym) then) =
      _$InitializeGymCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeGymCopyWithImpl<$Res> extends _$GymEventCopyWithImpl<$Res>
    implements $InitializeGymCopyWith<$Res> {
  _$InitializeGymCopyWithImpl(
      InitializeGym _value, $Res Function(InitializeGym) _then)
      : super(_value, (v) => _then(v as InitializeGym));

  @override
  InitializeGym get _value => super._value as InitializeGym;
}

/// @nodoc

class _$InitializeGym with DiagnosticableTreeMixin implements InitializeGym {
  const _$InitializeGym();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GymEvent.initializeGym()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GymEvent.initializeGym'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeGym);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Gym gym) gymUpdated,
    required TResult Function() initializeGym,
  }) {
    return initializeGym();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Gym gym)? gymUpdated,
    TResult Function()? initializeGym,
    required TResult orElse(),
  }) {
    if (initializeGym != null) {
      return initializeGym();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GymUpdated value) gymUpdated,
    required TResult Function(InitializeGym value) initializeGym,
  }) {
    return initializeGym(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GymUpdated value)? gymUpdated,
    TResult Function(InitializeGym value)? initializeGym,
    required TResult orElse(),
  }) {
    if (initializeGym != null) {
      return initializeGym(this);
    }
    return orElse();
  }
}

abstract class InitializeGym implements GymEvent {
  const factory InitializeGym() = _$InitializeGym;
}
