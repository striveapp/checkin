// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileEventTearOff {
  const _$ProfileEventTearOff();

  InitializeProfile initializeProfile() {
    return const InitializeProfile();
  }

  ProfileUpdated profileUpdated({required User user, required bool isCurrentUser}) {
    return ProfileUpdated(
      user: user,
      isCurrentUser: isCurrentUser,
    );
  }

  UpdateImageUrl updateImageUrl({required String userEmail}) {
    return UpdateImageUrl(
      userEmail: userEmail,
    );
  }

  UpdateName updateName({required String userEmail, required String newName}) {
    return UpdateName(
      userEmail: userEmail,
      newName: newName,
    );
  }

  UpdateWeight updateWeight({required String userEmail, required double newWeight}) {
    return UpdateWeight(
      userEmail: userEmail,
      newWeight: newWeight,
    );
  }

  UpdateGrade updateGrade({required String userEmail, required Grade newGrade}) {
    return UpdateGrade(
      userEmail: userEmail,
      newGrade: newGrade,
    );
  }

  UpdateSelectedGym updateSelectedGym({required String userEmail, required String newGymId}) {
    return UpdateSelectedGym(
      userEmail: userEmail,
      newGymId: newGymId,
    );
  }
}

/// @nodoc
const $ProfileEvent = _$ProfileEventTearOff();

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeProfile,
    required TResult Function(User user, bool isCurrentUser) profileUpdated,
    required TResult Function(String userEmail) updateImageUrl,
    required TResult Function(String userEmail, String newName) updateName,
    required TResult Function(String userEmail, double newWeight) updateWeight,
    required TResult Function(String userEmail, Grade newGrade) updateGrade,
    required TResult Function(String userEmail, String newGymId) updateSelectedGym,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeProfile,
    TResult Function(User user, bool isCurrentUser)? profileUpdated,
    TResult Function(String userEmail)? updateImageUrl,
    TResult Function(String userEmail, String newName)? updateName,
    TResult Function(String userEmail, double newWeight)? updateWeight,
    TResult Function(String userEmail, Grade newGrade)? updateGrade,
    TResult Function(String userEmail, String newGymId)? updateSelectedGym,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeProfile value) initializeProfile,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateWeight value) updateWeight,
    required TResult Function(UpdateGrade value) updateGrade,
    required TResult Function(UpdateSelectedGym value) updateSelectedGym,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeProfile value)? initializeProfile,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateWeight value)? updateWeight,
    TResult Function(UpdateGrade value)? updateGrade,
    TResult Function(UpdateSelectedGym value)? updateSelectedGym,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function() initializeProfile,
    required TResult Function(User user, bool isCurrentUser) profileUpdated,
    required TResult Function(String userEmail) updateImageUrl,
    required TResult Function(String userEmail, String newName) updateName,
    required TResult Function(String userEmail, double newWeight) updateWeight,
    required TResult Function(String userEmail, Grade newGrade) updateGrade,
    required TResult Function(String userEmail, String newGymId) updateSelectedGym,
  }) {
    return initializeProfile();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeProfile,
    TResult Function(User user, bool isCurrentUser)? profileUpdated,
    TResult Function(String userEmail)? updateImageUrl,
    TResult Function(String userEmail, String newName)? updateName,
    TResult Function(String userEmail, double newWeight)? updateWeight,
    TResult Function(String userEmail, Grade newGrade)? updateGrade,
    TResult Function(String userEmail, String newGymId)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (initializeProfile != null) {
      return initializeProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeProfile value) initializeProfile,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateWeight value) updateWeight,
    required TResult Function(UpdateGrade value) updateGrade,
    required TResult Function(UpdateSelectedGym value) updateSelectedGym,
  }) {
    return initializeProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeProfile value)? initializeProfile,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateWeight value)? updateWeight,
    TResult Function(UpdateGrade value)? updateGrade,
    TResult Function(UpdateSelectedGym value)? updateSelectedGym,
    required TResult orElse(),
  }) {
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

  $UserCopyWith<$Res> get user;
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
    Object? user = freezed,
    Object? isCurrentUser = freezed,
  }) {
    return _then(ProfileUpdated(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isCurrentUser: isCurrentUser == freezed
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$ProfileUpdated with DiagnosticableTreeMixin implements ProfileUpdated {
  const _$ProfileUpdated({required this.user, required this.isCurrentUser});

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

  @JsonKey(ignore: true)
  @override
  $ProfileUpdatedCopyWith<ProfileUpdated> get copyWith =>
      _$ProfileUpdatedCopyWithImpl<ProfileUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeProfile,
    required TResult Function(User user, bool isCurrentUser) profileUpdated,
    required TResult Function(String userEmail) updateImageUrl,
    required TResult Function(String userEmail, String newName) updateName,
    required TResult Function(String userEmail, double newWeight) updateWeight,
    required TResult Function(String userEmail, Grade newGrade) updateGrade,
    required TResult Function(String userEmail, String newGymId) updateSelectedGym,
  }) {
    return profileUpdated(user, isCurrentUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeProfile,
    TResult Function(User user, bool isCurrentUser)? profileUpdated,
    TResult Function(String userEmail)? updateImageUrl,
    TResult Function(String userEmail, String newName)? updateName,
    TResult Function(String userEmail, double newWeight)? updateWeight,
    TResult Function(String userEmail, Grade newGrade)? updateGrade,
    TResult Function(String userEmail, String newGymId)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (profileUpdated != null) {
      return profileUpdated(user, isCurrentUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeProfile value) initializeProfile,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateWeight value) updateWeight,
    required TResult Function(UpdateGrade value) updateGrade,
    required TResult Function(UpdateSelectedGym value) updateSelectedGym,
  }) {
    return profileUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeProfile value)? initializeProfile,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateWeight value)? updateWeight,
    TResult Function(UpdateGrade value)? updateGrade,
    TResult Function(UpdateSelectedGym value)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (profileUpdated != null) {
      return profileUpdated(this);
    }
    return orElse();
  }
}

