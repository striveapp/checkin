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
      {int classCapacity,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees,
      User currentUser}) {
    return RegistryUpdated(
      classCapacity: classCapacity,
      attendees: attendees,
      acceptedAttendees: acceptedAttendees,
      currentUser: currentUser,
    );
  }

// ignore: unused_element
  Register register({Attendee attendee}) {
    return Register(
      attendee: attendee,
    );
  }

// ignore: unused_element
  Unregister unregister({Attendee attendee}) {
    return Unregister(
      attendee: attendee,
    );
  }

// ignore: unused_element
  AcceptAttendees acceptAttendees() {
    return const AcceptAttendees();
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
        Result registryUpdated(int classCapacity, List<Attendee> attendees,
            List<Attendee> acceptedAttendees, User currentUser),
    @required Result register(Attendee attendee),
    @required Result unregister(Attendee attendee),
    @required Result acceptAttendees(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, List<Attendee> attendees,
        List<Attendee> acceptedAttendees, User currentUser),
    Result register(Attendee attendee),
    Result unregister(Attendee attendee),
    Result acceptAttendees(),
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
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees,
      User currentUser});
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
    Object attendees = freezed,
    Object acceptedAttendees = freezed,
    Object currentUser = freezed,
  }) {
    return _then(RegistryUpdated(
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity as int,
      attendees:
          attendees == freezed ? _value.attendees : attendees as List<Attendee>,
      acceptedAttendees: acceptedAttendees == freezed
          ? _value.acceptedAttendees
          : acceptedAttendees as List<Attendee>,
      currentUser:
          currentUser == freezed ? _value.currentUser : currentUser as User,
    ));
  }
}

/// @nodoc
class _$RegistryUpdated
    with DiagnosticableTreeMixin
    implements RegistryUpdated {
  const _$RegistryUpdated(
      {this.classCapacity,
      this.attendees,
      this.acceptedAttendees,
      this.currentUser});

  @override
  final int classCapacity;
  @override
  final List<Attendee> attendees;
  @override
  final List<Attendee> acceptedAttendees;
  @override
  final User currentUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.registryUpdated(classCapacity: $classCapacity, attendees: $attendees, acceptedAttendees: $acceptedAttendees, currentUser: $currentUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.registryUpdated'))
      ..add(DiagnosticsProperty('classCapacity', classCapacity))
      ..add(DiagnosticsProperty('attendees', attendees))
      ..add(DiagnosticsProperty('acceptedAttendees', acceptedAttendees))
      ..add(DiagnosticsProperty('currentUser', currentUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegistryUpdated &&
            (identical(other.classCapacity, classCapacity) ||
                const DeepCollectionEquality()
                    .equals(other.classCapacity, classCapacity)) &&
            (identical(other.attendees, attendees) ||
                const DeepCollectionEquality()
                    .equals(other.attendees, attendees)) &&
            (identical(other.acceptedAttendees, acceptedAttendees) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedAttendees, acceptedAttendees)) &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(classCapacity) ^
      const DeepCollectionEquality().hash(attendees) ^
      const DeepCollectionEquality().hash(acceptedAttendees) ^
      const DeepCollectionEquality().hash(currentUser);

  @override
  $RegistryUpdatedCopyWith<RegistryUpdated> get copyWith =>
      _$RegistryUpdatedCopyWithImpl<RegistryUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, List<Attendee> attendees,
            List<Attendee> acceptedAttendees, User currentUser),
    @required Result register(Attendee attendee),
    @required Result unregister(Attendee attendee),
    @required Result acceptAttendees(),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return registryUpdated(
        classCapacity, attendees, acceptedAttendees, currentUser);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, List<Attendee> attendees,
        List<Attendee> acceptedAttendees, User currentUser),
    Result register(Attendee attendee),
    Result unregister(Attendee attendee),
    Result acceptAttendees(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryUpdated != null) {
      return registryUpdated(
          classCapacity, attendees, acceptedAttendees, currentUser);
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
      {int classCapacity,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees,
      User currentUser}) = _$RegistryUpdated;

  int get classCapacity;
  List<Attendee> get attendees;
  List<Attendee> get acceptedAttendees;
  User get currentUser;
  $RegistryUpdatedCopyWith<RegistryUpdated> get copyWith;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res>;
  $Res call({Attendee attendee});
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
    Object attendee = freezed,
  }) {
    return _then(Register(
      attendee: attendee == freezed ? _value.attendee : attendee as Attendee,
    ));
  }
}

