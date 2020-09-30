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
}

/// @nodoc
// ignore: unused_element
const $GymEvent = _$GymEventTearOff();

/// @nodoc
mixin _$GymEvent {
  Gym get gym;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result gymUpdated(Gym gym),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gymUpdated(Gym gym),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gymUpdated(GymUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gymUpdated(GymUpdated value),
    @required Result orElse(),
  });

  $GymEventCopyWith<GymEvent> get copyWith;
}

/// @nodoc
abstract class $GymEventCopyWith<$Res> {
  factory $GymEventCopyWith(GymEvent value, $Res Function(GymEvent) then) =
      _$GymEventCopyWithImpl<$Res>;
  $Res call({Gym gym});

  $GymCopyWith<$Res> get gym;
}

/// @nodoc
class _$GymEventCopyWithImpl<$Res> implements $GymEventCopyWith<$Res> {
  _$GymEventCopyWithImpl(this._value, this._then);

  final GymEvent _value;
  // ignore: unused_field
  final $Res Function(GymEvent) _then;

  @override
  $Res call({
    Object gym = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class $GymUpdatedCopyWith<$Res> implements $GymEventCopyWith<$Res> {
  factory $GymUpdatedCopyWith(
          GymUpdated value, $Res Function(GymUpdated) then) =
      _$GymUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({Gym gym});

  @override
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
            (identical(other.gym, gym) ||
                const DeepCollectionEquality().equals(other.gym, gym)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gym);

  @override
  $GymUpdatedCopyWith<GymUpdated> get copyWith =>
      _$GymUpdatedCopyWithImpl<GymUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result gymUpdated(Gym gym),
  }) {
    assert(gymUpdated != null);
    return gymUpdated(gym);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gymUpdated(Gym gym),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gymUpdated != null) {
      return gymUpdated(gym);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gymUpdated(GymUpdated value),
  }) {
    assert(gymUpdated != null);
    return gymUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gymUpdated(GymUpdated value),
    @required Result orElse(),
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

  @override
  Gym get gym;
  @override
  $GymUpdatedCopyWith<GymUpdated> get copyWith;
}