abstract class ProfileUpdated implements ProfileEvent {
  const factory ProfileUpdated({required User user, required bool isCurrentUser}) =
      _$ProfileUpdated;

  User get user => throw _privateConstructorUsedError;
  bool get isCurrentUser => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileUpdatedCopyWith<ProfileUpdated> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateImageUrlCopyWith<$Res> {
  factory $UpdateImageUrlCopyWith(UpdateImageUrl value, $Res Function(UpdateImageUrl) then) =
      _$UpdateImageUrlCopyWithImpl<$Res>;
  $Res call({String userEmail});
}

/// @nodoc
class _$UpdateImageUrlCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements $UpdateImageUrlCopyWith<$Res> {
  _$UpdateImageUrlCopyWithImpl(UpdateImageUrl _value, $Res Function(UpdateImageUrl) _then)
      : super(_value, (v) => _then(v as UpdateImageUrl));

  @override
  UpdateImageUrl get _value => super._value as UpdateImageUrl;

  @override
  $Res call({
    Object? userEmail = freezed,
  }) {
    return _then(UpdateImageUrl(
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateImageUrl with DiagnosticableTreeMixin implements UpdateImageUrl {
  const _$UpdateImageUrl({required this.userEmail});

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
                const DeepCollectionEquality().equals(other.userEmail, userEmail)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(userEmail);

  @JsonKey(ignore: true)
  @override
  $UpdateImageUrlCopyWith<UpdateImageUrl> get copyWith =>
      _$UpdateImageUrlCopyWithImpl<UpdateImageUrl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeProfile,
    required TResult Function(User user, bool isCurrentUser) profileUpdated,
    required TResult Function(String userEmail) updateImageUrl,
    required TResult Function(String userEmail, String newName) updateName,
    required TResult Function(String userEmail, double newWeight) updateWeight,
    required TResult Function(String userEmail, Grade newGrade) updateGrade,
    required TResult Function(String userEmail, String newGymId) updateSelectedGym,
  }) {
    return updateImageUrl(userEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeProfile,
    TResult Function(User user, bool isCurrentUser)? profileUpdated,
    TResult Function(String userEmail)? updateImageUrl,
    TResult Function(String userEmail, String newName)? updateName,
    TResult Function(String userEmail, double newWeight)? updateWeight,
    TResult Function(String userEmail, Grade newGrade)? updateGrade,
    TResult Function(String userEmail, String newGymId)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateImageUrl != null) {
      return updateImageUrl(userEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeProfile value) initializeProfile,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateWeight value) updateWeight,
    required TResult Function(UpdateGrade value) updateGrade,
    required TResult Function(UpdateSelectedGym value) updateSelectedGym,
  }) {
    return updateImageUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeProfile value)? initializeProfile,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateWeight value)? updateWeight,
    TResult Function(UpdateGrade value)? updateGrade,
    TResult Function(UpdateSelectedGym value)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateImageUrl != null) {
      return updateImageUrl(this);
    }
    return orElse();
  }
}

