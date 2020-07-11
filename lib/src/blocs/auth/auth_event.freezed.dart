// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  AppStarted appStarted() {
    return const AppStarted();
  }

  AuthUpdated authUpdated({User loggedUser}) {
    return AuthUpdated(
      loggedUser: loggedUser,
    );
  }

  LogOut logOut() {
    return const LogOut();
  }
}

// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

mixin _$AuthEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result authUpdated(User loggedUser),
    @required Result logOut(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result authUpdated(User loggedUser),
    Result logOut(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result authUpdated(AuthUpdated value),
    @required Result logOut(LogOut value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result authUpdated(AuthUpdated value),
    Result logOut(LogOut value),
    @required Result orElse(),
  });
}

abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

abstract class $AppStartedCopyWith<$Res> {
  factory $AppStartedCopyWith(
          AppStarted value, $Res Function(AppStarted) then) =
      _$AppStartedCopyWithImpl<$Res>;
}

class _$AppStartedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AppStartedCopyWith<$Res> {
  _$AppStartedCopyWithImpl(AppStarted _value, $Res Function(AppStarted) _then)
      : super(_value, (v) => _then(v as AppStarted));

  @override
  AppStarted get _value => super._value as AppStarted;
}

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
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result authUpdated(User loggedUser),
    @required Result logOut(),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return appStarted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result authUpdated(User loggedUser),
    Result logOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (appStarted != null) {
      return appStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result authUpdated(AuthUpdated value),
    @required Result logOut(LogOut value),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return appStarted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result authUpdated(AuthUpdated value),
    Result logOut(LogOut value),
    @required Result orElse(),
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

abstract class $AuthUpdatedCopyWith<$Res> {
  factory $AuthUpdatedCopyWith(
          AuthUpdated value, $Res Function(AuthUpdated) then) =
      _$AuthUpdatedCopyWithImpl<$Res>;
  $Res call({User loggedUser});
}

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
}

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
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result authUpdated(User loggedUser),
    @required Result logOut(),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return authUpdated(loggedUser);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result authUpdated(User loggedUser),
    Result logOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authUpdated != null) {
      return authUpdated(loggedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result authUpdated(AuthUpdated value),
    @required Result logOut(LogOut value),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return authUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result authUpdated(AuthUpdated value),
    Result logOut(LogOut value),
    @required Result orElse(),
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

abstract class $LogOutCopyWith<$Res> {
  factory $LogOutCopyWith(LogOut value, $Res Function(LogOut) then) =
      _$LogOutCopyWithImpl<$Res>;
}

class _$LogOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $LogOutCopyWith<$Res> {
  _$LogOutCopyWithImpl(LogOut _value, $Res Function(LogOut) _then)
      : super(_value, (v) => _then(v as LogOut));

  @override
  LogOut get _value => super._value as LogOut;
}

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
  Result when<Result extends Object>({
    @required Result appStarted(),
    @required Result authUpdated(User loggedUser),
    @required Result logOut(),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return logOut();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result appStarted(),
    Result authUpdated(User loggedUser),
    Result logOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result appStarted(AppStarted value),
    @required Result authUpdated(AuthUpdated value),
    @required Result logOut(LogOut value),
  }) {
    assert(appStarted != null);
    assert(authUpdated != null);
    assert(logOut != null);
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result appStarted(AppStarted value),
    Result authUpdated(AuthUpdated value),
    Result logOut(LogOut value),
    @required Result orElse(),
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