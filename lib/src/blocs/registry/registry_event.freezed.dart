// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'registry_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegistryEventTearOff {
  const _$RegistryEventTearOff();

  InitializeRegistry initializeRegistry() {
    return const InitializeRegistry();
  }

  RegistryUpdated registryUpdated(
      {required User currentUser, Lesson? currentLesson}) {
    return RegistryUpdated(
      currentUser: currentUser,
      currentLesson: currentLesson,
    );
  }

  Register register({required String gymId, required Attendee attendee}) {
    return Register(
      gymId: gymId,
      attendee: attendee,
    );
  }

  Unregister unregister({required String gymId, required Attendee attendee}) {
    return Unregister(
      gymId: gymId,
      attendee: attendee,
    );
  }

  AcceptAttendees acceptAttendees({required String gymId}) {
    return AcceptAttendees(
      gymId: gymId,
    );
  }

  CloseLesson closeLesson({required String gymId}) {
    return CloseLesson(
      gymId: gymId,
    );
  }

  DeleteLesson deleteLesson({required String gymId}) {
    return DeleteLesson(
      gymId: gymId,
    );
  }
}

/// @nodoc
const $RegistryEvent = _$RegistryEventTearOff();

/// @nodoc
mixin _$RegistryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeRegistry,
    required TResult Function(User currentUser, Lesson? currentLesson)
        registryUpdated,
    required TResult Function(String gymId, Attendee attendee) register,
    required TResult Function(String gymId, Attendee attendee) unregister,
    required TResult Function(String gymId) acceptAttendees,
    required TResult Function(String gymId) closeLesson,
    required TResult Function(String gymId) deleteLesson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeRegistry,
    TResult Function(User currentUser, Lesson? currentLesson)? registryUpdated,
    TResult Function(String gymId, Attendee attendee)? register,
    TResult Function(String gymId, Attendee attendee)? unregister,
    TResult Function(String gymId)? acceptAttendees,
    TResult Function(String gymId)? closeLesson,
    TResult Function(String gymId)? deleteLesson,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeRegistry value) initializeRegistry,
    required TResult Function(RegistryUpdated value) registryUpdated,
    required TResult Function(Register value) register,
    required TResult Function(Unregister value) unregister,
    required TResult Function(AcceptAttendees value) acceptAttendees,
    required TResult Function(CloseLesson value) closeLesson,
    required TResult Function(DeleteLesson value) deleteLesson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeRegistry value)? initializeRegistry,
    TResult Function(RegistryUpdated value)? registryUpdated,
    TResult Function(Register value)? register,
    TResult Function(Unregister value)? unregister,
    TResult Function(AcceptAttendees value)? acceptAttendees,
    TResult Function(CloseLesson value)? closeLesson,
    TResult Function(DeleteLesson value)? deleteLesson,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