abstract class UpdateImageUrl implements ProfileEvent {
  const factory UpdateImageUrl({required String userEmail}) = _$UpdateImageUrl;

  String get userEmail => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateImageUrlCopyWith<UpdateImageUrl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateNameCopyWith<$Res> {
  factory $UpdateNameCopyWith(UpdateName value, $Res Function(UpdateName) then) =
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
    Object? userEmail = freezed,
    Object? newName = freezed,
  }) {
    return _then(UpdateName(
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      newName: newName == freezed
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateName with DiagnosticableTreeMixin implements UpdateName {
  const _$UpdateName({required this.userEmail, required this.newName});

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
                const DeepCollectionEquality().equals(other.userEmail, userEmail)) &&
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
  TResult when<TResult extends Object?>({
    required TResult Function() initializeProfile,
    required TResult Function(User user, bool isCurrentUser) profileUpdated,
    required TResult Function(String userEmail) updateImageUrl,
    required TResult Function(String userEmail, String newName) updateName,
    required TResult Function(String userEmail, double newWeight) updateWeight,
    required TResult Function(String userEmail, Grade newGrade) updateGrade,
    required TResult Function(String userEmail, String newGymId) updateSelectedGym,
  }) {
    return updateName(userEmail, newName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeProfile,
    TResult Function(User user, bool isCurrentUser)? profileUpdated,
    TResult Function(String userEmail)? updateImageUrl,
    TResult Function(String userEmail, String newName)? updateName,
    TResult Function(String userEmail, double newWeight)? updateWeight,
    TResult Function(String userEmail, Grade newGrade)? updateGrade,
    TResult Function(String userEmail, String newGymId)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateName != null) {
      return updateName(userEmail, newName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeProfile value) initializeProfile,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateWeight value) updateWeight,
    required TResult Function(UpdateGrade value) updateGrade,
    required TResult Function(UpdateSelectedGym value) updateSelectedGym,
  }) {
    return updateName(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeProfile value)? initializeProfile,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateWeight value)? updateWeight,
    TResult Function(UpdateGrade value)? updateGrade,
    TResult Function(UpdateSelectedGym value)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateName != null) {
      return updateName(this);
    }
    return orElse();
  }
}

abstract class UpdateName implements ProfileEvent {
  const factory UpdateName({required String userEmail, required String newName}) = _$UpdateName;

  String get userEmail => throw _privateConstructorUsedError;
  String get newName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateNameCopyWith<UpdateName> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateWeightCopyWith<$Res> {
  factory $UpdateWeightCopyWith(UpdateWeight value, $Res Function(UpdateWeight) then) =
      _$UpdateWeightCopyWithImpl<$Res>;
  $Res call({String userEmail, double newWeight});
}

/// @nodoc
class _$UpdateWeightCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements $UpdateWeightCopyWith<$Res> {
  _$UpdateWeightCopyWithImpl(UpdateWeight _value, $Res Function(UpdateWeight) _then)
      : super(_value, (v) => _then(v as UpdateWeight));

  @override
  UpdateWeight get _value => super._value as UpdateWeight;

