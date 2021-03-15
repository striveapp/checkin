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
  InitializeRegistry initializeRegistry() {
    return const InitializeRegistry();
  }

// ignore: unused_element
  RegistryUpdated registryUpdated({@required User currentUser, Lesson currentLesson}) {
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

// ignore: unused_element
  CloseLesson closeLesson({@required String gymId}) {
    return CloseLesson(
      gymId: gymId,
    );
  }

// ignore: unused_element
  DeleteLesson deleteLesson({@required String gymId}) {
    return DeleteLesson(
      gymId: gymId,
    );
  }

// ignore: unused_element
  RetrieveMasters retrieveMasters({@required String gymId}) {
    return RetrieveMasters(
      gymId: gymId,
    );
  }

// ignore: unused_element
  UpdateTimeStart updateTimeStart({@required String gymId, @required String newTimeStart}) {
    return UpdateTimeStart(
      gymId: gymId,
      newTimeStart: newTimeStart,
    );
  }

// ignore: unused_element
  UpdateTimeEnd updateTimeEnd({@required String gymId, @required String newTimeEnd}) {
    return UpdateTimeEnd(
      gymId: gymId,
      newTimeEnd: newTimeEnd,
    );
  }

// ignore: unused_element
  UpdateName updateName({@required String gymId, @required String newName}) {
    return UpdateName(
      gymId: gymId,
      newName: newName,
    );
  }

// ignore: unused_element
  UpdateCapacity updateCapacity({@required String gymId, @required int newCapacity}) {
    return UpdateCapacity(
      gymId: gymId,
      newCapacity: newCapacity,
    );
  }

// ignore: unused_element
  UpdateImageUrl updateImageUrl({@required String gymId}) {
    return UpdateImageUrl(
      gymId: gymId,
    );
  }

// ignore: unused_element
  UpdateMasters updateMasters({@required String gymId, @required List<Master> newMasters}) {
    return UpdateMasters(
      gymId: gymId,
      newMasters: newMasters,
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
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RegistryEventCopyWith<$Res> {
  factory $RegistryEventCopyWith(RegistryEvent value, $Res Function(RegistryEvent) then) =
      _$RegistryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistryEventCopyWithImpl<$Res> implements $RegistryEventCopyWith<$Res> {
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
class _$InitializeRegistryCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $InitializeRegistryCopyWith<$Res> {
  _$InitializeRegistryCopyWithImpl(
      InitializeRegistry _value, $Res Function(InitializeRegistry) _then)
      : super(_value, (v) => _then(v as InitializeRegistry));

  @override
  InitializeRegistry get _value => super._value as InitializeRegistry;
}

/// @nodoc
class _$InitializeRegistry with DiagnosticableTreeMixin implements InitializeRegistry {
  const _$InitializeRegistry();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.initializeRegistry()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RegistryEvent.initializeRegistry'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeRegistry);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return initializeRegistry();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeRegistry != null) {
      return initializeRegistry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return initializeRegistry(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
  factory $RegistryUpdatedCopyWith(RegistryUpdated value, $Res Function(RegistryUpdated) then) =
      _$RegistryUpdatedCopyWithImpl<$Res>;
  $Res call({User currentUser, Lesson currentLesson});

  $UserCopyWith<$Res> get currentUser;
  $LessonCopyWith<$Res> get currentLesson;
}

/// @nodoc
class _$RegistryUpdatedCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $RegistryUpdatedCopyWith<$Res> {
  _$RegistryUpdatedCopyWithImpl(RegistryUpdated _value, $Res Function(RegistryUpdated) _then)
      : super(_value, (v) => _then(v as RegistryUpdated));

  @override
  RegistryUpdated get _value => super._value as RegistryUpdated;

  @override
  $Res call({
    Object currentUser = freezed,
    Object currentLesson = freezed,
  }) {
    return _then(RegistryUpdated(
      currentUser: currentUser == freezed ? _value.currentUser : currentUser as User,
      currentLesson: currentLesson == freezed ? _value.currentLesson : currentLesson as Lesson,
    ));
  }

  @override
  $UserCopyWith<$Res> get currentUser {
    if (_value.currentUser == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value));
    });
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
class _$RegistryUpdated with DiagnosticableTreeMixin implements RegistryUpdated {
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
                const DeepCollectionEquality().equals(other.currentUser, currentUser)) &&
            (identical(other.currentLesson, currentLesson) ||
                const DeepCollectionEquality().equals(other.currentLesson, currentLesson)));
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
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return registryUpdated(currentUser, currentLesson);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
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
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return registryUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
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
  const factory RegistryUpdated({@required User currentUser, Lesson currentLesson}) =
      _$RegistryUpdated;

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
                const DeepCollectionEquality().equals(other.attendee, attendee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(attendee);

  @override
  $RegisterCopyWith<Register> get copyWith => _$RegisterCopyWithImpl<Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return register(gymId, attendee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
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
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
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
  const factory Register({@required String gymId, @required Attendee attendee}) = _$Register;

  String get gymId;
  Attendee get attendee;
  $RegisterCopyWith<Register> get copyWith;
}

/// @nodoc
abstract class $UnregisterCopyWith<$Res> {
  factory $UnregisterCopyWith(Unregister value, $Res Function(Unregister) then) =
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
                const DeepCollectionEquality().equals(other.attendee, attendee)));
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
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return unregister(gymId, attendee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
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
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return unregister(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
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
  const factory Unregister({@required String gymId, @required Attendee attendee}) = _$Unregister;

  String get gymId;
  Attendee get attendee;
  $UnregisterCopyWith<Unregister> get copyWith;
}

/// @nodoc
abstract class $AcceptAttendeesCopyWith<$Res> {
  factory $AcceptAttendeesCopyWith(AcceptAttendees value, $Res Function(AcceptAttendees) then) =
      _$AcceptAttendeesCopyWithImpl<$Res>;
  $Res call({String gymId});
}

/// @nodoc
class _$AcceptAttendeesCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $AcceptAttendeesCopyWith<$Res> {
  _$AcceptAttendeesCopyWithImpl(AcceptAttendees _value, $Res Function(AcceptAttendees) _then)
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
class _$AcceptAttendees with DiagnosticableTreeMixin implements AcceptAttendees {
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
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(gymId);

  @override
  $AcceptAttendeesCopyWith<AcceptAttendees> get copyWith =>
      _$AcceptAttendeesCopyWithImpl<AcceptAttendees>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return acceptAttendees(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
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
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return acceptAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
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

/// @nodoc
abstract class $CloseLessonCopyWith<$Res> {
  factory $CloseLessonCopyWith(CloseLesson value, $Res Function(CloseLesson) then) =
      _$CloseLessonCopyWithImpl<$Res>;
  $Res call({String gymId});
}

/// @nodoc
class _$CloseLessonCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $CloseLessonCopyWith<$Res> {
  _$CloseLessonCopyWithImpl(CloseLesson _value, $Res Function(CloseLesson) _then)
      : super(_value, (v) => _then(v as CloseLesson));

  @override
  CloseLesson get _value => super._value as CloseLesson;

  @override
  $Res call({
    Object gymId = freezed,
  }) {
    return _then(CloseLesson(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
    ));
  }
}

/// @nodoc
class _$CloseLesson with DiagnosticableTreeMixin implements CloseLesson {
  const _$CloseLesson({@required this.gymId}) : assert(gymId != null);

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
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(gymId);

  @override
  $CloseLessonCopyWith<CloseLesson> get copyWith =>
      _$CloseLessonCopyWithImpl<CloseLesson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return closeLesson(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (closeLesson != null) {
      return closeLesson(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return closeLesson(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (closeLesson != null) {
      return closeLesson(this);
    }
    return orElse();
  }
}

abstract class CloseLesson implements RegistryEvent {
  const factory CloseLesson({@required String gymId}) = _$CloseLesson;

  String get gymId;
  $CloseLessonCopyWith<CloseLesson> get copyWith;
}

/// @nodoc
abstract class $DeleteLessonCopyWith<$Res> {
  factory $DeleteLessonCopyWith(DeleteLesson value, $Res Function(DeleteLesson) then) =
      _$DeleteLessonCopyWithImpl<$Res>;
  $Res call({String gymId});
}

/// @nodoc
class _$DeleteLessonCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $DeleteLessonCopyWith<$Res> {
  _$DeleteLessonCopyWithImpl(DeleteLesson _value, $Res Function(DeleteLesson) _then)
      : super(_value, (v) => _then(v as DeleteLesson));

  @override
  DeleteLesson get _value => super._value as DeleteLesson;

  @override
  $Res call({
    Object gymId = freezed,
  }) {
    return _then(DeleteLesson(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
    ));
  }
}

/// @nodoc
class _$DeleteLesson with DiagnosticableTreeMixin implements DeleteLesson {
  const _$DeleteLesson({@required this.gymId}) : assert(gymId != null);

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
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(gymId);

  @override
  $DeleteLessonCopyWith<DeleteLesson> get copyWith =>
      _$DeleteLessonCopyWithImpl<DeleteLesson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return deleteLesson(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteLesson != null) {
      return deleteLesson(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return deleteLesson(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteLesson != null) {
      return deleteLesson(this);
    }
    return orElse();
  }
}

abstract class DeleteLesson implements RegistryEvent {
  const factory DeleteLesson({@required String gymId}) = _$DeleteLesson;

  String get gymId;
  $DeleteLessonCopyWith<DeleteLesson> get copyWith;
}

/// @nodoc
abstract class $RetrieveMastersCopyWith<$Res> {
  factory $RetrieveMastersCopyWith(RetrieveMasters value, $Res Function(RetrieveMasters) then) =
      _$RetrieveMastersCopyWithImpl<$Res>;
  $Res call({String gymId});
}

/// @nodoc
class _$RetrieveMastersCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $RetrieveMastersCopyWith<$Res> {
  _$RetrieveMastersCopyWithImpl(RetrieveMasters _value, $Res Function(RetrieveMasters) _then)
      : super(_value, (v) => _then(v as RetrieveMasters));

  @override
  RetrieveMasters get _value => super._value as RetrieveMasters;

  @override
  $Res call({
    Object gymId = freezed,
  }) {
    return _then(RetrieveMasters(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
    ));
  }
}

/// @nodoc
class _$RetrieveMasters with DiagnosticableTreeMixin implements RetrieveMasters {
  const _$RetrieveMasters({@required this.gymId}) : assert(gymId != null);

  @override
  final String gymId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.retrieveMasters(gymId: $gymId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.retrieveMasters'))
      ..add(DiagnosticsProperty('gymId', gymId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RetrieveMasters &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(gymId);

  @override
  $RetrieveMastersCopyWith<RetrieveMasters> get copyWith =>
      _$RetrieveMastersCopyWithImpl<RetrieveMasters>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return retrieveMasters(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (retrieveMasters != null) {
      return retrieveMasters(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return retrieveMasters(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (retrieveMasters != null) {
      return retrieveMasters(this);
    }
    return orElse();
  }
}

abstract class RetrieveMasters implements RegistryEvent {
  const factory RetrieveMasters({@required String gymId}) = _$RetrieveMasters;

  String get gymId;
  $RetrieveMastersCopyWith<RetrieveMasters> get copyWith;
}

/// @nodoc
abstract class $UpdateTimeStartCopyWith<$Res> {
  factory $UpdateTimeStartCopyWith(UpdateTimeStart value, $Res Function(UpdateTimeStart) then) =
      _$UpdateTimeStartCopyWithImpl<$Res>;
  $Res call({String gymId, String newTimeStart});
}

/// @nodoc
class _$UpdateTimeStartCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $UpdateTimeStartCopyWith<$Res> {
  _$UpdateTimeStartCopyWithImpl(UpdateTimeStart _value, $Res Function(UpdateTimeStart) _then)
      : super(_value, (v) => _then(v as UpdateTimeStart));

  @override
  UpdateTimeStart get _value => super._value as UpdateTimeStart;

  @override
  $Res call({
    Object gymId = freezed,
    Object newTimeStart = freezed,
  }) {
    return _then(UpdateTimeStart(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      newTimeStart: newTimeStart == freezed ? _value.newTimeStart : newTimeStart as String,
    ));
  }
}

/// @nodoc
class _$UpdateTimeStart with DiagnosticableTreeMixin implements UpdateTimeStart {
  const _$UpdateTimeStart({@required this.gymId, @required this.newTimeStart})
      : assert(gymId != null),
        assert(newTimeStart != null);

  @override
  final String gymId;
  @override
  final String newTimeStart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.updateTimeStart(gymId: $gymId, newTimeStart: $newTimeStart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.updateTimeStart'))
      ..add(DiagnosticsProperty('gymId', gymId))
      ..add(DiagnosticsProperty('newTimeStart', newTimeStart));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateTimeStart &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.newTimeStart, newTimeStart) ||
                const DeepCollectionEquality().equals(other.newTimeStart, newTimeStart)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(newTimeStart);

  @override
  $UpdateTimeStartCopyWith<UpdateTimeStart> get copyWith =>
      _$UpdateTimeStartCopyWithImpl<UpdateTimeStart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateTimeStart(gymId, newTimeStart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateTimeStart != null) {
      return updateTimeStart(gymId, newTimeStart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateTimeStart(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateTimeStart != null) {
      return updateTimeStart(this);
    }
    return orElse();
  }
}

abstract class UpdateTimeStart implements RegistryEvent {
  const factory UpdateTimeStart({@required String gymId, @required String newTimeStart}) =
      _$UpdateTimeStart;

  String get gymId;
  String get newTimeStart;
  $UpdateTimeStartCopyWith<UpdateTimeStart> get copyWith;
}

/// @nodoc
abstract class $UpdateTimeEndCopyWith<$Res> {
  factory $UpdateTimeEndCopyWith(UpdateTimeEnd value, $Res Function(UpdateTimeEnd) then) =
      _$UpdateTimeEndCopyWithImpl<$Res>;
  $Res call({String gymId, String newTimeEnd});
}

/// @nodoc
class _$UpdateTimeEndCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $UpdateTimeEndCopyWith<$Res> {
  _$UpdateTimeEndCopyWithImpl(UpdateTimeEnd _value, $Res Function(UpdateTimeEnd) _then)
      : super(_value, (v) => _then(v as UpdateTimeEnd));

  @override
  UpdateTimeEnd get _value => super._value as UpdateTimeEnd;

  @override
  $Res call({
    Object gymId = freezed,
    Object newTimeEnd = freezed,
  }) {
    return _then(UpdateTimeEnd(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      newTimeEnd: newTimeEnd == freezed ? _value.newTimeEnd : newTimeEnd as String,
    ));
  }
}

/// @nodoc
class _$UpdateTimeEnd with DiagnosticableTreeMixin implements UpdateTimeEnd {
  const _$UpdateTimeEnd({@required this.gymId, @required this.newTimeEnd})
      : assert(gymId != null),
        assert(newTimeEnd != null);

  @override
  final String gymId;
  @override
  final String newTimeEnd;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.updateTimeEnd(gymId: $gymId, newTimeEnd: $newTimeEnd)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.updateTimeEnd'))
      ..add(DiagnosticsProperty('gymId', gymId))
      ..add(DiagnosticsProperty('newTimeEnd', newTimeEnd));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateTimeEnd &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.newTimeEnd, newTimeEnd) ||
                const DeepCollectionEquality().equals(other.newTimeEnd, newTimeEnd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(newTimeEnd);

  @override
  $UpdateTimeEndCopyWith<UpdateTimeEnd> get copyWith =>
      _$UpdateTimeEndCopyWithImpl<UpdateTimeEnd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateTimeEnd(gymId, newTimeEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateTimeEnd != null) {
      return updateTimeEnd(gymId, newTimeEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateTimeEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateTimeEnd != null) {
      return updateTimeEnd(this);
    }
    return orElse();
  }
}

abstract class UpdateTimeEnd implements RegistryEvent {
  const factory UpdateTimeEnd({@required String gymId, @required String newTimeEnd}) =
      _$UpdateTimeEnd;

  String get gymId;
  String get newTimeEnd;
  $UpdateTimeEndCopyWith<UpdateTimeEnd> get copyWith;
}

/// @nodoc
abstract class $UpdateNameCopyWith<$Res> {
  factory $UpdateNameCopyWith(UpdateName value, $Res Function(UpdateName) then) =
      _$UpdateNameCopyWithImpl<$Res>;
  $Res call({String gymId, String newName});
}

/// @nodoc
class _$UpdateNameCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $UpdateNameCopyWith<$Res> {
  _$UpdateNameCopyWithImpl(UpdateName _value, $Res Function(UpdateName) _then)
      : super(_value, (v) => _then(v as UpdateName));

  @override
  UpdateName get _value => super._value as UpdateName;

  @override
  $Res call({
    Object gymId = freezed,
    Object newName = freezed,
  }) {
    return _then(UpdateName(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      newName: newName == freezed ? _value.newName : newName as String,
    ));
  }
}

/// @nodoc
class _$UpdateName with DiagnosticableTreeMixin implements UpdateName {
  const _$UpdateName({@required this.gymId, @required this.newName})
      : assert(gymId != null),
        assert(newName != null);

  @override
  final String gymId;
  @override
  final String newName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.updateName(gymId: $gymId, newName: $newName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.updateName'))
      ..add(DiagnosticsProperty('gymId', gymId))
      ..add(DiagnosticsProperty('newName', newName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateName &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.newName, newName) ||
                const DeepCollectionEquality().equals(other.newName, newName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(newName);

  @override
  $UpdateNameCopyWith<UpdateName> get copyWith =>
      _$UpdateNameCopyWithImpl<UpdateName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateName(gymId, newName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateName != null) {
      return updateName(gymId, newName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateName(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateName != null) {
      return updateName(this);
    }
    return orElse();
  }
}

abstract class UpdateName implements RegistryEvent {
  const factory UpdateName({@required String gymId, @required String newName}) = _$UpdateName;

  String get gymId;
  String get newName;
  $UpdateNameCopyWith<UpdateName> get copyWith;
}

/// @nodoc
abstract class $UpdateCapacityCopyWith<$Res> {
  factory $UpdateCapacityCopyWith(UpdateCapacity value, $Res Function(UpdateCapacity) then) =
      _$UpdateCapacityCopyWithImpl<$Res>;
  $Res call({String gymId, int newCapacity});
}

/// @nodoc
class _$UpdateCapacityCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $UpdateCapacityCopyWith<$Res> {
  _$UpdateCapacityCopyWithImpl(UpdateCapacity _value, $Res Function(UpdateCapacity) _then)
      : super(_value, (v) => _then(v as UpdateCapacity));

  @override
  UpdateCapacity get _value => super._value as UpdateCapacity;

  @override
  $Res call({
    Object gymId = freezed,
    Object newCapacity = freezed,
  }) {
    return _then(UpdateCapacity(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      newCapacity: newCapacity == freezed ? _value.newCapacity : newCapacity as int,
    ));
  }
}

/// @nodoc
class _$UpdateCapacity with DiagnosticableTreeMixin implements UpdateCapacity {
  const _$UpdateCapacity({@required this.gymId, @required this.newCapacity})
      : assert(gymId != null),
        assert(newCapacity != null);

  @override
  final String gymId;
  @override
  final int newCapacity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.updateCapacity(gymId: $gymId, newCapacity: $newCapacity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.updateCapacity'))
      ..add(DiagnosticsProperty('gymId', gymId))
      ..add(DiagnosticsProperty('newCapacity', newCapacity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateCapacity &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.newCapacity, newCapacity) ||
                const DeepCollectionEquality().equals(other.newCapacity, newCapacity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(newCapacity);

  @override
  $UpdateCapacityCopyWith<UpdateCapacity> get copyWith =>
      _$UpdateCapacityCopyWithImpl<UpdateCapacity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateCapacity(gymId, newCapacity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateCapacity != null) {
      return updateCapacity(gymId, newCapacity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateCapacity(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateCapacity != null) {
      return updateCapacity(this);
    }
    return orElse();
  }
}

abstract class UpdateCapacity implements RegistryEvent {
  const factory UpdateCapacity({@required String gymId, @required int newCapacity}) =
      _$UpdateCapacity;

  String get gymId;
  int get newCapacity;
  $UpdateCapacityCopyWith<UpdateCapacity> get copyWith;
}

/// @nodoc
abstract class $UpdateImageUrlCopyWith<$Res> {
  factory $UpdateImageUrlCopyWith(UpdateImageUrl value, $Res Function(UpdateImageUrl) then) =
      _$UpdateImageUrlCopyWithImpl<$Res>;
  $Res call({String gymId});
}

/// @nodoc
class _$UpdateImageUrlCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $UpdateImageUrlCopyWith<$Res> {
  _$UpdateImageUrlCopyWithImpl(UpdateImageUrl _value, $Res Function(UpdateImageUrl) _then)
      : super(_value, (v) => _then(v as UpdateImageUrl));

  @override
  UpdateImageUrl get _value => super._value as UpdateImageUrl;

  @override
  $Res call({
    Object gymId = freezed,
  }) {
    return _then(UpdateImageUrl(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
    ));
  }
}

/// @nodoc
class _$UpdateImageUrl with DiagnosticableTreeMixin implements UpdateImageUrl {
  const _$UpdateImageUrl({@required this.gymId}) : assert(gymId != null);

  @override
  final String gymId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.updateImageUrl(gymId: $gymId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.updateImageUrl'))
      ..add(DiagnosticsProperty('gymId', gymId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateImageUrl &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(gymId);

  @override
  $UpdateImageUrlCopyWith<UpdateImageUrl> get copyWith =>
      _$UpdateImageUrlCopyWithImpl<UpdateImageUrl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateImageUrl(gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateImageUrl != null) {
      return updateImageUrl(gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateImageUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateImageUrl != null) {
      return updateImageUrl(this);
    }
    return orElse();
  }
}

abstract class UpdateImageUrl implements RegistryEvent {
  const factory UpdateImageUrl({@required String gymId}) = _$UpdateImageUrl;

  String get gymId;
  $UpdateImageUrlCopyWith<UpdateImageUrl> get copyWith;
}

/// @nodoc
abstract class $UpdateMastersCopyWith<$Res> {
  factory $UpdateMastersCopyWith(UpdateMasters value, $Res Function(UpdateMasters) then) =
      _$UpdateMastersCopyWithImpl<$Res>;
  $Res call({String gymId, List<Master> newMasters});
}

/// @nodoc
class _$UpdateMastersCopyWithImpl<$Res> extends _$RegistryEventCopyWithImpl<$Res>
    implements $UpdateMastersCopyWith<$Res> {
  _$UpdateMastersCopyWithImpl(UpdateMasters _value, $Res Function(UpdateMasters) _then)
      : super(_value, (v) => _then(v as UpdateMasters));

  @override
  UpdateMasters get _value => super._value as UpdateMasters;

  @override
  $Res call({
    Object gymId = freezed,
    Object newMasters = freezed,
  }) {
    return _then(UpdateMasters(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      newMasters: newMasters == freezed ? _value.newMasters : newMasters as List<Master>,
    ));
  }
}

/// @nodoc
class _$UpdateMasters with DiagnosticableTreeMixin implements UpdateMasters {
  const _$UpdateMasters({@required this.gymId, @required this.newMasters})
      : assert(gymId != null),
        assert(newMasters != null);

  @override
  final String gymId;
  @override
  final List<Master> newMasters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryEvent.updateMasters(gymId: $gymId, newMasters: $newMasters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryEvent.updateMasters'))
      ..add(DiagnosticsProperty('gymId', gymId))
      ..add(DiagnosticsProperty('newMasters', newMasters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateMasters &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.newMasters, newMasters) ||
                const DeepCollectionEquality().equals(other.newMasters, newMasters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(newMasters);

  @override
  $UpdateMastersCopyWith<UpdateMasters> get copyWith =>
      _$UpdateMastersCopyWithImpl<UpdateMasters>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeRegistry(),
    @required TResult registryUpdated(User currentUser, Lesson currentLesson),
    @required TResult register(String gymId, Attendee attendee),
    @required TResult unregister(String gymId, Attendee attendee),
    @required TResult acceptAttendees(String gymId),
    @required TResult closeLesson(String gymId),
    @required TResult deleteLesson(String gymId),
    @required TResult retrieveMasters(String gymId),
    @required TResult updateTimeStart(String gymId, String newTimeStart),
    @required TResult updateTimeEnd(String gymId, String newTimeEnd),
    @required TResult updateName(String gymId, String newName),
    @required TResult updateCapacity(String gymId, int newCapacity),
    @required TResult updateImageUrl(String gymId),
    @required TResult updateMasters(String gymId, List<Master> newMasters),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateMasters(gymId, newMasters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeRegistry(),
    TResult registryUpdated(User currentUser, Lesson currentLesson),
    TResult register(String gymId, Attendee attendee),
    TResult unregister(String gymId, Attendee attendee),
    TResult acceptAttendees(String gymId),
    TResult closeLesson(String gymId),
    TResult deleteLesson(String gymId),
    TResult retrieveMasters(String gymId),
    TResult updateTimeStart(String gymId, String newTimeStart),
    TResult updateTimeEnd(String gymId, String newTimeEnd),
    TResult updateName(String gymId, String newName),
    TResult updateCapacity(String gymId, int newCapacity),
    TResult updateImageUrl(String gymId),
    TResult updateMasters(String gymId, List<Master> newMasters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateMasters != null) {
      return updateMasters(gymId, newMasters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeRegistry(InitializeRegistry value),
    @required TResult registryUpdated(RegistryUpdated value),
    @required TResult register(Register value),
    @required TResult unregister(Unregister value),
    @required TResult acceptAttendees(AcceptAttendees value),
    @required TResult closeLesson(CloseLesson value),
    @required TResult deleteLesson(DeleteLesson value),
    @required TResult retrieveMasters(RetrieveMasters value),
    @required TResult updateTimeStart(UpdateTimeStart value),
    @required TResult updateTimeEnd(UpdateTimeEnd value),
    @required TResult updateName(UpdateName value),
    @required TResult updateCapacity(UpdateCapacity value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateMasters(UpdateMasters value),
  }) {
    assert(initializeRegistry != null);
    assert(registryUpdated != null);
    assert(register != null);
    assert(unregister != null);
    assert(acceptAttendees != null);
    assert(closeLesson != null);
    assert(deleteLesson != null);
    assert(retrieveMasters != null);
    assert(updateTimeStart != null);
    assert(updateTimeEnd != null);
    assert(updateName != null);
    assert(updateCapacity != null);
    assert(updateImageUrl != null);
    assert(updateMasters != null);
    return updateMasters(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeRegistry(InitializeRegistry value),
    TResult registryUpdated(RegistryUpdated value),
    TResult register(Register value),
    TResult unregister(Unregister value),
    TResult acceptAttendees(AcceptAttendees value),
    TResult closeLesson(CloseLesson value),
    TResult deleteLesson(DeleteLesson value),
    TResult retrieveMasters(RetrieveMasters value),
    TResult updateTimeStart(UpdateTimeStart value),
    TResult updateTimeEnd(UpdateTimeEnd value),
    TResult updateName(UpdateName value),
    TResult updateCapacity(UpdateCapacity value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateMasters(UpdateMasters value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateMasters != null) {
      return updateMasters(this);
    }
    return orElse();
  }
}

abstract class UpdateMasters implements RegistryEvent {
  const factory UpdateMasters({@required String gymId, @required List<Master> newMasters}) =
      _$UpdateMasters;

  String get gymId;
  List<Master> get newMasters;
  $UpdateMastersCopyWith<UpdateMasters> get copyWith;
}
