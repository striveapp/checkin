// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

// ignore: unused_element
  UserLoading userLoading() {
    return const UserLoading();
  }

// ignore: unused_element
  UserSuccess userSuccess({User currentUser}) {
    return UserSuccess(
      currentUser: currentUser,
    );
  }

// ignore: unused_element
  UserError userError() {
    return const UserError();
  }
}

/// @nodoc
// ignore: unused_element
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result userLoading(),
    @required Result userSuccess(User currentUser),
    @required Result userError(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userLoading(),
    Result userSuccess(User currentUser),
    Result userError(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userLoading(UserLoading value),
    @required Result userSuccess(UserSuccess value),
    @required Result userError(UserError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userLoading(UserLoading value),
    Result userSuccess(UserSuccess value),
    Result userError(UserError value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class $UserLoadingCopyWith<$Res> {
  factory $UserLoadingCopyWith(
          UserLoading value, $Res Function(UserLoading) then) =
      _$UserLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserLoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserLoadingCopyWith<$Res> {
  _$UserLoadingCopyWithImpl(
      UserLoading _value, $Res Function(UserLoading) _then)
      : super(_value, (v) => _then(v as UserLoading));

  @override
  UserLoading get _value => super._value as UserLoading;
}

/// @nodoc
class _$UserLoading with DiagnosticableTreeMixin implements UserLoading {
  const _$UserLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.userLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserState.userLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result userLoading(),
    @required Result userSuccess(User currentUser),
    @required Result userError(),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    assert(userError != null);
    return userLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userLoading(),
    Result userSuccess(User currentUser),
    Result userError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userLoading != null) {
      return userLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userLoading(UserLoading value),
    @required Result userSuccess(UserSuccess value),
    @required Result userError(UserError value),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    assert(userError != null);
    return userLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userLoading(UserLoading value),
    Result userSuccess(UserSuccess value),
    Result userError(UserError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userLoading != null) {
      return userLoading(this);
    }
    return orElse();
  }
}

abstract class UserLoading implements UserState {
  const factory UserLoading() = _$UserLoading;
}

/// @nodoc
abstract class $UserSuccessCopyWith<$Res> {
  factory $UserSuccessCopyWith(
          UserSuccess value, $Res Function(UserSuccess) then) =
      _$UserSuccessCopyWithImpl<$Res>;
  $Res call({User currentUser});
}

/// @nodoc
class _$UserSuccessCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserSuccessCopyWith<$Res> {
  _$UserSuccessCopyWithImpl(
      UserSuccess _value, $Res Function(UserSuccess) _then)
      : super(_value, (v) => _then(v as UserSuccess));

  @override
  UserSuccess get _value => super._value as UserSuccess;

  @override
  $Res call({
    Object currentUser = freezed,
  }) {
    return _then(UserSuccess(
      currentUser:
          currentUser == freezed ? _value.currentUser : currentUser as User,
    ));
  }
}

/// @nodoc
class _$UserSuccess with DiagnosticableTreeMixin implements UserSuccess {
  const _$UserSuccess({this.currentUser});

  @override
  final User currentUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.userSuccess(currentUser: $currentUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserState.userSuccess'))
      ..add(DiagnosticsProperty('currentUser', currentUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserSuccess &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentUser);

  @override
  $UserSuccessCopyWith<UserSuccess> get copyWith =>
      _$UserSuccessCopyWithImpl<UserSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result userLoading(),
    @required Result userSuccess(User currentUser),
    @required Result userError(),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    assert(userError != null);
    return userSuccess(currentUser);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userLoading(),
    Result userSuccess(User currentUser),
    Result userError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userSuccess != null) {
      return userSuccess(currentUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userLoading(UserLoading value),
    @required Result userSuccess(UserSuccess value),
    @required Result userError(UserError value),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    assert(userError != null);
    return userSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userLoading(UserLoading value),
    Result userSuccess(UserSuccess value),
    Result userError(UserError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userSuccess != null) {
      return userSuccess(this);
    }
    return orElse();
  }
}

abstract class UserSuccess implements UserState {
  const factory UserSuccess({User currentUser}) = _$UserSuccess;

  User get currentUser;
  $UserSuccessCopyWith<UserSuccess> get copyWith;
}

/// @nodoc
abstract class $UserErrorCopyWith<$Res> {
  factory $UserErrorCopyWith(UserError value, $Res Function(UserError) then) =
      _$UserErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserErrorCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserErrorCopyWith<$Res> {
  _$UserErrorCopyWithImpl(UserError _value, $Res Function(UserError) _then)
      : super(_value, (v) => _then(v as UserError));

  @override
  UserError get _value => super._value as UserError;
}

/// @nodoc
class _$UserError with DiagnosticableTreeMixin implements UserError {
  const _$UserError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.userError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserState.userError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result userLoading(),
    @required Result userSuccess(User currentUser),
    @required Result userError(),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    assert(userError != null);
    return userError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userLoading(),
    Result userSuccess(User currentUser),
    Result userError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userError != null) {
      return userError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userLoading(UserLoading value),
    @required Result userSuccess(UserSuccess value),
    @required Result userError(UserError value),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    assert(userError != null);
    return userError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userLoading(UserLoading value),
    Result userSuccess(UserSuccess value),
    Result userError(UserError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userError != null) {
      return userError(this);
    }
    return orElse();
  }
}

abstract class UserError implements UserState {
  const factory UserError() = _$UserError;
}
