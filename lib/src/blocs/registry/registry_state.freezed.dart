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
      {@required User currentUser,
      @required Lesson currentLesson,
      @required bool isAcceptedUser,
      @required bool isRegisteredUser,
      @required bool isFullRegistry,
      @required bool isMasterOfTheClass}) {
    return RegistryLoaded(
      currentUser: currentUser,
      currentLesson: currentLesson,
      isAcceptedUser: isAcceptedUser,
      isRegisteredUser: isRegisteredUser,
      isFullRegistry: isFullRegistry,
      isMasterOfTheClass: isMasterOfTheClass,
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
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isMasterOfTheClass),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUninitialized(),
    Result registryLoading(),
    Result registryError(),
    Result registryLoaded(
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isMasterOfTheClass),
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
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isMasterOfTheClass),
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
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isMasterOfTheClass),
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
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isMasterOfTheClass),
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
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isMasterOfTheClass),
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
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isMasterOfTheClass),
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
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isMasterOfTheClass),
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
      {User currentUser,
      Lesson currentLesson,
      bool isAcceptedUser,
      bool isRegisteredUser,
      bool isFullRegistry,
      bool isMasterOfTheClass});

  $LessonCopyWith<$Res> get currentLesson;
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
    Object currentUser = freezed,
    Object currentLesson = freezed,
    Object isAcceptedUser = freezed,
    Object isRegisteredUser = freezed,
    Object isFullRegistry = freezed,
    Object isMasterOfTheClass = freezed,
  }) {
    return _then(RegistryLoaded(
      currentUser:
          currentUser == freezed ? _value.currentUser : currentUser as User,
      currentLesson: currentLesson == freezed
          ? _value.currentLesson
          : currentLesson as Lesson,
      isAcceptedUser: isAcceptedUser == freezed
          ? _value.isAcceptedUser
          : isAcceptedUser as bool,
      isRegisteredUser: isRegisteredUser == freezed
          ? _value.isRegisteredUser
          : isRegisteredUser as bool,
      isFullRegistry: isFullRegistry == freezed
          ? _value.isFullRegistry
          : isFullRegistry as bool,
      isMasterOfTheClass: isMasterOfTheClass == freezed
          ? _value.isMasterOfTheClass
          : isMasterOfTheClass as bool,
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
class _$RegistryLoaded with DiagnosticableTreeMixin implements RegistryLoaded {
  const _$RegistryLoaded(
      {@required this.currentUser,
      @required this.currentLesson,
      @required this.isAcceptedUser,
      @required this.isRegisteredUser,
      @required this.isFullRegistry,
      @required this.isMasterOfTheClass})
      : assert(currentUser != null),
        assert(currentLesson != null),
        assert(isAcceptedUser != null),
        assert(isRegisteredUser != null),
        assert(isFullRegistry != null),
        assert(isMasterOfTheClass != null);

  @override
  final User currentUser;
  @override
  final Lesson currentLesson;
  @override
  final bool isAcceptedUser;
  @override
  final bool isRegisteredUser;
  @override
  final bool isFullRegistry;
  @override
  final bool isMasterOfTheClass;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryState.registryLoaded(currentUser: $currentUser, currentLesson: $currentLesson, isAcceptedUser: $isAcceptedUser, isRegisteredUser: $isRegisteredUser, isFullRegistry: $isFullRegistry, isMasterOfTheClass: $isMasterOfTheClass)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryState.registryLoaded'))
      ..add(DiagnosticsProperty('currentUser', currentUser))
      ..add(DiagnosticsProperty('currentLesson', currentLesson))
      ..add(DiagnosticsProperty('isAcceptedUser', isAcceptedUser))
      ..add(DiagnosticsProperty('isRegisteredUser', isRegisteredUser))
      ..add(DiagnosticsProperty('isFullRegistry', isFullRegistry))
      ..add(DiagnosticsProperty('isMasterOfTheClass', isMasterOfTheClass));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegistryLoaded &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)) &&
            (identical(other.currentLesson, currentLesson) ||
                const DeepCollectionEquality()
                    .equals(other.currentLesson, currentLesson)) &&
            (identical(other.isAcceptedUser, isAcceptedUser) ||
                const DeepCollectionEquality()
                    .equals(other.isAcceptedUser, isAcceptedUser)) &&
            (identical(other.isRegisteredUser, isRegisteredUser) ||
                const DeepCollectionEquality()
                    .equals(other.isRegisteredUser, isRegisteredUser)) &&
            (identical(other.isFullRegistry, isFullRegistry) ||
                const DeepCollectionEquality()
                    .equals(other.isFullRegistry, isFullRegistry)) &&
            (identical(other.isMasterOfTheClass, isMasterOfTheClass) ||
                const DeepCollectionEquality()
                    .equals(other.isMasterOfTheClass, isMasterOfTheClass)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(currentLesson) ^
      const DeepCollectionEquality().hash(isAcceptedUser) ^
      const DeepCollectionEquality().hash(isRegisteredUser) ^
      const DeepCollectionEquality().hash(isFullRegistry) ^
      const DeepCollectionEquality().hash(isMasterOfTheClass);

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
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isMasterOfTheClass),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryLoaded != null);
    return registryLoaded(currentUser, currentLesson, isAcceptedUser,
        isRegisteredUser, isFullRegistry, isMasterOfTheClass);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result registryUninitialized(),
    Result registryLoading(),
    Result registryError(),
    Result registryLoaded(
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isMasterOfTheClass),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registryLoaded != null) {
      return registryLoaded(currentUser, currentLesson, isAcceptedUser,
          isRegisteredUser, isFullRegistry, isMasterOfTheClass);
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
      {@required User currentUser,
      @required Lesson currentLesson,
      @required bool isAcceptedUser,
      @required bool isRegisteredUser,
      @required bool isFullRegistry,
      @required bool isMasterOfTheClass}) = _$RegistryLoaded;

  User get currentUser;
  Lesson get currentLesson;
  bool get isAcceptedUser;
  bool get isRegisteredUser;
  bool get isFullRegistry;
  bool get isMasterOfTheClass;
  $RegistryLoadedCopyWith<RegistryLoaded> get copyWith;
}
