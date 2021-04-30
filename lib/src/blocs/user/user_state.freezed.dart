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
}

/// @nodoc
// ignore: unused_element
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult userLoading(),
    @required TResult userSuccess(User currentUser),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult userLoading(),
    TResult userSuccess(User currentUser),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult userLoading(UserLoading value),
    @required TResult userSuccess(UserSuccess value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult userLoading(UserLoading value),
    TResult userSuccess(UserSuccess value),
    @required TResult orElse(),
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
  factory $UserLoadingCopyWith(UserLoading value, $Res Function(UserLoading) then) =
      _$UserLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserLoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserLoadingCopyWith<$Res> {
  _$UserLoadingCopyWithImpl(UserLoading _value, $Res Function(UserLoading) _then)
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
  TResult when<TResult extends Object>({
    @required TResult userLoading(),
    @required TResult userSuccess(User currentUser),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    return userLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult userLoading(),
    TResult userSuccess(User currentUser),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (userLoading != null) {
      return userLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult userLoading(UserLoading value),
    @required TResult userSuccess(UserSuccess value),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    return userLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult userLoading(UserLoading value),
    TResult userSuccess(UserSuccess value),
    @required TResult orElse(),
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
  factory $UserSuccessCopyWith(UserSuccess value, $Res Function(UserSuccess) then) =
      _$UserSuccessCopyWithImpl<$Res>;
  $Res call({User currentUser});

  $UserCopyWith<$Res> get currentUser;
}

/// @nodoc
class _$UserSuccessCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserSuccessCopyWith<$Res> {
  _$UserSuccessCopyWithImpl(UserSuccess _value, $Res Function(UserSuccess) _then)
      : super(_value, (v) => _then(v as UserSuccess));

  @override
  UserSuccess get _value => super._value as UserSuccess;

  @override
  $Res call({
    Object currentUser = freezed,
  }) {
    return _then(UserSuccess(
      currentUser: currentUser == freezed ? _value.currentUser : currentUser as User,
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
                const DeepCollectionEquality().equals(other.currentUser, currentUser)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentUser);

  @JsonKey(ignore: true)
  @override
  $UserSuccessCopyWith<UserSuccess> get copyWith =>
      _$UserSuccessCopyWithImpl<UserSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult userLoading(),
    @required TResult userSuccess(User currentUser),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    return userSuccess(currentUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult userLoading(),
    TResult userSuccess(User currentUser),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (userSuccess != null) {
      return userSuccess(currentUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult userLoading(UserLoading value),
    @required TResult userSuccess(UserSuccess value),
  }) {
    assert(userLoading != null);
    assert(userSuccess != null);
    return userSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult userLoading(UserLoading value),
    TResult userSuccess(UserSuccess value),
    @required TResult orElse(),
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
  @JsonKey(ignore: true)
  $UserSuccessCopyWith<UserSuccess> get copyWith;
}