  @override
  $Res call({
    Object? userEmail = freezed,
    Object? newWeight = freezed,
  }) {
    return _then(UpdateWeight(
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      newWeight: newWeight == freezed
          ? _value.newWeight
          : newWeight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdateWeight with DiagnosticableTreeMixin implements UpdateWeight {
  const _$UpdateWeight({required this.userEmail, required this.newWeight});

  @override
  final String userEmail;
  @override
  final double newWeight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.updateWeight(userEmail: $userEmail, newWeight: $newWeight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEvent.updateWeight'))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('newWeight', newWeight));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateWeight &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality().equals(other.userEmail, userEmail)) &&
            (identical(other.newWeight, newWeight) ||
                const DeepCollectionEquality().equals(other.newWeight, newWeight)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(newWeight);

  @JsonKey(ignore: true)
  @override
  $UpdateWeightCopyWith<UpdateWeight> get copyWith =>
      _$UpdateWeightCopyWithImpl<UpdateWeight>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeProfile,
    required TResult Function(User user, bool isCurrentUser) profileUpdated,
    required TResult Function(String userEmail) updateImageUrl,
    required TResult Function(String userEmail, String newName) updateName,
    required TResult Function(String userEmail, double newWeight) updateWeight,
    required TResult Function(String userEmail, Grade newGrade) updateGrade,
    required TResult Function(String userEmail, String newGymId) updateSelectedGym,
  }) {
    return updateWeight(userEmail, newWeight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeProfile,
    TResult Function(User user, bool isCurrentUser)? profileUpdated,
    TResult Function(String userEmail)? updateImageUrl,
    TResult Function(String userEmail, String newName)? updateName,
    TResult Function(String userEmail, double newWeight)? updateWeight,
    TResult Function(String userEmail, Grade newGrade)? updateGrade,
    TResult Function(String userEmail, String newGymId)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateWeight != null) {
      return updateWeight(userEmail, newWeight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeProfile value) initializeProfile,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateWeight value) updateWeight,
    required TResult Function(UpdateGrade value) updateGrade,
    required TResult Function(UpdateSelectedGym value) updateSelectedGym,
  }) {
    return updateWeight(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeProfile value)? initializeProfile,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateWeight value)? updateWeight,
    TResult Function(UpdateGrade value)? updateGrade,
    TResult Function(UpdateSelectedGym value)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateWeight != null) {
      return updateWeight(this);
    }
    return orElse();
  }
}

abstract class UpdateWeight implements ProfileEvent {
  const factory UpdateWeight({required String userEmail, required double newWeight}) =
      _$UpdateWeight;

  String get userEmail => throw _privateConstructorUsedError;
  double get newWeight => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateWeightCopyWith<UpdateWeight> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateGradeCopyWith<$Res> {
  factory $UpdateGradeCopyWith(UpdateGrade value, $Res Function(UpdateGrade) then) =
      _$UpdateGradeCopyWithImpl<$Res>;
  $Res call({String userEmail, Grade newGrade});
}

/// @nodoc
class _$UpdateGradeCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements $UpdateGradeCopyWith<$Res> {
  _$UpdateGradeCopyWithImpl(UpdateGrade _value, $Res Function(UpdateGrade) _then)
      : super(_value, (v) => _then(v as UpdateGrade));

  @override
  UpdateGrade get _value => super._value as UpdateGrade;

  @override
  $Res call({
    Object? userEmail = freezed,
    Object? newGrade = freezed,
  }) {
    return _then(UpdateGrade(
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      newGrade: newGrade == freezed
          ? _value.newGrade
          : newGrade // ignore: cast_nullable_to_non_nullable
              as Grade,
    ));
  }
}

/// @nodoc

class _$UpdateGrade with DiagnosticableTreeMixin implements UpdateGrade {
  const _$UpdateGrade({required this.userEmail, required this.newGrade});

  @override
  final String userEmail;
  @override
  final Grade newGrade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.updateGrade(userEmail: $userEmail, newGrade: $newGrade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEvent.updateGrade'))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('newGrade', newGrade));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateGrade &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality().equals(other.userEmail, userEmail)) &&
            (identical(other.newGrade, newGrade) ||
                const DeepCollectionEquality().equals(other.newGrade, newGrade)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(newGrade);

  @JsonKey(ignore: true)
  @override
  $UpdateGradeCopyWith<UpdateGrade> get copyWith =>
      _$UpdateGradeCopyWithImpl<UpdateGrade>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeProfile,
    required TResult Function(User user, bool isCurrentUser) profileUpdated,
    required TResult Function(String userEmail) updateImageUrl,
    required TResult Function(String userEmail, String newName) updateName,
    required TResult Function(String userEmail, double newWeight) updateWeight,
    required TResult Function(String userEmail, Grade newGrade) updateGrade,
    required TResult Function(String userEmail, String newGymId) updateSelectedGym,
  }) {
    return updateGrade(userEmail, newGrade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeProfile,
    TResult Function(User user, bool isCurrentUser)? profileUpdated,
    TResult Function(String userEmail)? updateImageUrl,
    TResult Function(String userEmail, String newName)? updateName,
    TResult Function(String userEmail, double newWeight)? updateWeight,
    TResult Function(String userEmail, Grade newGrade)? updateGrade,
    TResult Function(String userEmail, String newGymId)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateGrade != null) {
      return updateGrade(userEmail, newGrade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeProfile value) initializeProfile,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateWeight value) updateWeight,
    required TResult Function(UpdateGrade value) updateGrade,
    required TResult Function(UpdateSelectedGym value) updateSelectedGym,
  }) {
    return updateGrade(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeProfile value)? initializeProfile,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateWeight value)? updateWeight,
    TResult Function(UpdateGrade value)? updateGrade,
    TResult Function(UpdateSelectedGym value)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateGrade != null) {
      return updateGrade(this);
    }
    return orElse();
  }
}

