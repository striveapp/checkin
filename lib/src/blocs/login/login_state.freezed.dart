// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginStateTearOff {
  const _$LoginStateTearOff();

// ignore: unused_element
  LoginInitial loginInitial() {
    return const LoginInitial();
  }

// ignore: unused_element
  LoginLoading loginLoading() {
    return const LoginLoading();
  }

// ignore: unused_element
  LoginSuccess loginSuccess({User loggedUser}) {
    return LoginSuccess(
      loggedUser: loggedUser,
    );
  }

// ignore: unused_element
  LoginFailure loginWithTestUserOwner({String errorMessage}) {
    return LoginFailure(
      errorMessage: errorMessage,
    );
  }
}

// ignore: unused_element
const $LoginState = _$LoginStateTearOff();

mixin _$LoginState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginInitial(),
    @required Result loginLoading(),
    @required Result loginSuccess(User loggedUser),
    @required Result loginWithTestUserOwner(String errorMessage),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginInitial(),
    Result loginLoading(),
    Result loginSuccess(User loggedUser),
    Result loginWithTestUserOwner(String errorMessage),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginInitial(LoginInitial value),
    @required Result loginLoading(LoginLoading value),
    @required Result loginSuccess(LoginSuccess value),
    @required Result loginWithTestUserOwner(LoginFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginInitial(LoginInitial value),
    Result loginLoading(LoginLoading value),
    Result loginSuccess(LoginSuccess value),
    Result loginWithTestUserOwner(LoginFailure value),
    @required Result orElse(),
  });
}

abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

abstract class $LoginInitialCopyWith<$Res> {
  factory $LoginInitialCopyWith(
          LoginInitial value, $Res Function(LoginInitial) then) =
      _$LoginInitialCopyWithImpl<$Res>;
}

class _$LoginInitialCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginInitialCopyWith<$Res> {
  _$LoginInitialCopyWithImpl(
      LoginInitial _value, $Res Function(LoginInitial) _then)
      : super(_value, (v) => _then(v as LoginInitial));

  @override
  LoginInitial get _value => super._value as LoginInitial;
}

class _$LoginInitial with DiagnosticableTreeMixin implements LoginInitial {
  const _$LoginInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.loginInitial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoginState.loginInitial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginInitial(),
    @required Result loginLoading(),
    @required Result loginSuccess(User loggedUser),
    @required Result loginWithTestUserOwner(String errorMessage),
  }) {
    assert(loginInitial != null);
    assert(loginLoading != null);
    assert(loginSuccess != null);
    assert(loginWithTestUserOwner != null);
    return loginInitial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginInitial(),
    Result loginLoading(),
    Result loginSuccess(User loggedUser),
    Result loginWithTestUserOwner(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginInitial != null) {
      return loginInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginInitial(LoginInitial value),
    @required Result loginLoading(LoginLoading value),
    @required Result loginSuccess(LoginSuccess value),
    @required Result loginWithTestUserOwner(LoginFailure value),
  }) {
    assert(loginInitial != null);
    assert(loginLoading != null);
    assert(loginSuccess != null);
    assert(loginWithTestUserOwner != null);
    return loginInitial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginInitial(LoginInitial value),
    Result loginLoading(LoginLoading value),
    Result loginSuccess(LoginSuccess value),
    Result loginWithTestUserOwner(LoginFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginInitial != null) {
      return loginInitial(this);
    }
    return orElse();
  }
}

abstract class LoginInitial implements LoginState {
  const factory LoginInitial() = _$LoginInitial;
}

abstract class $LoginLoadingCopyWith<$Res> {
  factory $LoginLoadingCopyWith(
          LoginLoading value, $Res Function(LoginLoading) then) =
      _$LoginLoadingCopyWithImpl<$Res>;
}

class _$LoginLoadingCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginLoadingCopyWith<$Res> {
  _$LoginLoadingCopyWithImpl(
      LoginLoading _value, $Res Function(LoginLoading) _then)
      : super(_value, (v) => _then(v as LoginLoading));

  @override
  LoginLoading get _value => super._value as LoginLoading;
}

class _$LoginLoading with DiagnosticableTreeMixin implements LoginLoading {
  const _$LoginLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.loginLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoginState.loginLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginInitial(),
    @required Result loginLoading(),
    @required Result loginSuccess(User loggedUser),
    @required Result loginWithTestUserOwner(String errorMessage),
  }) {
    assert(loginInitial != null);
    assert(loginLoading != null);
    assert(loginSuccess != null);
    assert(loginWithTestUserOwner != null);
    return loginLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginInitial(),
    Result loginLoading(),
    Result loginSuccess(User loggedUser),
    Result loginWithTestUserOwner(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginLoading != null) {
      return loginLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginInitial(LoginInitial value),
    @required Result loginLoading(LoginLoading value),
    @required Result loginSuccess(LoginSuccess value),
    @required Result loginWithTestUserOwner(LoginFailure value),
  }) {
    assert(loginInitial != null);
    assert(loginLoading != null);
    assert(loginSuccess != null);
    assert(loginWithTestUserOwner != null);
    return loginLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginInitial(LoginInitial value),
    Result loginLoading(LoginLoading value),
    Result loginSuccess(LoginSuccess value),
    Result loginWithTestUserOwner(LoginFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginLoading != null) {
      return loginLoading(this);
    }
    return orElse();
  }
}

