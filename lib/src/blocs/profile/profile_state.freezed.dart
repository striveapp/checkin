// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileStateTearOff {
  const _$ProfileStateTearOff();

  InitialProfileState initialProfileState() {
    return const InitialProfileState();
  }

  ProfileLoaded profileLoaded(
      {required User profileUser, required bool isCurrentUser}) {
    return ProfileLoaded(
      profileUser: profileUser,
      isCurrentUser: isCurrentUser,
    );
  }
}

/// @nodoc
const $ProfileState = _$ProfileStateTearOff();

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialProfileState,
    required TResult Function(User profileUser, bool isCurrentUser)
        profileLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialProfileState,
    TResult Function(User profileUser, bool isCurrentUser)? profileLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialProfileState value) initialProfileState,
    required TResult Function(ProfileLoaded value) profileLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialProfileState value)? initialProfileState,
    TResult Function(ProfileLoaded value)? profileLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;
}

/// @nodoc
abstract class $InitialProfileStateCopyWith<$Res> {
  factory $InitialProfileStateCopyWith(
          InitialProfileState value, $Res Function(InitialProfileState) then) =
      _$InitialProfileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialProfileStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements $InitialProfileStateCopyWith<$Res> {
  _$InitialProfileStateCopyWithImpl(
      InitialProfileState _value, $Res Function(InitialProfileState) _then)
      : super(_value, (v) => _then(v as InitialProfileState));

  @override
  InitialProfileState get _value => super._value as InitialProfileState;
}

/// @nodoc

class _$InitialProfileState
    with DiagnosticableTreeMixin
    implements InitialProfileState {
  const _$InitialProfileState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileState.initialProfileState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileState.initialProfileState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialProfileState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialProfileState,
    required TResult Function(User profileUser, bool isCurrentUser)
        profileLoaded,
  }) {
    return initialProfileState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialProfileState,
    TResult Function(User profileUser, bool isCurrentUser)? profileLoaded,
    required TResult orElse(),
  }) {
    if (initialProfileState != null) {
      return initialProfileState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialProfileState value) initialProfileState,
    required TResult Function(ProfileLoaded value) profileLoaded,
  }) {
    return initialProfileState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialProfileState value)? initialProfileState,
    TResult Function(ProfileLoaded value)? profileLoaded,
    required TResult orElse(),
  }) {
    if (initialProfileState != null) {
      return initialProfileState(this);
    }
    return orElse();
  }
}

abstract class InitialProfileState implements ProfileState {
  const factory InitialProfileState() = _$InitialProfileState;
}

/// @nodoc
abstract class $ProfileLoadedCopyWith<$Res> {
  factory $ProfileLoadedCopyWith(
          ProfileLoaded value, $Res Function(ProfileLoaded) then) =
      _$ProfileLoadedCopyWithImpl<$Res>;
  $Res call({User profileUser, bool isCurrentUser});

  $UserCopyWith<$Res> get profileUser;
}

/// @nodoc
class _$ProfileLoadedCopyWithImpl<$Res> extends _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileLoadedCopyWith<$Res> {
  _$ProfileLoadedCopyWithImpl(
      ProfileLoaded _value, $Res Function(ProfileLoaded) _then)
      : super(_value, (v) => _then(v as ProfileLoaded));

  @override
  ProfileLoaded get _value => super._value as ProfileLoaded;

  @override
  $Res call({
    Object? profileUser = freezed,
    Object? isCurrentUser = freezed,
  }) {
    return _then(ProfileLoaded(
      profileUser: profileUser == freezed
          ? _value.profileUser
          : profileUser // ignore: cast_nullable_to_non_nullable
              as User,
      isCurrentUser: isCurrentUser == freezed
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserCopyWith<$Res> get profileUser {
    return $UserCopyWith<$Res>(_value.profileUser, (value) {
      return _then(_value.copyWith(profileUser: value));
    });
  }
}

/// @nodoc

class _$ProfileLoaded with DiagnosticableTreeMixin implements ProfileLoaded {
  const _$ProfileLoaded(
      {required this.profileUser, required this.isCurrentUser});

  @override
  final User profileUser;
  @override
  final bool isCurrentUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileState.profileLoaded(profileUser: $profileUser, isCurrentUser: $isCurrentUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileState.profileLoaded'))
      ..add(DiagnosticsProperty('profileUser', profileUser))
      ..add(DiagnosticsProperty('isCurrentUser', isCurrentUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileLoaded &&
            (identical(other.profileUser, profileUser) ||
                const DeepCollectionEquality()
                    .equals(other.profileUser, profileUser)) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                const DeepCollectionEquality()
                    .equals(other.isCurrentUser, isCurrentUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(profileUser) ^
      const DeepCollectionEquality().hash(isCurrentUser);

  @JsonKey(ignore: true)
  @override
  $ProfileLoadedCopyWith<ProfileLoaded> get copyWith =>
      _$ProfileLoadedCopyWithImpl<ProfileLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialProfileState,
    required TResult Function(User profileUser, bool isCurrentUser)
        profileLoaded,
  }) {
    return profileLoaded(profileUser, isCurrentUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialProfileState,
    TResult Function(User profileUser, bool isCurrentUser)? profileLoaded,
    required TResult orElse(),
  }) {
    if (profileLoaded != null) {
      return profileLoaded(profileUser, isCurrentUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialProfileState value) initialProfileState,
    required TResult Function(ProfileLoaded value) profileLoaded,
  }) {
    return profileLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialProfileState value)? initialProfileState,
    TResult Function(ProfileLoaded value)? profileLoaded,
    required TResult orElse(),
  }) {
    if (profileLoaded != null) {
      return profileLoaded(this);
    }
    return orElse();
  }
}

abstract class ProfileLoaded implements ProfileState {
  const factory ProfileLoaded(
      {required User profileUser,
      required bool isCurrentUser}) = _$ProfileLoaded;

  User get profileUser => throw _privateConstructorUsedError;
  bool get isCurrentUser => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileLoadedCopyWith<ProfileLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