abstract class $InitializeRegistryCopyWith<$Res> {
  factory $InitializeRegistryCopyWith(
          InitializeRegistry value, $Res Function(InitializeRegistry) then) =
      _$InitializeRegistryCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeRegistryCopyWithImpl<$Res>
    extends _$RegistryEventCopyWithImpl<$Res>
    implements $InitializeRegistryCopyWith<$Res> {
  _$InitializeRegistryCopyWithImpl(
      InitializeRegistry _value, $Res Function(InitializeRegistry) _then)
      : super(_value, (v) => _then(v as InitializeRegistry));

  @override
  InitializeRegistry get _value => super._value as InitializeRegistry;
}

/// @nodoc

class _$InitializeRegistry
    with DiagnosticableTreeMixin
    implements InitializeRegistry {
  const _$InitializeRegistry();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.initializeRegistry()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.initializeRegistry'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeRegistry);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeRegistry,
    required TResult Function(User currentUser, Lesson? currentLesson)
        registryUpdated,
    required TResult Function(String gymId, Attendee attendee) register,
    required TResult Function(String gymId, Attendee attendee) unregister,
    required TResult Function(String gymId) acceptAttendees,
    required TResult Function(String gymId) closeLesson,
    required TResult Function(String gymId) deleteLesson,
  }) {
    return initializeRegistry();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeRegistry,
    TResult Function(User currentUser, Lesson? currentLesson)? registryUpdated,
    TResult Function(String gymId, Attendee attendee)? register,
    TResult Function(String gymId, Attendee attendee)? unregister,
    TResult Function(String gymId)? acceptAttendees,
    TResult Function(String gymId)? closeLesson,
    TResult Function(String gymId)? deleteLesson,
    required TResult orElse(),
  }) {
    if (initializeRegistry != null) {
      return initializeRegistry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeRegistry value) initializeRegistry,
    required TResult Function(RegistryUpdated value) registryUpdated,
    required TResult Function(Register value) register,
    required TResult Function(Unregister value) unregister,
    required TResult Function(AcceptAttendees value) acceptAttendees,
    required TResult Function(CloseLesson value) closeLesson,
    required TResult Function(DeleteLesson value) deleteLesson,
  }) {
    return initializeRegistry(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeRegistry value)? initializeRegistry,
    TResult Function(RegistryUpdated value)? registryUpdated,
    TResult Function(Register value)? register,
    TResult Function(Unregister value)? unregister,
    TResult Function(AcceptAttendees value)? acceptAttendees,
    TResult Function(CloseLesson value)? closeLesson,
    TResult Function(DeleteLesson value)? deleteLesson,
    required TResult orElse(),
  }) {
    if (initializeRegistry != null) {
      return initializeRegistry(this);
    }
    return orElse();
  }
}

abstract class InitializeRegistry implements RegistryEvent {
  const factory InitializeRegistry() = _$InitializeRegistry;
}

/// @nodoc
abstract class $RegistryUpdatedCopyWith<$Res> {
  factory $RegistryUpdatedCopyWith(
          RegistryUpdated value, $Res Function(RegistryUpdated) then) =
      _$RegistryUpdatedCopyWithImpl<$Res>;
  $Res call({User currentUser, Lesson? currentLesson});

  $UserCopyWith<$Res> get currentUser;
  $LessonCopyWith<$Res>? get currentLesson;
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
    Object? currentUser = freezed,
    Object? currentLesson = freezed,
  }) {
    return _then(RegistryUpdated(
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User,
      currentLesson: currentLesson == freezed
          ? _value.currentLesson
          : currentLesson // ignore: cast_nullable_to_non_nullable
              as Lesson?,
    ));
  }

  @override
  $UserCopyWith<$Res> get currentUser {
    return $UserCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value));
    });
  }

  @override
  $LessonCopyWith<$Res>? get currentLesson {
    if (_value.currentLesson == null) {
      return null;
    }

    return $LessonCopyWith<$Res>(_value.currentLesson!, (value) {
      return _then(_value.copyWith(currentLesson: value));
    });
  }
}

/// @nodoc