abstract class LoginLoading implements LoginState {
  const factory LoginLoading() = _$LoginLoading;
}

abstract class $LoginSuccessCopyWith<$Res> {
  factory $LoginSuccessCopyWith(
          LoginSuccess value, $Res Function(LoginSuccess) then) =
      _$LoginSuccessCopyWithImpl<$Res>;
  $Res call({User loggedUser});
}

class _$LoginSuccessCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(
      LoginSuccess _value, $Res Function(LoginSuccess) _then)
      : super(_value, (v) => _then(v as LoginSuccess));

  @override
  LoginSuccess get _value => super._value as LoginSuccess;

  @override
  $Res call({
    Object loggedUser = freezed,
  }) {
    return _then(LoginSuccess(
      loggedUser:
          loggedUser == freezed ? _value.loggedUser : loggedUser as User,
    ));
  }
}

class _$LoginSuccess with DiagnosticableTreeMixin implements LoginSuccess {
  const _$LoginSuccess({this.loggedUser});

  @override
  final User loggedUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.loginSuccess(loggedUser: $loggedUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState.loginSuccess'))
      ..add(DiagnosticsProperty('loggedUser', loggedUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginSuccess &&
            (identical(other.loggedUser, loggedUser) ||
                const DeepCollectionEquality()
                    .equals(other.loggedUser, loggedUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(loggedUser);

  @override
  $LoginSuccessCopyWith<LoginSuccess> get copyWith =>
      _$LoginSuccessCopyWithImpl<LoginSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginInitial(),
    @required Result loginLoading(),
    @required Result loginSuccess(User loggedUser),
    @required Result loginWithTestUserOwner(String errorMessage),
  }) {
    assert(loginInitial != null);
    assert(loginLoading != null);
    assert(loginSuccess != null);
    assert(loginWithTestUserOwner != null);
    return loginSuccess(loggedUser);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginInitial(),
    Result loginLoading(),
    Result loginSuccess(User loggedUser),
    Result loginWithTestUserOwner(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginSuccess != null) {
      return loginSuccess(loggedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginInitial(LoginInitial value),
    @required Result loginLoading(LoginLoading value),
    @required Result loginSuccess(LoginSuccess value),
    @required Result loginWithTestUserOwner(LoginFailure value),
  }) {
    assert(loginInitial != null);
    assert(loginLoading != null);
    assert(loginSuccess != null);
    assert(loginWithTestUserOwner != null);
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginInitial(LoginInitial value),
    Result loginLoading(LoginLoading value),
    Result loginSuccess(LoginSuccess value),
    Result loginWithTestUserOwner(LoginFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class LoginSuccess implements LoginState {
  const factory LoginSuccess({User loggedUser}) = _$LoginSuccess;

  User get loggedUser;
  $LoginSuccessCopyWith<LoginSuccess> get copyWith;
}

abstract class $LoginFailureCopyWith<$Res> {
  factory $LoginFailureCopyWith(
          LoginFailure value, $Res Function(LoginFailure) then) =
      _$LoginFailureCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

class _$LoginFailureCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginFailureCopyWith<$Res> {
  _$LoginFailureCopyWithImpl(
      LoginFailure _value, $Res Function(LoginFailure) _then)
      : super(_value, (v) => _then(v as LoginFailure));

  @override
  LoginFailure get _value => super._value as LoginFailure;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(LoginFailure(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

class _$LoginFailure with DiagnosticableTreeMixin implements LoginFailure {
  const _$LoginFailure({this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.loginWithTestUserOwner(errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState.loginWithTestUserOwner'))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginFailure &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @override
  $LoginFailureCopyWith<LoginFailure> get copyWith =>
      _$LoginFailureCopyWithImpl<LoginFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginInitial(),
    @required Result loginLoading(),
    @required Result loginSuccess(User loggedUser),
    @required Result loginWithTestUserOwner(String errorMessage),
  }) {
    assert(loginInitial != null);
    assert(loginLoading != null);
    assert(loginSuccess != null);
    assert(loginWithTestUserOwner != null);
    return loginWithTestUserOwner(errorMessage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginInitial(),
    Result loginLoading(),
    Result loginSuccess(User loggedUser),
    Result loginWithTestUserOwner(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithTestUserOwner != null) {
      return loginWithTestUserOwner(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginInitial(LoginInitial value),
    @required Result loginLoading(LoginLoading value),
    @required Result loginSuccess(LoginSuccess value),
    @required Result loginWithTestUserOwner(LoginFailure value),
  }) {
    assert(loginInitial != null);
    assert(loginLoading != null);
    assert(loginSuccess != null);
    assert(loginWithTestUserOwner != null);
    return loginWithTestUserOwner(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginInitial(LoginInitial value),
    Result loginLoading(LoginLoading value),
    Result loginSuccess(LoginSuccess value),
    Result loginWithTestUserOwner(LoginFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithTestUserOwner != null) {
      return loginWithTestUserOwner(this);
    }
    return orElse();
  }
}

abstract class LoginFailure implements LoginState {
  const factory LoginFailure({String errorMessage}) = _$LoginFailure;

  String get errorMessage;
  $LoginFailureCopyWith<LoginFailure> get copyWith;
}
