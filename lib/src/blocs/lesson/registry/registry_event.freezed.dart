// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'registry_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RegistryEventTearOff {
  const _$RegistryEventTearOff();

// ignore: unused_element
  RegistryUpdated registryUpdated(
      {@required int classCapacity,
      @required User currentUser,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees}) {
    return RegistryUpdated(
      classCapacity: classCapacity,
      currentUser: currentUser,
      attendees: attendees,
      acceptedAttendees: acceptedAttendees,
    );
  }

// ignore: unused_element
  Register register({@required String gymId, @required Attendee attendee}) {
    return Register(
      gymId: gymId,
      attendee: attendee,
    );
  }

// ignore: unused_element
  Unregister unregister({@required String gymId, @required Attendee attendee}) {
    return Unregister(
      gymId: gymId,
      attendee: attendee,
    );
  }

// ignore: unused_element
  AcceptAttendees acceptAttendees({@required String gymId}) {
    return AcceptAttendees(
      gymId: gymId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RegistryEvent = _$RegistryEventTearOff();

/// @nodoc
mixin _$RegistryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, User currentUser,
            List<Attendee> attendees, List<Attendee> acceptedAttendees),
    @required Result register(String gymId, Attendee attendee),
    @required Result unregister(String gymId, Attendee attendee),
    @required Result acceptAttendees(String gymId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, User currentUser,
        List<Attendee> attendees, List<Attendee> acceptedAttendees),
    Result register(String gymId, Attendee attendee),
    Result unregister(String gymId, Attendee attendee),
    Result acceptAttendees(String gymId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUpdated(RegistryUpdated value),
    @required Result register(Register value),
    @required Result unregister(Unregister value),
    @required Result acceptAttendees(AcceptAttendees value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUpdated(RegistryUpdated value),
    Result register(Register value),
    Result unregister(Unregister value),
    Result acceptAttendees(AcceptAttendees value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $RegistryEventCopyWith<$Res> {
  factory $RegistryEventCopyWith(
          RegistryEvent value, $Res Function(RegistryEvent) then) =
      _$RegistryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistryEventCopyWithImpl<$Res>
    implements $RegistryEventCopyWith<$Res> {
  _$RegistryEventCopyWithImpl(this._value, this._then);

  final RegistryEvent _value;
  // ignore: unused_field
  final $Res Function(RegistryEvent) _then;
}

/// @nodoc
abstract class $RegistryUpdatedCopyWith<$Res> {
  factory $RegistryUpdatedCopyWith(
          RegistryUpdated value, $Res Function(RegistryUpdated) then) =
      _$RegistryUpdatedCopyWithImpl<$Res>;
  $Res call(
      {int classCapacity,
      User currentUser,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees});
}

/// @nodoc
class _$RegistryUpdatedCopyWithImpl<$Res>
    extends _$RegistryEventCopyWithImpl<$Res>
    implements $RegistryUpdatedCopyWith<$Res> {
  _$RegistryUpdatedCopyWithImpl(
      RegistryUpdated _value, $Res Function(RegistryUpdated) _then)
      : super(_value, (v) => _then(v as RegistryUpdated));

  @override
  RegistryUpdated get _value => super._value as RegistryUpdated;

  @override
  $Res call({
    Object classCapacity = freezed,
    Object currentUser = freezed,
    Object attendees = freezed,
    Object acceptedAttendees = freezed,
  }) {
    return _then(RegistryUpdated(
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity as int,
      currentUser:
          currentUser == freezed ? _value.currentUser : currentUser as User,
      attendees:
          attendees == freezed ? _value.attendees : attendees as List<Attendee>,
      acceptedAttendees: acceptedAttendees == freezed
          ? _value.acceptedAttendees
          : acceptedAttendees as List<Attendee>,
    ));
  }
}

/// @nodoc
class _$RegistryUpdated
    with DiagnosticableTreeMixin
    implements RegistryUpdated {
  const _$RegistryUpdated(
      {@required this.classCapacity,
      @required this.currentUser,
      this.attendees,
      this.acceptedAttendees})
      : assert(classCapacity != null),
        assert(currentUser != null);

  @override
  final int classCapacity;
  @override
  final User currentUser;
  @override
  final List<Attendee> attendees;
  @override
  final List<Attendee> acceptedAttendees;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.registryUpdated(classCapacity: $classCapacity, currentUser: $currentUser, attendees: $attendees, acceptedAttendees: $acceptedAttendees)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.registryUpdated'))
      ..add(DiagnosticsProperty('classCapacity', classCapacity))
      ..add(DiagnosticsProperty('currentUser', currentUser))
      ..add(DiagnosticsProperty('attendees', attendees))
      ..add(DiagnosticsProperty('acceptedAttendees', acceptedAttendees));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegistryUpdated &&
            (identical(other.classCapacity, classCapacity) ||
                const DeepCollectionEquality()
                    .equals(other.classCapacity, classCapacity)) &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)) &&
            (identical(other.attendees, attendees) ||
                const DeepCollectionEquality()
                    .equals(other.attendees, attendees)) &&
            (identical(other.acceptedAttendees, acceptedAttendees) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedAttendees, acceptedAttendees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(classCapacity) ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(attendees) ^
      const DeepCollectionEquality().hash(acceptedAttendees);

  @override
  $RegistryUpdatedCopyWith<RegistryUpdated> get copyWith =>
      _$RegistryUpdatedCopyWithImpl<RegistryUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, User currentUser,
            List<Attendee> attendees, List<Attendee> acceptedAttendees),
    @required Result register(String gymId, Attendee attendee),
    @required Result unregister(String gymId, Attendee attendee),
    @required Result acceptAttendees(String gymId),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return registryUpdated(
        classCapacity, currentUser, attendees, acceptedAttendees);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, User currentUser,
        List<Attendee> attendees, List<Attendee> acceptedAttendees),
    Result register(String gymId, Attendee attendee),
    Result unregister(String gymId, Attendee attendee),
    Result acceptAttendees(String gymId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryUpdated != null) {
      return registryUpdated(
          classCapacity, currentUser, attendees, acceptedAttendees);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUpdated(RegistryUpdated value),
    @required Result register(Register value),
    @required Result unregister(Unregister value),
    @required Result acceptAttendees(AcceptAttendees value),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return registryUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUpdated(RegistryUpdated value),
    Result register(Register value),
    Result unregister(Unregister value),
    Result acceptAttendees(AcceptAttendees value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryUpdated != null) {
      return registryUpdated(this);
    }
    return orElse();
  }
}

abstract class RegistryUpdated implements RegistryEvent {
  const factory RegistryUpdated(
      {@required int classCapacity,
      @required User currentUser,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees}) = _$RegistryUpdated;

  int get classCapacity;
  User get currentUser;
  List<Attendee> get attendees;
  List<Attendee> get acceptedAttendees;
  $RegistryUpdatedCopyWith<RegistryUpdated> get copyWith;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res>;
  $Res call({String gymId, Attendee attendee});
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(Register _value, $Res Function(Register) _then)
      : super(_value, (v) => _then(v as Register));

  @override
  Register get _value => super._value as Register;

  @override
  $Res call({
    Object gymId = freezed,
    Object attendee = freezed,
  }) {
    return _then(Register(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      attendee: attendee == freezed ? _value.attendee : attendee as Attendee,
    ));
  }
}

/// @nodoc
class _$Register with DiagnosticableTreeMixin implements Register {
  const _$Register({@required this.gymId, @required this.attendee})
      : assert(gymId != null),
        assert(attendee != null);

  @override
  final String gymId;
  @override
  final Attendee attendee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.register(gymId: $gymId, attendee: $attendee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.register'))
      ..add(DiagnosticsProperty('gymId', gymId))
      ..add(DiagnosticsProperty('attendee', attendee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Register &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.attendee, attendee) ||
                const DeepCollectionEquality()
                    .equals(other.attendee, attendee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(attendee);

  @override
  $RegisterCopyWith<Register> get copyWith =>
      _$RegisterCopyWithImpl<Register>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, User currentUser,
            List<Attendee> attendees, List<Attendee> acceptedAttendees),
    @required Result register(String gymId, Attendee attendee),
    @required Result unregister(String gymId, Attendee attendee),
    @required Result acceptAttendees(String gymId),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return register(gymId, attendee);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, User currentUser,
        List<Attendee> attendees, List<Attendee> acceptedAttendees),
    Result register(String gymId, Attendee attendee),
    Result unregister(String gymId, Attendee attendee),
    Result acceptAttendees(String gymId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(gymId, attendee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUpdated(RegistryUpdated value),
    @required Result register(Register value),
    @required Result unregister(Unregister value),
    @required Result acceptAttendees(AcceptAttendees value),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return register(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUpdated(RegistryUpdated value),
    Result register(Register value),
    Result unregister(Unregister value),
    Result acceptAttendees(AcceptAttendees value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class Register implements RegistryEvent {
  const factory Register(
      {@required String gymId, @required Attendee attendee}) = _$Register;

  String get gymId;
  Attendee get attendee;
  $RegisterCopyWith<Register> get copyWith;
}

/// @nodoc
abstract class $UnregisterCopyWith<$Res> {
  factory $UnregisterCopyWith(
          Unregister value, $Res Function(Unregister) then) =
      _$UnregisterCopyWithImpl<$Res>;
  $Res call({String gymId, Attendee attendee});
}

/// @nodoc
class _$UnregisterCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $UnregisterCopyWith<$Res> {
  _$UnregisterCopyWithImpl(Unregister _value, $Res Function(Unregister) _then)
      : super(_value, (v) => _then(v as Unregister));

  @override
  Unregister get _value => super._value as Unregister;

  @override
  $Res call({
    Object gymId = freezed,
    Object attendee = freezed,
  }) {
    return _then(Unregister(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      attendee: attendee == freezed ? _value.attendee : attendee as Attendee,
    ));
  }
}

/// @nodoc
class _$Unregister with DiagnosticableTreeMixin implements Unregister {
  const _$Unregister({@required this.gymId, @required this.attendee})
      : assert(gymId != null),
        assert(attendee != null);

  @override
  final String gymId;
  @override
  final Attendee attendee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.unregister(gymId: $gymId, attendee: $attendee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.unregister'))
      ..add(DiagnosticsProperty('gymId', gymId))
      ..add(DiagnosticsProperty('attendee', attendee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Unregister &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.attendee, attendee) ||
                const DeepCollectionEquality()
                    .equals(other.attendee, attendee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(attendee);

  @override
  $UnregisterCopyWith<Unregister> get copyWith =>
      _$UnregisterCopyWithImpl<Unregister>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, User currentUser,
            List<Attendee> attendees, List<Attendee> acceptedAttendees),
    @required Result register(String gymId, Attendee attendee),
    @required Result unregister(String gymId, Attendee attendee),
    @required Result acceptAttendees(String gymId),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return unregister(gymId, attendee);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, User currentUser,
        List<Attendee> attendees, List<Attendee> acceptedAttendees),
    Result register(String gymId, Attendee attendee),
    Result unregister(String gymId, Attendee attendee),
    Result acceptAttendees(String gymId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregister != null) {
      return unregister(gymId, attendee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUpdated(RegistryUpdated value),
    @required Result register(Register value),
    @required Result unregister(Unregister value),
    @required Result acceptAttendees(AcceptAttendees value),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return unregister(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUpdated(RegistryUpdated value),
    Result register(Register value),
    Result unregister(Unregister value),
    Result acceptAttendees(AcceptAttendees value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregister != null) {
      return unregister(this);
    }
    return orElse();
  }
}

abstract class Unregister implements RegistryEvent {
  const factory Unregister(
      {@required String gymId, @required Attendee attendee}) = _$Unregister;

  String get gymId;
  Attendee get attendee;
  $UnregisterCopyWith<Unregister> get copyWith;
}

/// @nodoc
abstract class $AcceptAttendeesCopyWith<$Res> {
  factory $AcceptAttendeesCopyWith(
          AcceptAttendees value, $Res Function(AcceptAttendees) then) =
      _$AcceptAttendeesCopyWithImpl<$Res>;
  $Res call({String gymId});
}

/// @nodoc
class _$AcceptAttendeesCopyWithImpl<$Res>
    extends _$RegistryEventCopyWithImpl<$Res>
    implements $AcceptAttendeesCopyWith<$Res> {
  _$AcceptAttendeesCopyWithImpl(
      AcceptAttendees _value, $Res Function(AcceptAttendees) _then)
      : super(_value, (v) => _then(v as AcceptAttendees));

  @override
  AcceptAttendees get _value => super._value as AcceptAttendees;

  @override
  $Res call({
    Object gymId = freezed,
  }) {
    return _then(AcceptAttendees(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
    ));
  }
}

/// @nodoc
class _$AcceptAttendees
    with DiagnosticableTreeMixin
    implements AcceptAttendees {
  const _$AcceptAttendees({@required this.gymId}) : assert(gymId != null);

  @override
  final String gymId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.acceptAttendees(gymId: $gymId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.acceptAttendees'))
      ..add(DiagnosticsProperty('gymId', gymId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AcceptAttendees &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gymId);

  @override
  $AcceptAttendeesCopyWith<AcceptAttendees> get copyWith =>
      _$AcceptAttendeesCopyWithImpl<AcceptAttendees>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, User currentUser,
            List<Attendee> attendees, List<Attendee> acceptedAttendees),
    @required Result register(String gymId, Attendee attendee),
    @required Result unregister(String gymId, Attendee attendee),
    @required Result acceptAttendees(String gymId),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return acceptAttendees(gymId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, User currentUser,
        List<Attendee> attendees, List<Attendee> acceptedAttendees),
    Result register(String gymId, Attendee attendee),
    Result unregister(String gymId, Attendee attendee),
    Result acceptAttendees(String gymId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptAttendees != null) {
      return acceptAttendees(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUpdated(RegistryUpdated value),
    @required Result register(Register value),
    @required Result unregister(Unregister value),
    @required Result acceptAttendees(AcceptAttendees value),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return acceptAttendees(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUpdated(RegistryUpdated value),
    Result register(Register value),
    Result unregister(Unregister value),
    Result acceptAttendees(AcceptAttendees value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptAttendees != null) {
      return acceptAttendees(this);
    }
    return orElse();
  }
}

abstract class AcceptAttendees implements RegistryEvent {
  const factory AcceptAttendees({@required String gymId}) = _$AcceptAttendees;

  String get gymId;
  $AcceptAttendeesCopyWith<AcceptAttendees> get copyWith;
}
