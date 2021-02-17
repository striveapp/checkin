// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'gym_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GymEventTearOff {
  const _$GymEventTearOff();

// ignore: unused_element
  GymUpdated gymUpdated({@required Gym gym}) {
    return GymUpdated(
      gym: gym,
    );
  }

// ignore: unused_element
  InitializeGym initializeGym() {
    return const InitializeGym();
  }
}

/// @nodoc
// ignore: unused_element
const $GymEvent = _$GymEventTearOff();

/// @nodoc
mixin _$GymEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult gymUpdated(Gym gym),
    @required TResult initializeGym(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult gymUpdated(Gym gym),
    TResult initializeGym(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult gymUpdated(GymUpdated value),
    @required TResult initializeGym(InitializeGym value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult gymUpdated(GymUpdated value),
    TResult initializeGym(InitializeGym value),
    @required TResult orElse(),
  });
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
  factory $GymUpdatedCopyWith(GymUpdated value, $Res Function(GymUpdated) then) =
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
    Object gym = freezed,
  }) {
    return _then(GymUpdated(
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

/// @nodoc
class _$GymUpdated with DiagnosticableTreeMixin implements GymUpdated {
  const _$GymUpdated({@required this.gym}) : assert(gym != null);

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
            (identical(other.gym, gym) || const DeepCollectionEquality().equals(other.gym, gym)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(gym);

  @override
  $GymUpdatedCopyWith<GymUpdated> get copyWith =>
      _$GymUpdatedCopyWithImpl<GymUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult gymUpdated(Gym gym),
    @required TResult initializeGym(),
  }) {
    assert(gymUpdated != null);
    assert(initializeGym != null);
    return gymUpdated(gym);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult gymUpdated(Gym gym),
    TResult initializeGym(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (gymUpdated != null) {
      return gymUpdated(gym);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult gymUpdated(GymUpdated value),
    @required TResult initializeGym(InitializeGym value),
  }) {
    assert(gymUpdated != null);
    assert(initializeGym != null);
    return gymUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult gymUpdated(GymUpdated value),
    TResult initializeGym(InitializeGym value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (gymUpdated != null) {
      return gymUpdated(this);
    }
    return orElse();
  }
}

abstract class GymUpdated implements GymEvent {
  const factory GymUpdated({@required Gym gym}) = _$GymUpdated;

  Gym get gym;
  $GymUpdatedCopyWith<GymUpdated> get copyWith;
}

/// @nodoc
abstract class $InitializeGymCopyWith<$Res> {
  factory $InitializeGymCopyWith(InitializeGym value, $Res Function(InitializeGym) then) =
      _$InitializeGymCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeGymCopyWithImpl<$Res> extends _$GymEventCopyWithImpl<$Res>
    implements $InitializeGymCopyWith<$Res> {
  _$InitializeGymCopyWithImpl(InitializeGym _value, $Res Function(InitializeGym) _then)
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
  TResult when<TResult extends Object>({
    @required TResult gymUpdated(Gym gym),
    @required TResult initializeGym(),
  }) {
    assert(gymUpdated != null);
    assert(initializeGym != null);
    return initializeGym();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult gymUpdated(Gym gym),
    TResult initializeGym(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeGym != null) {
      return initializeGym();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult gymUpdated(GymUpdated value),
    @required TResult initializeGym(InitializeGym value),
  }) {
    assert(gymUpdated != null);
    assert(initializeGym != null);
    return initializeGym(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult gymUpdated(GymUpdated value),
    TResult initializeGym(InitializeGym value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeGym != null) {
      return initializeGym(this);
    }
    return orElse();
  }
}

abstract class InitializeGym implements GymEvent {
  const factory InitializeGym() = _$InitializeGym;
}