class _$RegistryUpdated
    with DiagnosticableTreeMixin
    implements RegistryUpdated {
  const _$RegistryUpdated({required this.currentUser, this.currentLesson});

  @override
  final User currentUser;
  @override
  final Lesson? currentLesson;

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

  @JsonKey(ignore: true)
  @override
  $RegistryUpdatedCopyWith<RegistryUpdated> get copyWith =>
      _$RegistryUpdatedCopyWithImpl<RegistryUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeRegistry,
    required TResult Function(User currentUser, Lesson? currentLesson)
        registryUpdated,
    required TResult Function(String gymId, Attendee attendee) register,
    required TResult Function(String gymId, Attendee attendee) unregister,
    required TResult Function(String gymId) acceptAttendees,
    required TResult Function(String gymId) closeLesson,
    required TResult Function(String gymId) deleteLesson,
  }) {
    return registryUpdated(currentUser, currentLesson);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeRegistry,
    TResult Function(User currentUser, Lesson? currentLesson)? registryUpdated,
    TResult Function(String gymId, Attendee attendee)? register,
    TResult Function(String gymId, Attendee attendee)? unregister,
    TResult Function(String gymId)? acceptAttendees,
    TResult Function(String gymId)? closeLesson,
    TResult Function(String gymId)? deleteLesson,
    required TResult orElse(),
  }) {
    if (registryUpdated != null) {
      return registryUpdated(currentUser, currentLesson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeRegistry value) initializeRegistry,
    required TResult Function(RegistryUpdated value) registryUpdated,
    required TResult Function(Register value) register,
    required TResult Function(Unregister value) unregister,
    required TResult Function(AcceptAttendees value) acceptAttendees,
    required TResult Function(CloseLesson value) closeLesson,
    required TResult Function(DeleteLesson value) deleteLesson,
  }) {
    return registryUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeRegistry value)? initializeRegistry,
    TResult Function(RegistryUpdated value)? registryUpdated,
    TResult Function(Register value)? register,
    TResult Function(Unregister value)? unregister,
    TResult Function(AcceptAttendees value)? acceptAttendees,
    TResult Function(CloseLesson value)? closeLesson,
    TResult Function(DeleteLesson value)? deleteLesson,
    required TResult orElse(),
  }) {
    if (registryUpdated != null) {
      return registryUpdated(this);
    }
    return orElse();
  }
}

abstract class RegistryUpdated implements RegistryEvent {
  const factory RegistryUpdated(
      {required User currentUser, Lesson? currentLesson}) = _$RegistryUpdated;

  User get currentUser => throw _privateConstructorUsedError;
  Lesson? get currentLesson => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistryUpdatedCopyWith<RegistryUpdated> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? gymId = freezed,
    Object? attendee = freezed,
  }) {
    return _then(Register(
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      attendee: attendee == freezed
          ? _value.attendee
          : attendee // ignore: cast_nullable_to_non_nullable
              as Attendee,
    ));
  }
}

/// @nodoc

class _$Register with DiagnosticableTreeMixin implements Register {
  const _$Register({required this.gymId, required this.attendee});

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

  @JsonKey(ignore: true)
  @override
  $RegisterCopyWith<Register> get copyWith =>
      _$RegisterCopyWithImpl<Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeRegistry,
    required TResult Function(User currentUser, Lesson? currentLesson)
        registryUpdated,
    required TResult Function(String gymId, Attendee attendee) register,
    required TResult Function(String gymId, Attendee attendee) unregister,
    required TResult Function(String gymId) acceptAttendees,
    required TResult Function(String gymId) closeLesson,
    required TResult Function(String gymId) deleteLesson,
  }) {
    return register(gymId, attendee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeRegistry,
    TResult Function(User currentUser, Lesson? currentLesson)? registryUpdated,
    TResult Function(String gymId, Attendee attendee)? register,
    TResult Function(String gymId, Attendee attendee)? unregister,
    TResult Function(String gymId)? acceptAttendees,
    TResult Function(String gymId)? closeLesson,
    TResult Function(String gymId)? deleteLesson,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(gymId, attendee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeRegistry value) initializeRegistry,
    required TResult Function(RegistryUpdated value) registryUpdated,
    required TResult Function(Register value) register,
    required TResult Function(Unregister value) unregister,
    required TResult Function(AcceptAttendees value) acceptAttendees,
    required TResult Function(CloseLesson value) closeLesson,
    required TResult Function(DeleteLesson value) deleteLesson,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeRegistry value)? initializeRegistry,
    TResult Function(RegistryUpdated value)? registryUpdated,
    TResult Function(Register value)? register,
    TResult Function(Unregister value)? unregister,
    TResult Function(AcceptAttendees value)? acceptAttendees,
    TResult Function(CloseLesson value)? closeLesson,
    TResult Function(DeleteLesson value)? deleteLesson,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class Register implements RegistryEvent {
  const factory Register({required String gymId, required Attendee attendee}) =
      _$Register;

  String get gymId => throw _privateConstructorUsedError;
  Attendee get attendee => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterCopyWith<Register> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? gymId = freezed,
    Object? attendee = freezed,
  }) {
    return _then(Unregister(
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      attendee: attendee == freezed
          ? _value.attendee
          : attendee // ignore: cast_nullable_to_non_nullable
              as Attendee,
    ));
  }
}