/// @nodoc
class _$Register with DiagnosticableTreeMixin implements Register {
  const _$Register({this.attendee});

  @override
  final Attendee attendee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.register(attendee: $attendee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.register'))
      ..add(DiagnosticsProperty('attendee', attendee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Register &&
            (identical(other.attendee, attendee) ||
                const DeepCollectionEquality()
                    .equals(other.attendee, attendee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(attendee);

  @override
  $RegisterCopyWith<Register> get copyWith =>
      _$RegisterCopyWithImpl<Register>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, List<Attendee> attendees,
            List<Attendee> acceptedAttendees, User currentUser),
    @required Result register(Attendee attendee),
    @required Result unregister(Attendee attendee),
    @required Result acceptAttendees(),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return register(attendee);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, List<Attendee> attendees,
        List<Attendee> acceptedAttendees, User currentUser),
    Result register(Attendee attendee),
    Result unregister(Attendee attendee),
    Result acceptAttendees(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(attendee);
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
  const factory Register({Attendee attendee}) = _$Register;

  Attendee get attendee;
  $RegisterCopyWith<Register> get copyWith;
}

/// @nodoc
abstract class $UnregisterCopyWith<$Res> {
  factory $UnregisterCopyWith(
          Unregister value, $Res Function(Unregister) then) =
      _$UnregisterCopyWithImpl<$Res>;
  $Res call({Attendee attendee});
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
    Object attendee = freezed,
  }) {
    return _then(Unregister(
      attendee: attendee == freezed ? _value.attendee : attendee as Attendee,
    ));
  }
}

/// @nodoc
class _$Unregister with DiagnosticableTreeMixin implements Unregister {
  const _$Unregister({this.attendee});

  @override
  final Attendee attendee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.unregister(attendee: $attendee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.unregister'))
      ..add(DiagnosticsProperty('attendee', attendee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Unregister &&
            (identical(other.attendee, attendee) ||
                const DeepCollectionEquality()
                    .equals(other.attendee, attendee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(attendee);

  @override
  $UnregisterCopyWith<Unregister> get copyWith =>
      _$UnregisterCopyWithImpl<Unregister>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, List<Attendee> attendees,
            List<Attendee> acceptedAttendees, User currentUser),
    @required Result register(Attendee attendee),
    @required Result unregister(Attendee attendee),
    @required Result acceptAttendees(),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return unregister(attendee);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, List<Attendee> attendees,
        List<Attendee> acceptedAttendees, User currentUser),
    Result register(Attendee attendee),
    Result unregister(Attendee attendee),
    Result acceptAttendees(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregister != null) {
      return unregister(attendee);
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
  const factory Unregister({Attendee attendee}) = _$Unregister;

  Attendee get attendee;
  $UnregisterCopyWith<Unregister> get copyWith;
}

/// @nodoc
abstract class $AcceptAttendeesCopyWith<$Res> {
  factory $AcceptAttendeesCopyWith(
          AcceptAttendees value, $Res Function(AcceptAttendees) then) =
      _$AcceptAttendeesCopyWithImpl<$Res>;
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
}

/// @nodoc
class _$AcceptAttendees
    with DiagnosticableTreeMixin
    implements AcceptAttendees {
  const _$AcceptAttendees();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.acceptAttendees()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.acceptAttendees'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AcceptAttendees);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result registryUpdated(int classCapacity, List<Attendee> attendees,
            List<Attendee> acceptedAttendees, User currentUser),
    @required Result register(Attendee attendee),
    @required Result unregister(Attendee attendee),
    @required Result acceptAttendees(),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return acceptAttendees();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUpdated(int classCapacity, List<Attendee> attendees,
        List<Attendee> acceptedAttendees, User currentUser),
    Result register(Attendee attendee),
    Result unregister(Attendee attendee),
    Result acceptAttendees(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (acceptAttendees != null) {
      return acceptAttendees();
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
  const factory AcceptAttendees() = _$AcceptAttendees;
}
