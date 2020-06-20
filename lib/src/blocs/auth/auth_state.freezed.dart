// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  AuthUninitialized authUninitialized() {
    return const AuthUninitialized();
  }

  AuthAuthenticated authAuthenticated({User loggedUser}) {
    return AuthAuthenticated(
      loggedUser: loggedUser,
    );
  }

  AuthUnauthenticated authUnauthenticated({Error error}) {
    return AuthUnauthenticated(
      error: error,
    );
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authUninitialized(),
    @required Result authAuthenticated(User loggedUser),
    @required Result authUnauthenticated(Error error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authUninitialized(),
    Result authAuthenticated(User loggedUser),
    Result authUnauthenticated(Error error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authUninitialized(AuthUninitialized value),
    @required Result authAuthenticated(AuthAuthenticated value),
    @required Result authUnauthenticated(AuthUnauthenticated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authUninitialized(AuthUninitialized value),
    Result authAuthenticated(AuthAuthenticated value),
    Result authUnauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  });
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

abstract class $AuthUninitializedCopyWith<$Res> {
  factory $AuthUninitializedCopyWith(
          AuthUninitialized value, $Res Function(AuthUninitialized) then) =
      _$AuthUninitializedCopyWithImpl<$Res>;
}

class _$AuthUninitializedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthUninitializedCopyWith<$Res> {
  _$AuthUninitializedCopyWithImpl(
      AuthUninitialized _value, $Res Function(AuthUninitialized) _then)
      : super(_value, (v) => _then(v as AuthUninitialized));

  @override
  AuthUninitialized get _value => super._value as AuthUninitialized;
}

class _$AuthUninitialized
    with DiagnosticableTreeMixin
    implements AuthUninitialized {
  const _$AuthUninitialized();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.authUninitialized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.authUninitialized'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthUninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authUninitialized(),
    @required Result authAuthenticated(User loggedUser),
    @required Result authUnauthenticated(Error error),
  }) {
    assert(authUninitialized != null);
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authUninitialized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authUninitialized(),
    Result authAuthenticated(User loggedUser),
    Result authUnauthenticated(Error error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authUninitialized != null) {
      return authUninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authUninitialized(AuthUninitialized value),
    @required Result authAuthenticated(AuthAuthenticated value),
    @required Result authUnauthenticated(AuthUnauthenticated value),
  }) {
    assert(authUninitialized != null);
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authUninitialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authUninitialized(AuthUninitialized value),
    Result authAuthenticated(AuthAuthenticated value),
    Result authUnauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authUninitialized != null) {
      return authUninitialized(this);
    }
    return orElse();
  }
}

abstract class AuthUninitialized implements AuthState {
  const factory AuthUninitialized() = _$AuthUninitialized;
}

abstract class $AuthAuthenticatedCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(
          AuthAuthenticated value, $Res Function(AuthAuthenticated) then) =
      _$AuthAuthenticatedCopyWithImpl<$Res>;
  $Res call({User loggedUser});
}

class _$AuthAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(
      AuthAuthenticated _value, $Res Function(AuthAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthAuthenticated));

  @override
  AuthAuthenticated get _value => super._value as AuthAuthenticated;

  @override
  $Res call({
    Object loggedUser = freezed,
  }) {
    return _then(AuthAuthenticated(
      loggedUser:
          loggedUser == freezed ? _value.loggedUser : loggedUser as User,
    ));
  }
}

class _$AuthAuthenticated
    with DiagnosticableTreeMixin
    implements AuthAuthenticated {
  const _$AuthAuthenticated({this.loggedUser});

  @override
  final User loggedUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.authAuthenticated(loggedUser: $loggedUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.authAuthenticated'))
      ..add(DiagnosticsProperty('loggedUser', loggedUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthAuthenticated &&
            (identical(other.loggedUser, loggedUser) ||
                const DeepCollectionEquality()
                    .equals(other.loggedUser, loggedUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(loggedUser);

  @override
  $AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith =>
      _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authUninitialized(),
    @required Result authAuthenticated(User loggedUser),
    @required Result authUnauthenticated(Error error),
  }) {
    assert(authUninitialized != null);
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authAuthenticated(loggedUser);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authUninitialized(),
    Result authAuthenticated(User loggedUser),
    Result authUnauthenticated(Error error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authAuthenticated != null) {
      return authAuthenticated(loggedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authUninitialized(AuthUninitialized value),
    @required Result authAuthenticated(AuthAuthenticated value),
    @required Result authUnauthenticated(AuthUnauthenticated value),
  }) {
    assert(authUninitialized != null);
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authUninitialized(AuthUninitialized value),
    Result authAuthenticated(AuthAuthenticated value),
    Result authUnauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authAuthenticated != null) {
      return authAuthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthAuthenticated implements AuthState {
  const factory AuthAuthenticated({User loggedUser}) = _$AuthAuthenticated;

  User get loggedUser;
  $AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith;
}

abstract class $AuthUnauthenticatedCopyWith<$Res> {
  factory $AuthUnauthenticatedCopyWith(
          AuthUnauthenticated value, $Res Function(AuthUnauthenticated) then) =
      _$AuthUnauthenticatedCopyWithImpl<$Res>;
  $Res call({Error error});
}

class _$AuthUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthUnauthenticatedCopyWith<$Res> {
  _$AuthUnauthenticatedCopyWithImpl(
      AuthUnauthenticated _value, $Res Function(AuthUnauthenticated) _then)
      : super(_value, (v) => _then(v as AuthUnauthenticated));

  @override
  AuthUnauthenticated get _value => super._value as AuthUnauthenticated;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(AuthUnauthenticated(
      error: error == freezed ? _value.error : error as Error,
    ));
  }
}

class _$AuthUnauthenticated
    with DiagnosticableTreeMixin
    implements AuthUnauthenticated {
  const _$AuthUnauthenticated({this.error});

  @override
  final Error error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.authUnauthenticated(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.authUnauthenticated'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthUnauthenticated &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith =>
      _$AuthUnauthenticatedCopyWithImpl<AuthUnauthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authUninitialized(),
    @required Result authAuthenticated(User loggedUser),
    @required Result authUnauthenticated(Error error),
  }) {
    assert(authUninitialized != null);
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authUnauthenticated(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authUninitialized(),
    Result authAuthenticated(User loggedUser),
    Result authUnauthenticated(Error error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authUnauthenticated != null) {
      return authUnauthenticated(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authUninitialized(AuthUninitialized value),
    @required Result authAuthenticated(AuthAuthenticated value),
    @required Result authUnauthenticated(AuthUnauthenticated value),
  }) {
    assert(authUninitialized != null);
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authUnauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authUninitialized(AuthUninitialized value),
    Result authAuthenticated(AuthAuthenticated value),
    Result authUnauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authUnauthenticated != null) {
      return authUnauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticated implements AuthState {
  const factory AuthUnauthenticated({Error error}) = _$AuthUnauthenticated;

  Error get error;
  $AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith;
}
