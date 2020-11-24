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
      {@required User currentUser, Lesson currentLesson}) {
    return RegistryUpdated(
      currentUser: currentUser,
      currentLesson: currentLesson,
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
  TResult when<TResult extends Object>({
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    @required TResult orElse(),
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
  $Res call({User currentUser, Lesson currentLesson});

  $LessonCopyWith<$Res> get currentLesson;
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
    Object currentUser = freezed,
    Object currentLesson = freezed,
  }) {
    return _then(RegistryUpdated(
      currentUser:
          currentUser == freezed ? _value.currentUser : currentUser as User,
      currentLesson: currentLesson == freezed
          ? _value.currentLesson
          : currentLesson as Lesson,
    ));
  }

  @override
  $LessonCopyWith<$Res> get currentLesson {
    if (_value.currentLesson == null) {
      return null;
    }
    return $LessonCopyWith<$Res>(_value.currentLesson, (value) {
      return _then(_value.copyWith(currentLesson: value));
    });
  }
}

/// @nodoc
class _$RegistryUpdated
    with DiagnosticableTreeMixin
    implements RegistryUpdated {
  const _$RegistryUpdated({@required this.currentUser, this.currentLesson})
      : assert(currentUser != null);

  @override
  final User currentUser;
  @override
  final Lesson currentLesson;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.registryUpdated(currentUser: $currentUser, currentLesson: $currentLesson)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.registryUpdated'))
      ..add(DiagnosticsProperty('currentUser', currentUser))
      ..add(DiagnosticsProperty('currentLesson', currentLesson));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegistryUpdated &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)) &&
            (identical(other.currentLesson, currentLesson) ||
                const DeepCollectionEquality()
                    .equals(other.currentLesson, currentLesson)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(currentLesson);

  @override
  $RegistryUpdatedCopyWith<RegistryUpdated> get copyWith =>
      _$RegistryUpdatedCopyWithImpl<RegistryUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return registryUpdated(currentUser, currentLesson);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registryUpdated != null) {
      return registryUpdated(currentUser, currentLesson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return registryUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    @required TResult orElse(),
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
      {@required User currentUser, Lesson currentLesson}) = _$RegistryUpdated;

  User get currentUser;
  Lesson get currentLesson;
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
  TResult when<TResult extends Object>({
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return register(gymId, attendee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (register != null) {
      return register(gymId, attendee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    @required TResult orElse(),
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
  TResult when<TResult extends Object>({
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return unregister(gymId, attendee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unregister != null) {
      return unregister(gymId, attendee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return unregister(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    @required TResult orElse(),
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
  TResult when<TResult extends Object>({
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return acceptAttendees(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (acceptAttendees != null) {
      return acceptAttendees(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
  }) {
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    return acceptAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    @required TResult orElse(),
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