/// @nodoc

class _$Unregister with DiagnosticableTreeMixin implements Unregister {
  const _$Unregister({required this.gymId, required this.attendee});

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

  @JsonKey(ignore: true)
  @override
  $UnregisterCopyWith<Unregister> get copyWith =>
      _$UnregisterCopyWithImpl<Unregister>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeRegistry,
    required TResult Function(User currentUser, Lesson? currentLesson)
        registryUpdated,
    required TResult Function(String gymId, Attendee attendee) register,
    required TResult Function(String gymId, Attendee attendee) unregister,
    required TResult Function(String gymId) acceptAttendees,
    required TResult Function(String gymId) closeLesson,
    required TResult Function(String gymId) deleteLesson,
  }) {
    return unregister(gymId, attendee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeRegistry,
    TResult Function(User currentUser, Lesson? currentLesson)? registryUpdated,
    TResult Function(String gymId, Attendee attendee)? register,
    TResult Function(String gymId, Attendee attendee)? unregister,
    TResult Function(String gymId)? acceptAttendees,
    TResult Function(String gymId)? closeLesson,
    TResult Function(String gymId)? deleteLesson,
    required TResult orElse(),
  }) {
    if (unregister != null) {
      return unregister(gymId, attendee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeRegistry value) initializeRegistry,
    required TResult Function(RegistryUpdated value) registryUpdated,
    required TResult Function(Register value) register,
    required TResult Function(Unregister value) unregister,
    required TResult Function(AcceptAttendees value) acceptAttendees,
    required TResult Function(CloseLesson value) closeLesson,
    required TResult Function(DeleteLesson value) deleteLesson,
  }) {
    return unregister(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeRegistry value)? initializeRegistry,
    TResult Function(RegistryUpdated value)? registryUpdated,
    TResult Function(Register value)? register,
    TResult Function(Unregister value)? unregister,
    TResult Function(AcceptAttendees value)? acceptAttendees,
    TResult Function(CloseLesson value)? closeLesson,
    TResult Function(DeleteLesson value)? deleteLesson,
    required TResult orElse(),
  }) {
    if (unregister != null) {
      return unregister(this);
    }
    return orElse();
  }
}

abstract class Unregister implements RegistryEvent {
  const factory Unregister(
      {required String gymId, required Attendee attendee}) = _$Unregister;

  String get gymId => throw _privateConstructorUsedError;
  Attendee get attendee => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnregisterCopyWith<Unregister> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? gymId = freezed,
  }) {
    return _then(AcceptAttendees(
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AcceptAttendees
    with DiagnosticableTreeMixin
    implements AcceptAttendees {
  const _$AcceptAttendees({required this.gymId});

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

  @JsonKey(ignore: true)
  @override
  $AcceptAttendeesCopyWith<AcceptAttendees> get copyWith =>
      _$AcceptAttendeesCopyWithImpl<AcceptAttendees>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeRegistry,
    required TResult Function(User currentUser, Lesson? currentLesson)
        registryUpdated,
    required TResult Function(String gymId, Attendee attendee) register,
    required TResult Function(String gymId, Attendee attendee) unregister,
    required TResult Function(String gymId) acceptAttendees,
    required TResult Function(String gymId) closeLesson,
    required TResult Function(String gymId) deleteLesson,
  }) {
    return acceptAttendees(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeRegistry,
    TResult Function(User currentUser, Lesson? currentLesson)? registryUpdated,
    TResult Function(String gymId, Attendee attendee)? register,
    TResult Function(String gymId, Attendee attendee)? unregister,
    TResult Function(String gymId)? acceptAttendees,
    TResult Function(String gymId)? closeLesson,
    TResult Function(String gymId)? deleteLesson,
    required TResult orElse(),
  }) {
    if (acceptAttendees != null) {
      return acceptAttendees(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeRegistry value) initializeRegistry,
    required TResult Function(RegistryUpdated value) registryUpdated,
    required TResult Function(Register value) register,
    required TResult Function(Unregister value) unregister,
    required TResult Function(AcceptAttendees value) acceptAttendees,
    required TResult Function(CloseLesson value) closeLesson,
    required TResult Function(DeleteLesson value) deleteLesson,
  }) {
    return acceptAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeRegistry value)? initializeRegistry,
    TResult Function(RegistryUpdated value)? registryUpdated,
    TResult Function(Register value)? register,
    TResult Function(Unregister value)? unregister,
    TResult Function(AcceptAttendees value)? acceptAttendees,
    TResult Function(CloseLesson value)? closeLesson,
    TResult Function(DeleteLesson value)? deleteLesson,
    required TResult orElse(),
  }) {
    if (acceptAttendees != null) {
      return acceptAttendees(this);
    }
    return orElse();
  }
}

