// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'gym_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GymEventTearOff {
  const _$GymEventTearOff();

  GymUpdated gymUpdated({@required Gym gym}) {
    return GymUpdated(
      gym: gym,
    );
  }
}

// ignore: unused_element
const $GymEvent = _$GymEventTearOff();

mixin _$GymEvent {
  Gym get gym;

  $GymEventCopyWith<GymEvent> get copyWith;
}

abstract class $GymEventCopyWith<$Res> {
  factory $GymEventCopyWith(GymEvent value, $Res Function(GymEvent) then) =
      _$GymEventCopyWithImpl<$Res>;
  $Res call({Gym gym});

  $GymCopyWith<$Res> get gym;
}

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

abstract class $GymUpdatedCopyWith<$Res> implements $GymEventCopyWith<$Res> {
  factory $GymUpdatedCopyWith(
          GymUpdated value, $Res Function(GymUpdated) then) =
      _$GymUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({Gym gym});

  @override
  $GymCopyWith<$Res> get gym;
}

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
}

abstract class GymUpdated implements GymEvent {
  const factory GymUpdated({@required Gym gym}) = _$GymUpdated;

  @override
  Gym get gym;
  @override
  $GymUpdatedCopyWith<GymUpdated> get copyWith;
}