abstract class UpdateGrade implements ProfileEvent {
  const factory UpdateGrade({required String userEmail, required Grade newGrade}) = _$UpdateGrade;

  String get userEmail => throw _privateConstructorUsedError;
  Grade get newGrade => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateGradeCopyWith<UpdateGrade> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSelectedGymCopyWith<$Res> {
  factory $UpdateSelectedGymCopyWith(
          UpdateSelectedGym value, $Res Function(UpdateSelectedGym) then) =
      _$UpdateSelectedGymCopyWithImpl<$Res>;
  $Res call({String userEmail, String newGymId});
}

/// @nodoc
class _$UpdateSelectedGymCopyWithImpl<$Res> extends _$ProfileEventCopyWithImpl<$Res>
    implements $UpdateSelectedGymCopyWith<$Res> {
  _$UpdateSelectedGymCopyWithImpl(UpdateSelectedGym _value, $Res Function(UpdateSelectedGym) _then)
      : super(_value, (v) => _then(v as UpdateSelectedGym));

  @override
  UpdateSelectedGym get _value => super._value as UpdateSelectedGym;

  @override
  $Res call({
    Object? userEmail = freezed,
    Object? newGymId = freezed,
  }) {
    return _then(UpdateSelectedGym(
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      newGymId: newGymId == freezed
          ? _value.newGymId
          : newGymId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSelectedGym with DiagnosticableTreeMixin implements UpdateSelectedGym {
  const _$UpdateSelectedGym({required this.userEmail, required this.newGymId});

  @override
  final String userEmail;
  @override
  final String newGymId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileEvent.updateSelectedGym(userEmail: $userEmail, newGymId: $newGymId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileEvent.updateSelectedGym'))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('newGymId', newGymId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateSelectedGym &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality().equals(other.userEmail, userEmail)) &&
            (identical(other.newGymId, newGymId) ||
                const DeepCollectionEquality().equals(other.newGymId, newGymId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(newGymId);

  @JsonKey(ignore: true)
  @override
  $UpdateSelectedGymCopyWith<UpdateSelectedGym> get copyWith =>
      _$UpdateSelectedGymCopyWithImpl<UpdateSelectedGym>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeProfile,
    required TResult Function(User user, bool isCurrentUser) profileUpdated,
    required TResult Function(String userEmail) updateImageUrl,
    required TResult Function(String userEmail, String newName) updateName,
    required TResult Function(String userEmail, double newWeight) updateWeight,
    required TResult Function(String userEmail, Grade newGrade) updateGrade,
    required TResult Function(String userEmail, String newGymId) updateSelectedGym,
  }) {
    return updateSelectedGym(userEmail, newGymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeProfile,
    TResult Function(User user, bool isCurrentUser)? profileUpdated,
    TResult Function(String userEmail)? updateImageUrl,
    TResult Function(String userEmail, String newName)? updateName,
    TResult Function(String userEmail, double newWeight)? updateWeight,
    TResult Function(String userEmail, Grade newGrade)? updateGrade,
    TResult Function(String userEmail, String newGymId)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateSelectedGym != null) {
      return updateSelectedGym(userEmail, newGymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeProfile value) initializeProfile,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateWeight value) updateWeight,
    required TResult Function(UpdateGrade value) updateGrade,
    required TResult Function(UpdateSelectedGym value) updateSelectedGym,
  }) {
    return updateSelectedGym(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeProfile value)? initializeProfile,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateWeight value)? updateWeight,
    TResult Function(UpdateGrade value)? updateGrade,
    TResult Function(UpdateSelectedGym value)? updateSelectedGym,
    required TResult orElse(),
  }) {
    if (updateSelectedGym != null) {
      return updateSelectedGym(this);
    }
    return orElse();
  }
}

abstract class UpdateSelectedGym implements ProfileEvent {
  const factory UpdateSelectedGym({required String userEmail, required String newGymId}) =
      _$UpdateSelectedGym;

  String get userEmail => throw _privateConstructorUsedError;
  String get newGymId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateSelectedGymCopyWith<UpdateSelectedGym> get copyWith => throw _privateConstructorUsedError;
}