abstract class AcceptAttendees implements RegistryEvent {
  const factory AcceptAttendees({required String gymId}) = _$AcceptAttendees;

  String get gymId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcceptAttendeesCopyWith<AcceptAttendees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloseLessonCopyWith<$Res> {
  factory $CloseLessonCopyWith(
          CloseLesson value, $Res Function(CloseLesson) then) =
      _$CloseLessonCopyWithImpl<$Res>;
  $Res call({String gymId});
}

/// @nodoc
class _$CloseLessonCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $CloseLessonCopyWith<$Res> {
  _$CloseLessonCopyWithImpl(
      CloseLesson _value, $Res Function(CloseLesson) _then)
      : super(_value, (v) => _then(v as CloseLesson));

  @override
  CloseLesson get _value => super._value as CloseLesson;

  @override
  $Res call({
    Object? gymId = freezed,
  }) {
    return _then(CloseLesson(
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CloseLesson with DiagnosticableTreeMixin implements CloseLesson {
  const _$CloseLesson({required this.gymId});

  @override
  final String gymId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.closeLesson(gymId: $gymId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.closeLesson'))
      ..add(DiagnosticsProperty('gymId', gymId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CloseLesson &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gymId);

  @JsonKey(ignore: true)
  @override
  $CloseLessonCopyWith<CloseLesson> get copyWith =>
      _$CloseLessonCopyWithImpl<CloseLesson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeRegistry,
    required TResult Function(User currentUser, Lesson? currentLesson)
        registryUpdated,
    required TResult Function(String gymId, Attendee attendee) register,
    required TResult Function(String gymId, Attendee attendee) unregister,
    required TResult Function(String gymId) acceptAttendees,
    required TResult Function(String gymId) closeLesson,
    required TResult Function(String gymId) deleteLesson,
  }) {
    return closeLesson(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeRegistry,
    TResult Function(User currentUser, Lesson? currentLesson)? registryUpdated,
    TResult Function(String gymId, Attendee attendee)? register,
    TResult Function(String gymId, Attendee attendee)? unregister,
    TResult Function(String gymId)? acceptAttendees,
    TResult Function(String gymId)? closeLesson,
    TResult Function(String gymId)? deleteLesson,
    required TResult orElse(),
  }) {
    if (closeLesson != null) {
      return closeLesson(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeRegistry value) initializeRegistry,
    required TResult Function(RegistryUpdated value) registryUpdated,
    required TResult Function(Register value) register,
    required TResult Function(Unregister value) unregister,
    required TResult Function(AcceptAttendees value) acceptAttendees,
    required TResult Function(CloseLesson value) closeLesson,
    required TResult Function(DeleteLesson value) deleteLesson,
  }) {
    return closeLesson(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeRegistry value)? initializeRegistry,
    TResult Function(RegistryUpdated value)? registryUpdated,
    TResult Function(Register value)? register,
    TResult Function(Unregister value)? unregister,
    TResult Function(AcceptAttendees value)? acceptAttendees,
    TResult Function(CloseLesson value)? closeLesson,
    TResult Function(DeleteLesson value)? deleteLesson,
    required TResult orElse(),
  }) {
    if (closeLesson != null) {
      return closeLesson(this);
    }
    return orElse();
  }
}

abstract class CloseLesson implements RegistryEvent {
  const factory CloseLesson({required String gymId}) = _$CloseLesson;

  String get gymId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloseLessonCopyWith<CloseLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteLessonCopyWith<$Res> {
  factory $DeleteLessonCopyWith(
          DeleteLesson value, $Res Function(DeleteLesson) then) =
      _$DeleteLessonCopyWithImpl<$Res>;
  $Res call({String gymId});
}

/// @nodoc
class _$DeleteLessonCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $DeleteLessonCopyWith<$Res> {
  _$DeleteLessonCopyWithImpl(
      DeleteLesson _value, $Res Function(DeleteLesson) _then)
      : super(_value, (v) => _then(v as DeleteLesson));

  @override
  DeleteLesson get _value => super._value as DeleteLesson;

  @override
  $Res call({
    Object? gymId = freezed,
  }) {
    return _then(DeleteLesson(
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteLesson with DiagnosticableTreeMixin implements DeleteLesson {
  const _$DeleteLesson({required this.gymId});

  @override
  final String gymId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.deleteLesson(gymId: $gymId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.deleteLesson'))
      ..add(DiagnosticsProperty('gymId', gymId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteLesson &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gymId);

  @JsonKey(ignore: true)
  @override
  $DeleteLessonCopyWith<DeleteLesson> get copyWith =>
      _$DeleteLessonCopyWithImpl<DeleteLesson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeRegistry,
    required TResult Function(User currentUser, Lesson? currentLesson)
        registryUpdated,
    required TResult Function(String gymId, Attendee attendee) register,
    required TResult Function(String gymId, Attendee attendee) unregister,
    required TResult Function(String gymId) acceptAttendees,
    required TResult Function(String gymId) closeLesson,
    required TResult Function(String gymId) deleteLesson,
  }) {
    return deleteLesson(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeRegistry,
    TResult Function(User currentUser, Lesson? currentLesson)? registryUpdated,
    TResult Function(String gymId, Attendee attendee)? register,
    TResult Function(String gymId, Attendee attendee)? unregister,
    TResult Function(String gymId)? acceptAttendees,
    TResult Function(String gymId)? closeLesson,
    TResult Function(String gymId)? deleteLesson,
    required TResult orElse(),
  }) {
    if (deleteLesson != null) {
      return deleteLesson(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeRegistry value) initializeRegistry,
    required TResult Function(RegistryUpdated value) registryUpdated,
    required TResult Function(Register value) register,
    required TResult Function(Unregister value) unregister,
    required TResult Function(AcceptAttendees value) acceptAttendees,
    required TResult Function(CloseLesson value) closeLesson,
    required TResult Function(DeleteLesson value) deleteLesson,
  }) {
    return deleteLesson(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeRegistry value)? initializeRegistry,
    TResult Function(RegistryUpdated value)? registryUpdated,
    TResult Function(Register value)? register,
    TResult Function(Unregister value)? unregister,
    TResult Function(AcceptAttendees value)? acceptAttendees,
    TResult Function(CloseLesson value)? closeLesson,
    TResult Function(DeleteLesson value)? deleteLesson,
    required TResult orElse(),
  }) {
    if (deleteLesson != null) {
      return deleteLesson(this);
    }
    return orElse();
  }
}

abstract class DeleteLesson implements RegistryEvent {
  const factory DeleteLesson({required String gymId}) = _$DeleteLesson;

  String get gymId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteLessonCopyWith<DeleteLesson> get copyWith =>
      throw _privateConstructorUsedError;
}
