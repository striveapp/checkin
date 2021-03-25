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
  ProfileUpdated profileUpdated(
      {@required User user, @required bool isCurrentUser}) {
    return ProfileUpdated(
      user: user,
      isCurrentUser: isCurrentUser,
    );
  }

// ignore: unused_element
  UpdateImageUrl updateImageUrl({@required String userEmail}) {
    return UpdateImageUrl(
      userEmail: userEmail,
    );
  }

// ignore: unused_element
  UpdateName updateName(
      {@required String userEmail, @required String newName}) {
    return UpdateName(
      userEmail: userEmail,
      newName: newName,
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
    @required TResult updateImageUrl(String userEmail),
    @required TResult updateName(String userEmail, String newName),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeProfile(),
    TResult profileUpdated(User user, bool isCurrentUser),
    TResult updateImageUrl(String userEmail),
    TResult updateName(String userEmail, String newName),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeProfile(InitializeProfile value),
    @required TResult profileUpdated(ProfileUpdated value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateName(UpdateName value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeProfile(InitializeProfile value),
    TResult profileUpdated(ProfileUpdated value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateName(UpdateName value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
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
class _$InitializeProfileCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
    implements $InitializeProfileCopyWith<$Res> {
  _$InitializeProfileCopyWithImpl(
      InitializeProfile _value, $Res Function(InitializeProfile) _then)
      : super(_value, (v) => _then(v as InitializeProfile));

  @override
  InitializeProfile get _value => super._value as InitializeProfile;
}

/// @nodoc
class _$InitializeProfile
    with DiagnosticableTreeMixin
    implements InitializeProfile {
  const _$InitializeProfile();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.initializeProfile()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEvent.initializeProfile'));
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
    @required TResult updateImageUrl(String userEmail),
    @required TResult updateName(String userEmail, String newName),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    assert(updateImageUrl != null);
    assert(updateName != null);
    return initializeProfile();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeProfile(),
    TResult profileUpdated(User user, bool isCurrentUser),
    TResult updateImageUrl(String userEmail),
    TResult updateName(String userEmail, String newName),
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
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateName(UpdateName value),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    assert(updateImageUrl != null);
    assert(updateName != null);
    return initializeProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeProfile(InitializeProfile value),
    TResult profileUpdated(ProfileUpdated value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateName(UpdateName value),
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
  factory $ProfileUpdatedCopyWith(
          ProfileUpdated value, $Res Function(ProfileUpdated) then) =
      _$ProfileUpdatedCopyWithImpl<$Res>;
  $Res call({User user, bool isCurrentUser});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ProfileUpdatedCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
    implements $ProfileUpdatedCopyWith<$Res> {
  _$ProfileUpdatedCopyWithImpl(
      ProfileUpdated _value, $Res Function(ProfileUpdated) _then)
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
      isCurrentUser: isCurrentUser == freezed
          ? _value.isCurrentUser
          : isCurrentUser as bool,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
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
                const DeepCollectionEquality()
                    .equals(other.isCurrentUser, isCurrentUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(isCurrentUser);

  @JsonKey(ignore: true)
  @override
  $ProfileUpdatedCopyWith<ProfileUpdated> get copyWith =>
      _$ProfileUpdatedCopyWithImpl<ProfileUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeProfile(),
    @required TResult profileUpdated(User user, bool isCurrentUser),
    @required TResult updateImageUrl(String userEmail),
    @required TResult updateName(String userEmail, String newName),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    assert(updateImageUrl != null);
    assert(updateName != null);
    return profileUpdated(user, isCurrentUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeProfile(),
    TResult profileUpdated(User user, bool isCurrentUser),
    TResult updateImageUrl(String userEmail),
    TResult updateName(String userEmail, String newName),
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
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateName(UpdateName value),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    assert(updateImageUrl != null);
    assert(updateName != null);
    return profileUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeProfile(InitializeProfile value),
    TResult profileUpdated(ProfileUpdated value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateName(UpdateName value),
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
  const factory ProfileUpdated(
      {@required User user, @required bool isCurrentUser}) = _$ProfileUpdated;

  User get user;
  bool get isCurrentUser;
  @JsonKey(ignore: true)
  $ProfileUpdatedCopyWith<ProfileUpdated> get copyWith;
}

/// @nodoc
abstract class $UpdateImageUrlCopyWith<$Res> {
  factory $UpdateImageUrlCopyWith(
          UpdateImageUrl value, $Res Function(UpdateImageUrl) then) =
      _$UpdateImageUrlCopyWithImpl<$Res>;
  $Res call({String userEmail});
}

/// @nodoc
class _$UpdateImageUrlCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res>
    implements $UpdateImageUrlCopyWith<$Res> {
  _$UpdateImageUrlCopyWithImpl(
      UpdateImageUrl _value, $Res Function(UpdateImageUrl) _then)
      : super(_value, (v) => _then(v as UpdateImageUrl));

  @override
  UpdateImageUrl get _value => super._value as UpdateImageUrl;

  @override
  $Res call({
    Object userEmail = freezed,
  }) {
    return _then(UpdateImageUrl(
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
    ));
  }
}

/// @nodoc
class _$UpdateImageUrl with DiagnosticableTreeMixin implements UpdateImageUrl {
  const _$UpdateImageUrl({@required this.userEmail})
      : assert(userEmail != null);

  @override
  final String userEmail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.updateImageUrl(userEmail: $userEmail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEvent.updateImageUrl'))
      ..add(DiagnosticsProperty('userEmail', userEmail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateImageUrl &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userEmail);

  @JsonKey(ignore: true)
  @override
  $UpdateImageUrlCopyWith<UpdateImageUrl> get copyWith =>
      _$UpdateImageUrlCopyWithImpl<UpdateImageUrl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeProfile(),
    @required TResult profileUpdated(User user, bool isCurrentUser),
    @required TResult updateImageUrl(String userEmail),
    @required TResult updateName(String userEmail, String newName),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    assert(updateImageUrl != null);
    assert(updateName != null);
    return updateImageUrl(userEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeProfile(),
    TResult profileUpdated(User user, bool isCurrentUser),
    TResult updateImageUrl(String userEmail),
    TResult updateName(String userEmail, String newName),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateImageUrl != null) {
      return updateImageUrl(userEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeProfile(InitializeProfile value),
    @required TResult profileUpdated(ProfileUpdated value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateName(UpdateName value),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    assert(updateImageUrl != null);
    assert(updateName != null);
    return updateImageUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeProfile(InitializeProfile value),
    TResult profileUpdated(ProfileUpdated value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateName(UpdateName value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateImageUrl != null) {
      return updateImageUrl(this);
    }
    return orElse();
  }
}

abstract class UpdateImageUrl implements ProfileEvent {
  const factory UpdateImageUrl({@required String userEmail}) = _$UpdateImageUrl;

  String get userEmail;
  @JsonKey(ignore: true)
  $UpdateImageUrlCopyWith<UpdateImageUrl> get copyWith;
}

/// @nodoc
abstract class $UpdateNameCopyWith<$Res> {
  factory $UpdateNameCopyWith(
          UpdateName value, $Res Function(UpdateName) then) =
      _$UpdateNameCopyWithImpl<$Res>;
  $Res call({String userEmail, String newName});
}

/// @nodoc
class _$UpdateNameCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements $UpdateNameCopyWith<$Res> {
  _$UpdateNameCopyWithImpl(UpdateName _value, $Res Function(UpdateName) _then)
      : super(_value, (v) => _then(v as UpdateName));

  @override
  UpdateName get _value => super._value as UpdateName;

  @override
  $Res call({
    Object userEmail = freezed,
    Object newName = freezed,
  }) {
    return _then(UpdateName(
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      newName: newName == freezed ? _value.newName : newName as String,
    ));
  }
}

/// @nodoc
class _$UpdateName with DiagnosticableTreeMixin implements UpdateName {
  const _$UpdateName({@required this.userEmail, @required this.newName})
      : assert(userEmail != null),
        assert(newName != null);

  @override
  final String userEmail;
  @override
  final String newName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.updateName(userEmail: $userEmail, newName: $newName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEvent.updateName'))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('newName', newName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateName &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)) &&
            (identical(other.newName, newName) ||
                const DeepCollectionEquality().equals(other.newName, newName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(newName);

  @JsonKey(ignore: true)
  @override
  $UpdateNameCopyWith<UpdateName> get copyWith =>
      _$UpdateNameCopyWithImpl<UpdateName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeProfile(),
    @required TResult profileUpdated(User user, bool isCurrentUser),
    @required TResult updateImageUrl(String userEmail),
    @required TResult updateName(String userEmail, String newName),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    assert(updateImageUrl != null);
    assert(updateName != null);
    return updateName(userEmail, newName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeProfile(),
    TResult profileUpdated(User user, bool isCurrentUser),
    TResult updateImageUrl(String userEmail),
    TResult updateName(String userEmail, String newName),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateName != null) {
      return updateName(userEmail, newName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeProfile(InitializeProfile value),
    @required TResult profileUpdated(ProfileUpdated value),
    @required TResult updateImageUrl(UpdateImageUrl value),
    @required TResult updateName(UpdateName value),
  }) {
    assert(initializeProfile != null);
    assert(profileUpdated != null);
    assert(updateImageUrl != null);
    assert(updateName != null);
    return updateName(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeProfile(InitializeProfile value),
    TResult profileUpdated(ProfileUpdated value),
    TResult updateImageUrl(UpdateImageUrl value),
    TResult updateName(UpdateName value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateName != null) {
      return updateName(this);
    }
    return orElse();
  }
}

abstract class UpdateName implements ProfileEvent {
  const factory UpdateName(
      {@required String userEmail, @required String newName}) = _$UpdateName;

  String get userEmail;
  String get newName;
  @JsonKey(ignore: true)
  $UpdateNameCopyWith<UpdateName> get copyWith;
}
