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
  RegistryMissing registryMissing() {
    return const RegistryMissing();
  }

// ignore: unused_element
  RegistryLoaded registryLoaded(
      {@required User currentUser,
      @required Lesson currentLesson,
      bool isAcceptedUser = false,
      bool isRegisteredUser = false,
      bool isFullRegistry = false,
      bool isEmptyRegistry = false,
      bool isMasterOfTheClass = false,
      dynamic isClosedRegistry = false}) {
    return RegistryLoaded(
      currentUser: currentUser,
      currentLesson: currentLesson,
      isAcceptedUser: isAcceptedUser,
      isRegisteredUser: isRegisteredUser,
      isFullRegistry: isFullRegistry,
      isEmptyRegistry: isEmptyRegistry,
      isMasterOfTheClass: isMasterOfTheClass,
      isClosedRegistry: isClosedRegistry,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RegistryState = _$RegistryStateTearOff();

/// @nodoc
mixin _$RegistryState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult registryUninitialized(),
    @required TResult registryLoading(),
    @required TResult registryError(),
    @required TResult registryMissing(),
    @required
        TResult registryLoaded(
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isEmptyRegistry,
            bool isMasterOfTheClass,
            dynamic isClosedRegistry),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUninitialized(),
    TResult registryLoading(),
    TResult registryError(),
    TResult registryMissing(),
    TResult registryLoaded(
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isEmptyRegistry,
        bool isMasterOfTheClass,
        dynamic isClosedRegistry),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUninitialized(RegistryUninitialized value),
    @required TResult registryLoading(RegistryLoading value),
    @required TResult registryError(RegistryError value),
    @required TResult registryMissing(RegistryMissing value),
    @required TResult registryLoaded(RegistryLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUninitialized(RegistryUninitialized value),
    TResult registryLoading(RegistryLoading value),
    TResult registryError(RegistryError value),
    TResult registryMissing(RegistryMissing value),
    TResult registryLoaded(RegistryLoaded value),
    @required TResult orElse(),
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
  TResult when<TResult extends Object>({
    @required TResult registryUninitialized(),
    @required TResult registryLoading(),
    @required TResult registryError(),
    @required TResult registryMissing(),
    @required
        TResult registryLoaded(
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isEmptyRegistry,
            bool isMasterOfTheClass,
            dynamic isClosedRegistry),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryUninitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUninitialized(),
    TResult registryLoading(),
    TResult registryError(),
    TResult registryMissing(),
    TResult registryLoaded(
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isEmptyRegistry,
        bool isMasterOfTheClass,
        dynamic isClosedRegistry),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registryUninitialized != null) {
      return registryUninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUninitialized(RegistryUninitialized value),
    @required TResult registryLoading(RegistryLoading value),
    @required TResult registryError(RegistryError value),
    @required TResult registryMissing(RegistryMissing value),
    @required TResult registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryUninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUninitialized(RegistryUninitialized value),
    TResult registryLoading(RegistryLoading value),
    TResult registryError(RegistryError value),
    TResult registryMissing(RegistryMissing value),
    TResult registryLoaded(RegistryLoaded value),
    @required TResult orElse(),
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
  TResult when<TResult extends Object>({
    @required TResult registryUninitialized(),
    @required TResult registryLoading(),
    @required TResult registryError(),
    @required TResult registryMissing(),
    @required
        TResult registryLoaded(
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isEmptyRegistry,
            bool isMasterOfTheClass,
            dynamic isClosedRegistry),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUninitialized(),
    TResult registryLoading(),
    TResult registryError(),
    TResult registryMissing(),
    TResult registryLoaded(
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isEmptyRegistry,
        bool isMasterOfTheClass,
        dynamic isClosedRegistry),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registryLoading != null) {
      return registryLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUninitialized(RegistryUninitialized value),
    @required TResult registryLoading(RegistryLoading value),
    @required TResult registryError(RegistryError value),
    @required TResult registryMissing(RegistryMissing value),
    @required TResult registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUninitialized(RegistryUninitialized value),
    TResult registryLoading(RegistryLoading value),
    TResult registryError(RegistryError value),
    TResult registryMissing(RegistryMissing value),
    TResult registryLoaded(RegistryLoaded value),
    @required TResult orElse(),
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
  TResult when<TResult extends Object>({
    @required TResult registryUninitialized(),
    @required TResult registryLoading(),
    @required TResult registryError(),
    @required TResult registryMissing(),
    @required
        TResult registryLoaded(
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isEmptyRegistry,
            bool isMasterOfTheClass,
            dynamic isClosedRegistry),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUninitialized(),
    TResult registryLoading(),
    TResult registryError(),
    TResult registryMissing(),
    TResult registryLoaded(
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isEmptyRegistry,
        bool isMasterOfTheClass,
        dynamic isClosedRegistry),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registryError != null) {
      return registryError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUninitialized(RegistryUninitialized value),
    @required TResult registryLoading(RegistryLoading value),
    @required TResult registryError(RegistryError value),
    @required TResult registryMissing(RegistryMissing value),
    @required TResult registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUninitialized(RegistryUninitialized value),
    TResult registryLoading(RegistryLoading value),
    TResult registryError(RegistryError value),
    TResult registryMissing(RegistryMissing value),
    TResult registryLoaded(RegistryLoaded value),
    @required TResult orElse(),
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
abstract class $RegistryMissingCopyWith<$Res> {
  factory $RegistryMissingCopyWith(
          RegistryMissing value, $Res Function(RegistryMissing) then) =
      _$RegistryMissingCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistryMissingCopyWithImpl<$Res>
    extends _$RegistryStateCopyWithImpl<$Res>
    implements $RegistryMissingCopyWith<$Res> {
  _$RegistryMissingCopyWithImpl(
      RegistryMissing _value, $Res Function(RegistryMissing) _then)
      : super(_value, (v) => _then(v as RegistryMissing));

  @override
  RegistryMissing get _value => super._value as RegistryMissing;
}

/// @nodoc
class _$RegistryMissing
    with DiagnosticableTreeMixin
    implements RegistryMissing {
  const _$RegistryMissing();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryState.registryMissing()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistryState.registryMissing'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegistryMissing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult registryUninitialized(),
    @required TResult registryLoading(),
    @required TResult registryError(),
    @required TResult registryMissing(),
    @required
        TResult registryLoaded(
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isEmptyRegistry,
            bool isMasterOfTheClass,
            dynamic isClosedRegistry),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryMissing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUninitialized(),
    TResult registryLoading(),
    TResult registryError(),
    TResult registryMissing(),
    TResult registryLoaded(
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isEmptyRegistry,
        bool isMasterOfTheClass,
        dynamic isClosedRegistry),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registryMissing != null) {
      return registryMissing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUninitialized(RegistryUninitialized value),
    @required TResult registryLoading(RegistryLoading value),
    @required TResult registryError(RegistryError value),
    @required TResult registryMissing(RegistryMissing value),
    @required TResult registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryMissing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUninitialized(RegistryUninitialized value),
    TResult registryLoading(RegistryLoading value),
    TResult registryError(RegistryError value),
    TResult registryMissing(RegistryMissing value),
    TResult registryLoaded(RegistryLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registryMissing != null) {
      return registryMissing(this);
    }
    return orElse();
  }
}

abstract class RegistryMissing implements RegistryState {
  const factory RegistryMissing() = _$RegistryMissing;
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
      bool isEmptyRegistry,
      bool isMasterOfTheClass,
      dynamic isClosedRegistry});

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
    Object isEmptyRegistry = freezed,
    Object isMasterOfTheClass = freezed,
    Object isClosedRegistry = freezed,
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
      isEmptyRegistry: isEmptyRegistry == freezed
          ? _value.isEmptyRegistry
          : isEmptyRegistry as bool,
      isMasterOfTheClass: isMasterOfTheClass == freezed
          ? _value.isMasterOfTheClass
          : isMasterOfTheClass as bool,
      isClosedRegistry: isClosedRegistry == freezed
          ? _value.isClosedRegistry
          : isClosedRegistry,
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
      this.isAcceptedUser = false,
      this.isRegisteredUser = false,
      this.isFullRegistry = false,
      this.isEmptyRegistry = false,
      this.isMasterOfTheClass = false,
      this.isClosedRegistry = false})
      : assert(currentUser != null),
        assert(currentLesson != null),
        assert(isAcceptedUser != null),
        assert(isRegisteredUser != null),
        assert(isFullRegistry != null),
        assert(isEmptyRegistry != null),
        assert(isMasterOfTheClass != null),
        assert(isClosedRegistry != null);

  @override
  final User currentUser;
  @override
  final Lesson currentLesson;
  @JsonKey(defaultValue: false)
  @override
  final bool isAcceptedUser;
  @JsonKey(defaultValue: false)
  @override
  final bool isRegisteredUser;
  @JsonKey(defaultValue: false)
  @override
  final bool isFullRegistry;
  @JsonKey(defaultValue: false)
  @override
  final bool isEmptyRegistry;
  @JsonKey(defaultValue: false)
  @override
  final bool isMasterOfTheClass;
  @JsonKey(defaultValue: false)
  @override
  final dynamic isClosedRegistry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistryState.registryLoaded(currentUser: $currentUser, currentLesson: $currentLesson, isAcceptedUser: $isAcceptedUser, isRegisteredUser: $isRegisteredUser, isFullRegistry: $isFullRegistry, isEmptyRegistry: $isEmptyRegistry, isMasterOfTheClass: $isMasterOfTheClass, isClosedRegistry: $isClosedRegistry)';
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
      ..add(DiagnosticsProperty('isEmptyRegistry', isEmptyRegistry))
      ..add(DiagnosticsProperty('isMasterOfTheClass', isMasterOfTheClass))
      ..add(DiagnosticsProperty('isClosedRegistry', isClosedRegistry));
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
            (identical(other.isEmptyRegistry, isEmptyRegistry) ||
                const DeepCollectionEquality()
                    .equals(other.isEmptyRegistry, isEmptyRegistry)) &&
            (identical(other.isMasterOfTheClass, isMasterOfTheClass) ||
                const DeepCollectionEquality()
                    .equals(other.isMasterOfTheClass, isMasterOfTheClass)) &&
            (identical(other.isClosedRegistry, isClosedRegistry) ||
                const DeepCollectionEquality()
                    .equals(other.isClosedRegistry, isClosedRegistry)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(currentLesson) ^
      const DeepCollectionEquality().hash(isAcceptedUser) ^
      const DeepCollectionEquality().hash(isRegisteredUser) ^
      const DeepCollectionEquality().hash(isFullRegistry) ^
      const DeepCollectionEquality().hash(isEmptyRegistry) ^
      const DeepCollectionEquality().hash(isMasterOfTheClass) ^
      const DeepCollectionEquality().hash(isClosedRegistry);

  @override
  $RegistryLoadedCopyWith<RegistryLoaded> get copyWith =>
      _$RegistryLoadedCopyWithImpl<RegistryLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult registryUninitialized(),
    @required TResult registryLoading(),
    @required TResult registryError(),
    @required TResult registryMissing(),
    @required
        TResult registryLoaded(
            User currentUser,
            Lesson currentLesson,
            bool isAcceptedUser,
            bool isRegisteredUser,
            bool isFullRegistry,
            bool isEmptyRegistry,
            bool isMasterOfTheClass,
            dynamic isClosedRegistry),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryLoaded(
        currentUser,
        currentLesson,
        isAcceptedUser,
        isRegisteredUser,
        isFullRegistry,
        isEmptyRegistry,
        isMasterOfTheClass,
        isClosedRegistry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult registryUninitialized(),
    TResult registryLoading(),
    TResult registryError(),
    TResult registryMissing(),
    TResult registryLoaded(
        User currentUser,
        Lesson currentLesson,
        bool isAcceptedUser,
        bool isRegisteredUser,
        bool isFullRegistry,
        bool isEmptyRegistry,
        bool isMasterOfTheClass,
        dynamic isClosedRegistry),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registryLoaded != null) {
      return registryLoaded(
          currentUser,
          currentLesson,
          isAcceptedUser,
          isRegisteredUser,
          isFullRegistry,
          isEmptyRegistry,
          isMasterOfTheClass,
          isClosedRegistry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult registryUninitialized(RegistryUninitialized value),
    @required TResult registryLoading(RegistryLoading value),
    @required TResult registryError(RegistryError value),
    @required TResult registryMissing(RegistryMissing value),
    @required TResult registryLoaded(RegistryLoaded value),
  }) {
    assert(registryUninitialized != null);
    assert(registryLoading != null);
    assert(registryError != null);
    assert(registryMissing != null);
    assert(registryLoaded != null);
    return registryLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult registryUninitialized(RegistryUninitialized value),
    TResult registryLoading(RegistryLoading value),
    TResult registryError(RegistryError value),
    TResult registryMissing(RegistryMissing value),
    TResult registryLoaded(RegistryLoaded value),
    @required TResult orElse(),
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
      bool isAcceptedUser,
      bool isRegisteredUser,
      bool isFullRegistry,
      bool isEmptyRegistry,
      bool isMasterOfTheClass,
      dynamic isClosedRegistry}) = _$RegistryLoaded;

  User get currentUser;
  Lesson get currentLesson;
  bool get isAcceptedUser;
  bool get isRegisteredUser;
  bool get isFullRegistry;
  bool get isEmptyRegistry;
  bool get isMasterOfTheClass;
  dynamic get isClosedRegistry;
  $RegistryLoadedCopyWith<RegistryLoaded> get copyWith;
}
