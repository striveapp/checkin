// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  AuthAuthenticated authAuthenticated({User loggedUser}) {
    return AuthAuthenticated(
      loggedUser: loggedUser,
    );
  }

// ignore: unused_element
  AuthUnauthenticated authUnauthenticated({Error error}) {
    return AuthUnauthenticated(
      error: error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authAuthenticated(User loggedUser),
    @required TResult authUnauthenticated(Error error),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authAuthenticated(User loggedUser),
    TResult authUnauthenticated(Error error),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authAuthenticated(AuthAuthenticated value),
    @required TResult authUnauthenticated(AuthUnauthenticated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authAuthenticated(AuthAuthenticated value),
    TResult authUnauthenticated(AuthUnauthenticated value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $AuthAuthenticatedCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(
          AuthAuthenticated value, $Res Function(AuthAuthenticated) then) =
      _$AuthAuthenticatedCopyWithImpl<$Res>;
  $Res call({User loggedUser});

  $UserCopyWith<$Res> get loggedUser;
}

/// @nodoc
class _$AuthAuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(AuthAuthenticated _value, $Res Function(AuthAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthAuthenticated));

  @override
  AuthAuthenticated get _value => super._value as AuthAuthenticated;

  @override
  $Res call({
    Object loggedUser = freezed,
  }) {
    return _then(AuthAuthenticated(
      loggedUser: loggedUser == freezed ? _value.loggedUser : loggedUser as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get loggedUser {
    if (_value.loggedUser == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.loggedUser, (value) {
      return _then(_value.copyWith(loggedUser: value));
    });
  }
}

/// @nodoc
class _$AuthAuthenticated with DiagnosticableTreeMixin implements AuthAuthenticated {
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
                const DeepCollectionEquality().equals(other.loggedUser, loggedUser)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(loggedUser);

  @JsonKey(ignore: true)
  @override
  $AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith =>
      _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authAuthenticated(User loggedUser),
    @required TResult authUnauthenticated(Error error),
  }) {
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authAuthenticated(loggedUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authAuthenticated(User loggedUser),
    TResult authUnauthenticated(Error error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authAuthenticated != null) {
      return authAuthenticated(loggedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authAuthenticated(AuthAuthenticated value),
    @required TResult authUnauthenticated(AuthUnauthenticated value),
  }) {
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authAuthenticated(AuthAuthenticated value),
    TResult authUnauthenticated(AuthUnauthenticated value),
    @required TResult orElse(),
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
  @JsonKey(ignore: true)
  $AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith;
}

/// @nodoc
abstract class $AuthUnauthenticatedCopyWith<$Res> {
  factory $AuthUnauthenticatedCopyWith(
          AuthUnauthenticated value, $Res Function(AuthUnauthenticated) then) =
      _$AuthUnauthenticatedCopyWithImpl<$Res>;
  $Res call({Error error});
}

/// @nodoc
class _$AuthUnauthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
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

/// @nodoc
class _$AuthUnauthenticated with DiagnosticableTreeMixin implements AuthUnauthenticated {
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
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith =>
      _$AuthUnauthenticatedCopyWithImpl<AuthUnauthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authAuthenticated(User loggedUser),
    @required TResult authUnauthenticated(Error error),
  }) {
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authUnauthenticated(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authAuthenticated(User loggedUser),
    TResult authUnauthenticated(Error error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authUnauthenticated != null) {
      return authUnauthenticated(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authAuthenticated(AuthAuthenticated value),
    @required TResult authUnauthenticated(AuthUnauthenticated value),
  }) {
    assert(authAuthenticated != null);
    assert(authUnauthenticated != null);
    return authUnauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authAuthenticated(AuthAuthenticated value),
    TResult authUnauthenticated(AuthUnauthenticated value),
    @required TResult orElse(),
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
  @JsonKey(ignore: true)
  $AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith;
}
