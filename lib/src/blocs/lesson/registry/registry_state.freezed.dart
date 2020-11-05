// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'registry_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RegistryStateTearOff {
  const _$RegistryStateTearOff();

// ignore: unused_element
  RegistryUninitialized registryUninitialized() {
    return const RegistryUninitialized();
  }

// ignore: unused_element
  RegistryLoading registryLoading() {
    return const RegistryLoading();
  }

// ignore: unused_element
  RegistryError registryError() {
    return const RegistryError();
  }

// ignore: unused_element
  RegistryLoaded registryLoaded(
      {@required int classCapacity,
      @required User currentUser,
      @required bool isAcceptedUser,
      @required bool isRegisteredUser,
      @required bool isFullRegistry,
      @required List<Attendee> attendees,
      @required List<Attendee> acceptedAttendees}) {
    return RegistryLoaded(
      classCapacity: classCapacity,
      currentUser: currentUser,
      isAcceptedUser: isAcceptedUser,
      isRegisteredUser: isRegisteredUser,
      isFullRegistry: isFullRegistry,
      attendees: attendees,
      acceptedAttendees: acceptedAttendees,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RegistryState = _$RegistryStateTearOff();

/// @nodoc
mixin _$RegistryState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result registryUninitialized(),
    @required Result registryLoading(),
    @required Result registryError(),
    @required
        Result registryLoaded(
            int classCapacity,
            User currentUser,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            List<Attendee> attendees,
            List<Attendee> acceptedAttendees),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUninitialized(),
    Result registryLoading(),
    Result registryError(),
    Result registryLoaded(
        int classCapacity,
        User currentUser,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        List<Attendee> attendees,
        List<Attendee> acceptedAttendees),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUninitialized(RegistryUninitialized value),
    @required Result registryLoading(RegistryLoading value),
    @required Result registryError(RegistryError value),
    @required Result registryLoaded(RegistryLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUninitialized(RegistryUninitialized value),
    Result registryLoading(RegistryLoading value),
    Result registryError(RegistryError value),
    Result registryLoaded(RegistryLoaded value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $RegistryStateCopyWith<$Res> {
  factory $RegistryStateCopyWith(
          RegistryState value, $Res Function(RegistryState) then) =
      _$RegistryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistryStateCopyWithImpl<$Res>
    implements $RegistryStateCopyWith<$Res> {
  _$RegistryStateCopyWithImpl(this._value, this._then);

  final RegistryState _value;
  // ignore: unused_field
  final $Res Function(RegistryState) _then;
}

/// @nodoc
abstract class $RegistryUninitializedCopyWith<$Res> {
  factory $RegistryUninitializedCopyWith(RegistryUninitialized value,
          $Res Function(RegistryUninitialized) then) =
      _$RegistryUninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistryUninitializedCopyWithImpl<$Res>
    extends _$RegistryStateCopyWithImpl<$Res>
    implements $RegistryUninitializedCopyWith<$Res> {
  _$RegistryUninitializedCopyWithImpl(
      RegistryUninitialized _value, $Res Function(RegistryUninitialized) _then)
      : super(_value, (v) => _then(v as RegistryUninitialized));

  @override
  RegistryUninitialized get _value => super._value as RegistryUninitialized;
}

/// @nodoc
class _$RegistryUninitialized
    with DiagnosticableTreeMixin
    implements RegistryUninitialized {
  const _$RegistryUninitialized();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryState.registryUninitialized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryState.registryUninitialized'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegistryUninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result registryUninitialized(),
    @required Result registryLoading(),
    @required Result registryError(),
    @required
        Result registryLoaded(
            int classCapacity,
            User currentUser,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            List<Attendee> attendees,
            List<Attendee> acceptedAttendees),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryUninitialized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUninitialized(),
    Result registryLoading(),
    Result registryError(),
    Result registryLoaded(
        int classCapacity,
        User currentUser,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        List<Attendee> attendees,
        List<Attendee> acceptedAttendees),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryUninitialized != null) {
      return registryUninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUninitialized(RegistryUninitialized value),
    @required Result registryLoading(RegistryLoading value),
    @required Result registryError(RegistryError value),
    @required Result registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryUninitialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUninitialized(RegistryUninitialized value),
    Result registryLoading(RegistryLoading value),
    Result registryError(RegistryError value),
    Result registryLoaded(RegistryLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryUninitialized != null) {
      return registryUninitialized(this);
    }
    return orElse();
  }
}

abstract class RegistryUninitialized implements RegistryState {
  const factory RegistryUninitialized() = _$RegistryUninitialized;
}

/// @nodoc
abstract class $RegistryLoadingCopyWith<$Res> {
  factory $RegistryLoadingCopyWith(
          RegistryLoading value, $Res Function(RegistryLoading) then) =
      _$RegistryLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistryLoadingCopyWithImpl<$Res>
    extends _$RegistryStateCopyWithImpl<$Res>
    implements $RegistryLoadingCopyWith<$Res> {
  _$RegistryLoadingCopyWithImpl(
      RegistryLoading _value, $Res Function(RegistryLoading) _then)
      : super(_value, (v) => _then(v as RegistryLoading));

  @override
  RegistryLoading get _value => super._value as RegistryLoading;
}

/// @nodoc
class _$RegistryLoading
    with DiagnosticableTreeMixin
    implements RegistryLoading {
  const _$RegistryLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryState.registryLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryState.registryLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegistryLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result registryUninitialized(),
    @required Result registryLoading(),
    @required Result registryError(),
    @required
        Result registryLoaded(
            int classCapacity,
            User currentUser,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            List<Attendee> attendees,
            List<Attendee> acceptedAttendees),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUninitialized(),
    Result registryLoading(),
    Result registryError(),
    Result registryLoaded(
        int classCapacity,
        User currentUser,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        List<Attendee> attendees,
        List<Attendee> acceptedAttendees),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryLoading != null) {
      return registryLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUninitialized(RegistryUninitialized value),
    @required Result registryLoading(RegistryLoading value),
    @required Result registryError(RegistryError value),
    @required Result registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUninitialized(RegistryUninitialized value),
    Result registryLoading(RegistryLoading value),
    Result registryError(RegistryError value),
    Result registryLoaded(RegistryLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryLoading != null) {
      return registryLoading(this);
    }
    return orElse();
  }
}

abstract class RegistryLoading implements RegistryState {
  const factory RegistryLoading() = _$RegistryLoading;
}

/// @nodoc
abstract class $RegistryErrorCopyWith<$Res> {
  factory $RegistryErrorCopyWith(
          RegistryError value, $Res Function(RegistryError) then) =
      _$RegistryErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistryErrorCopyWithImpl<$Res>
    extends _$RegistryStateCopyWithImpl<$Res>
    implements $RegistryErrorCopyWith<$Res> {
  _$RegistryErrorCopyWithImpl(
      RegistryError _value, $Res Function(RegistryError) _then)
      : super(_value, (v) => _then(v as RegistryError));

  @override
  RegistryError get _value => super._value as RegistryError;
}

/// @nodoc
class _$RegistryError with DiagnosticableTreeMixin implements RegistryError {
  const _$RegistryError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryState.registryError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RegistryState.registryError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegistryError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result registryUninitialized(),
    @required Result registryLoading(),
    @required Result registryError(),
    @required
        Result registryLoaded(
            int classCapacity,
            User currentUser,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            List<Attendee> attendees,
            List<Attendee> acceptedAttendees),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUninitialized(),
    Result registryLoading(),
    Result registryError(),
    Result registryLoaded(
        int classCapacity,
        User currentUser,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        List<Attendee> attendees,
        List<Attendee> acceptedAttendees),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryError != null) {
      return registryError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUninitialized(RegistryUninitialized value),
    @required Result registryLoading(RegistryLoading value),
    @required Result registryError(RegistryError value),
    @required Result registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUninitialized(RegistryUninitialized value),
    Result registryLoading(RegistryLoading value),
    Result registryError(RegistryError value),
    Result registryLoaded(RegistryLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryError != null) {
      return registryError(this);
    }
    return orElse();
  }
}

abstract class RegistryError implements RegistryState {
  const factory RegistryError() = _$RegistryError;
}

/// @nodoc
abstract class $RegistryLoadedCopyWith<$Res> {
  factory $RegistryLoadedCopyWith(
          RegistryLoaded value, $Res Function(RegistryLoaded) then) =
      _$RegistryLoadedCopyWithImpl<$Res>;
  $Res call(
      {int classCapacity,
      User currentUser,
      bool isAcceptedUser,
      bool isRegisteredUser,
      bool isFullRegistry,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees});
}

/// @nodoc
class _$RegistryLoadedCopyWithImpl<$Res>
    extends _$RegistryStateCopyWithImpl<$Res>
    implements $RegistryLoadedCopyWith<$Res> {
  _$RegistryLoadedCopyWithImpl(
      RegistryLoaded _value, $Res Function(RegistryLoaded) _then)
      : super(_value, (v) => _then(v as RegistryLoaded));

  @override
  RegistryLoaded get _value => super._value as RegistryLoaded;

  @override
  $Res call({
    Object classCapacity = freezed,
    Object currentUser = freezed,
    Object isAcceptedUser = freezed,
    Object isRegisteredUser = freezed,
    Object isFullRegistry = freezed,
    Object attendees = freezed,
    Object acceptedAttendees = freezed,
  }) {
    return _then(RegistryLoaded(
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity as int,
      currentUser:
          currentUser == freezed ? _value.currentUser : currentUser as User,
      isAcceptedUser: isAcceptedUser == freezed
          ? _value.isAcceptedUser
          : isAcceptedUser as bool,
      isRegisteredUser: isRegisteredUser == freezed
          ? _value.isRegisteredUser
          : isRegisteredUser as bool,
      isFullRegistry: isFullRegistry == freezed
          ? _value.isFullRegistry
          : isFullRegistry as bool,
      attendees:
          attendees == freezed ? _value.attendees : attendees as List<Attendee>,
      acceptedAttendees: acceptedAttendees == freezed
          ? _value.acceptedAttendees
          : acceptedAttendees as List<Attendee>,
    ));
  }
}

/// @nodoc
class _$RegistryLoaded with DiagnosticableTreeMixin implements RegistryLoaded {
  const _$RegistryLoaded(
      {@required this.classCapacity,
      @required this.currentUser,
      @required this.isAcceptedUser,
      @required this.isRegisteredUser,
      @required this.isFullRegistry,
      @required this.attendees,
      @required this.acceptedAttendees})
      : assert(classCapacity != null),
        assert(currentUser != null),
        assert(isAcceptedUser != null),
        assert(isRegisteredUser != null),
        assert(isFullRegistry != null),
        assert(attendees != null),
        assert(acceptedAttendees != null);

  @override
  final int classCapacity;
  @override
  final User currentUser;
  @override
  final bool isAcceptedUser;
  @override
  final bool isRegisteredUser;
  @override
  final bool isFullRegistry;
  @override
  final List<Attendee> attendees;
  @override
  final List<Attendee> acceptedAttendees;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryState.registryLoaded(classCapacity: $classCapacity, currentUser: $currentUser, isAcceptedUser: $isAcceptedUser, isRegisteredUser: $isRegisteredUser, isFullRegistry: $isFullRegistry, attendees: $attendees, acceptedAttendees: $acceptedAttendees)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryState.registryLoaded'))
      ..add(DiagnosticsProperty('classCapacity', classCapacity))
      ..add(DiagnosticsProperty('currentUser', currentUser))
      ..add(DiagnosticsProperty('isAcceptedUser', isAcceptedUser))
      ..add(DiagnosticsProperty('isRegisteredUser', isRegisteredUser))
      ..add(DiagnosticsProperty('isFullRegistry', isFullRegistry))
      ..add(DiagnosticsProperty('attendees', attendees))
      ..add(DiagnosticsProperty('acceptedAttendees', acceptedAttendees));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegistryLoaded &&
            (identical(other.classCapacity, classCapacity) ||
                const DeepCollectionEquality()
                    .equals(other.classCapacity, classCapacity)) &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)) &&
            (identical(other.isAcceptedUser, isAcceptedUser) ||
                const DeepCollectionEquality()
                    .equals(other.isAcceptedUser, isAcceptedUser)) &&
            (identical(other.isRegisteredUser, isRegisteredUser) ||
                const DeepCollectionEquality()
                    .equals(other.isRegisteredUser, isRegisteredUser)) &&
            (identical(other.isFullRegistry, isFullRegistry) ||
                const DeepCollectionEquality()
                    .equals(other.isFullRegistry, isFullRegistry)) &&
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
      const DeepCollectionEquality().hash(isAcceptedUser) ^
      const DeepCollectionEquality().hash(isRegisteredUser) ^
      const DeepCollectionEquality().hash(isFullRegistry) ^
      const DeepCollectionEquality().hash(attendees) ^
      const DeepCollectionEquality().hash(acceptedAttendees);

  @override
  $RegistryLoadedCopyWith<RegistryLoaded> get copyWith =>
      _$RegistryLoadedCopyWithImpl<RegistryLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result registryUninitialized(),
    @required Result registryLoading(),
    @required Result registryError(),
    @required
        Result registryLoaded(
            int classCapacity,
            User currentUser,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            List<Attendee> attendees,
            List<Attendee> acceptedAttendees),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryLoaded(classCapacity, currentUser, isAcceptedUser,
        isRegisteredUser, isFullRegistry, attendees, acceptedAttendees);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUninitialized(),
    Result registryLoading(),
    Result registryError(),
    Result registryLoaded(
        int classCapacity,
        User currentUser,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        List<Attendee> attendees,
        List<Attendee> acceptedAttendees),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryLoaded != null) {
      return registryLoaded(classCapacity, currentUser, isAcceptedUser,
          isRegisteredUser, isFullRegistry, attendees, acceptedAttendees);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result registryUninitialized(RegistryUninitialized value),
    @required Result registryLoading(RegistryLoading value),
    @required Result registryError(RegistryError value),
    @required Result registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result registryUninitialized(RegistryUninitialized value),
    Result registryLoading(RegistryLoading value),
    Result registryError(RegistryError value),
    Result registryLoaded(RegistryLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryLoaded != null) {
      return registryLoaded(this);
    }
    return orElse();
  }
}

abstract class RegistryLoaded implements RegistryState {
  const factory RegistryLoaded(
      {@required int classCapacity,
      @required User currentUser,
      @required bool isAcceptedUser,
      @required bool isRegisteredUser,
      @required bool isFullRegistry,
      @required List<Attendee> attendees,
      @required List<Attendee> acceptedAttendees}) = _$RegistryLoaded;

  int get classCapacity;
  User get currentUser;
  bool get isAcceptedUser;
  bool get isRegisteredUser;
  bool get isFullRegistry;
  List<Attendee> get attendees;
  List<Attendee> get acceptedAttendees;
  $RegistryLoadedCopyWith<RegistryLoaded> get copyWith;
}
