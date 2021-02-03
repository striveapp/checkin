// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProfileEventTearOff {
  const _$ProfileEventTearOff();

// ignore: unused_element
  InitializeProfile initializeProfile() {
    return const InitializeProfile();
  }

// ignore: unused_element
  ProfileUpdated profileUpdated({@required User user, @required bool isCurrentUser}) {
    return ProfileUpdated(
      user: user,
      isCurrentUser: isCurrentUser,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProfileEvent = _$ProfileEventTearOff();

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeProfile(),
    @required TResult profileUpdated(User user, bool isCurrentUser),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeProfile(),
    TResult profileUpdated(User user, bool isCurrentUser),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeProfile(InitializeProfile value),
    @required TResult profileUpdated(ProfileUpdated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeProfile(InitializeProfile value),
    TResult profileUpdated(ProfileUpdated value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res> implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  final ProfileEvent _value;
  // ignore: unused_field
  final $Res Function(ProfileEvent) _then;
}

/// @nodoc
abstract class $InitializeProfileCopyWith<$Res> {
  factory $InitializeProfileCopyWith(
          InitializeProfile value, $Res Function(InitializeProfile) then) =
      _$InitializeProfileCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeProfileCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements $InitializeProfileCopyWith<$Res> {
  _$InitializeProfileCopyWithImpl(InitializeProfile _value, $Res Function(InitializeProfile) _then)
      : super(_value, (v) => _then(v as InitializeProfile));

  @override
  InitializeProfile get _value => super._value as InitializeProfile;
}

/// @nodoc
class _$InitializeProfile with DiagnosticableTreeMixin implements InitializeProfile {
  const _$InitializeProfile();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.initializeProfile()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ProfileEvent.initializeProfile'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeProfile(),
    @required TResult profileUpdated(User user, bool isCurrentUser),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    return initializeProfile();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeProfile(),
    TResult profileUpdated(User user, bool isCurrentUser),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeProfile != null) {
      return initializeProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeProfile(InitializeProfile value),
    @required TResult profileUpdated(ProfileUpdated value),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    return initializeProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeProfile(InitializeProfile value),
    TResult profileUpdated(ProfileUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeProfile != null) {
      return initializeProfile(this);
    }
    return orElse();
  }
}

abstract class InitializeProfile implements ProfileEvent {
  const factory InitializeProfile() = _$InitializeProfile;
}

/// @nodoc
abstract class $ProfileUpdatedCopyWith<$Res> {
  factory $ProfileUpdatedCopyWith(ProfileUpdated value, $Res Function(ProfileUpdated) then) =
      _$ProfileUpdatedCopyWithImpl<$Res>;
  $Res call({User user, bool isCurrentUser});
}

/// @nodoc
class _$ProfileUpdatedCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements $ProfileUpdatedCopyWith<$Res> {
  _$ProfileUpdatedCopyWithImpl(ProfileUpdated _value, $Res Function(ProfileUpdated) _then)
      : super(_value, (v) => _then(v as ProfileUpdated));

  @override
  ProfileUpdated get _value => super._value as ProfileUpdated;

  @override
  $Res call({
    Object user = freezed,
    Object isCurrentUser = freezed,
  }) {
    return _then(ProfileUpdated(
      user: user == freezed ? _value.user : user as User,
      isCurrentUser: isCurrentUser == freezed ? _value.isCurrentUser : isCurrentUser as bool,
    ));
  }
}

/// @nodoc
class _$ProfileUpdated with DiagnosticableTreeMixin implements ProfileUpdated {
  const _$ProfileUpdated({@required this.user, @required this.isCurrentUser})
      : assert(user != null),
        assert(isCurrentUser != null);

  @override
  final User user;
  @override
  final bool isCurrentUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.profileUpdated(user: $user, isCurrentUser: $isCurrentUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEvent.profileUpdated'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('isCurrentUser', isCurrentUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileUpdated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                const DeepCollectionEquality().equals(other.isCurrentUser, isCurrentUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(isCurrentUser);

  @override
  $ProfileUpdatedCopyWith<ProfileUpdated> get copyWith =>
      _$ProfileUpdatedCopyWithImpl<ProfileUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeProfile(),
    @required TResult profileUpdated(User user, bool isCurrentUser),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    return profileUpdated(user, isCurrentUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeProfile(),
    TResult profileUpdated(User user, bool isCurrentUser),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (profileUpdated != null) {
      return profileUpdated(user, isCurrentUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeProfile(InitializeProfile value),
    @required TResult profileUpdated(ProfileUpdated value),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    return profileUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeProfile(InitializeProfile value),
    TResult profileUpdated(ProfileUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (profileUpdated != null) {
      return profileUpdated(this);
    }
    return orElse();
  }
}

abstract class ProfileUpdated implements ProfileEvent {
  const factory ProfileUpdated({@required User user, @required bool isCurrentUser}) =
      _$ProfileUpdated;

  User get user;
  bool get isCurrentUser;
  $ProfileUpdatedCopyWith<ProfileUpdated> get copyWith;
}
