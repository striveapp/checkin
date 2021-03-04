// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

// ignore: unused_element
  AppStarted appStarted() {
    return const AppStarted();
  }

// ignore: unused_element
  AuthUpdated authUpdated({User loggedUser}) {
    return AuthUpdated(
      loggedUser: loggedUser,
    );
  }

// ignore: unused_element
  LogOut logOut() {
    return const LogOut();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult appStarted(),
    @required TResult authUpdated(User loggedUser),
    @required TResult logOut(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult appStarted(),
    TResult authUpdated(User loggedUser),
    TResult logOut(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult appStarted(AppStarted value),
    @required TResult authUpdated(AuthUpdated value),
    @required TResult logOut(LogOut value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult appStarted(AppStarted value),
    TResult authUpdated(AuthUpdated value),
    TResult logOut(LogOut value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $AppStartedCopyWith<$Res> {
  factory $AppStartedCopyWith(
          AppStarted value, $Res Function(AppStarted) then) =
      _$AppStartedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStartedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AppStartedCopyWith<$Res> {
  _$AppStartedCopyWithImpl(AppStarted _value, $Res Function(AppStarted) _then)
      : super(_value, (v) => _then(v as AppStarted));

  @override
  AppStarted get _value => super._value as AppStarted;
}

/// @nodoc
class _$AppStarted with DiagnosticableTreeMixin implements AppStarted {
  const _$AppStarted();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.appStarted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthEvent.appStarted'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AppStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult appStarted(),
    @required TResult authUpdated(User loggedUser),
    @required TResult logOut(),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return appStarted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult appStarted(),
    TResult authUpdated(User loggedUser),
    TResult logOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (appStarted != null) {
      return appStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult appStarted(AppStarted value),
    @required TResult authUpdated(AuthUpdated value),
    @required TResult logOut(LogOut value),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return appStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult appStarted(AppStarted value),
    TResult authUpdated(AuthUpdated value),
    TResult logOut(LogOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (appStarted != null) {
      return appStarted(this);
    }
    return orElse();
  }
}

abstract class AppStarted implements AuthEvent {
  const factory AppStarted() = _$AppStarted;
}

/// @nodoc
abstract class $AuthUpdatedCopyWith<$Res> {
  factory $AuthUpdatedCopyWith(
          AuthUpdated value, $Res Function(AuthUpdated) then) =
      _$AuthUpdatedCopyWithImpl<$Res>;
  $Res call({User loggedUser});

  $UserCopyWith<$Res> get loggedUser;
}

/// @nodoc
class _$AuthUpdatedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthUpdatedCopyWith<$Res> {
  _$AuthUpdatedCopyWithImpl(
      AuthUpdated _value, $Res Function(AuthUpdated) _then)
      : super(_value, (v) => _then(v as AuthUpdated));

  @override
  AuthUpdated get _value => super._value as AuthUpdated;

  @override
  $Res call({
    Object loggedUser = freezed,
  }) {
    return _then(AuthUpdated(
      loggedUser:
          loggedUser == freezed ? _value.loggedUser : loggedUser as User,
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
class _$AuthUpdated with DiagnosticableTreeMixin implements AuthUpdated {
  const _$AuthUpdated({this.loggedUser});

  @override
  final User loggedUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.authUpdated(loggedUser: $loggedUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.authUpdated'))
      ..add(DiagnosticsProperty('loggedUser', loggedUser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthUpdated &&
            (identical(other.loggedUser, loggedUser) ||
                const DeepCollectionEquality()
                    .equals(other.loggedUser, loggedUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(loggedUser);

  @override
  $AuthUpdatedCopyWith<AuthUpdated> get copyWith =>
      _$AuthUpdatedCopyWithImpl<AuthUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult appStarted(),
    @required TResult authUpdated(User loggedUser),
    @required TResult logOut(),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return authUpdated(loggedUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult appStarted(),
    TResult authUpdated(User loggedUser),
    TResult logOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authUpdated != null) {
      return authUpdated(loggedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult appStarted(AppStarted value),
    @required TResult authUpdated(AuthUpdated value),
    @required TResult logOut(LogOut value),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return authUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult appStarted(AppStarted value),
    TResult authUpdated(AuthUpdated value),
    TResult logOut(LogOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authUpdated != null) {
      return authUpdated(this);
    }
    return orElse();
  }
}

abstract class AuthUpdated implements AuthEvent {
  const factory AuthUpdated({User loggedUser}) = _$AuthUpdated;

  User get loggedUser;
  $AuthUpdatedCopyWith<AuthUpdated> get copyWith;
}

/// @nodoc
abstract class $LogOutCopyWith<$Res> {
  factory $LogOutCopyWith(LogOut value, $Res Function(LogOut) then) =
      _$LogOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $LogOutCopyWith<$Res> {
  _$LogOutCopyWithImpl(LogOut _value, $Res Function(LogOut) _then)
      : super(_value, (v) => _then(v as LogOut));

  @override
  LogOut get _value => super._value as LogOut;
}

/// @nodoc
class _$LogOut with DiagnosticableTreeMixin implements LogOut {
  const _$LogOut();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.logOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthEvent.logOut'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LogOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult appStarted(),
    @required TResult authUpdated(User loggedUser),
    @required TResult logOut(),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult appStarted(),
    TResult authUpdated(User loggedUser),
    TResult logOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult appStarted(AppStarted value),
    @required TResult authUpdated(AuthUpdated value),
    @required TResult logOut(LogOut value),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult appStarted(AppStarted value),
    TResult authUpdated(AuthUpdated value),
    TResult logOut(LogOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class LogOut implements AuthEvent {
  const factory LogOut() = _$LogOut;
}
