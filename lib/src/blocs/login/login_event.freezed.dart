// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginEventTearOff {
  const _$LoginEventTearOff();

  LoginWithGoogle loginWithGoogle() {
    return const LoginWithGoogle();
  }

  LoginWithTestUser loginWithTestUser() {
    return const LoginWithTestUser();
  }

  LoginWithTestUserTwo loginWithTestUserTwo() {
    return const LoginWithTestUserTwo();
  }

  LoginWithTestUserOwner loginWithTestUserOwner() {
    return const LoginWithTestUserOwner();
  }
}

// ignore: unused_element
const $LoginEvent = _$LoginEventTearOff();

mixin _$LoginEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginWithGoogle(),
    @required Result loginWithTestUser(),
    @required Result loginWithTestUserTwo(),
    @required Result loginWithTestUserOwner(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginWithGoogle(),
    Result loginWithTestUser(),
    Result loginWithTestUserTwo(),
    Result loginWithTestUserOwner(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginWithGoogle(LoginWithGoogle value),
    @required Result loginWithTestUser(LoginWithTestUser value),
    @required Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    @required Result loginWithTestUserOwner(LoginWithTestUserOwner value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginWithGoogle(LoginWithGoogle value),
    Result loginWithTestUser(LoginWithTestUser value),
    Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    Result loginWithTestUserOwner(LoginWithTestUserOwner value),
    @required Result orElse(),
  });
}

abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res>;
}

class _$LoginEventCopyWithImpl<$Res> implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  final LoginEvent _value;
  // ignore: unused_field
  final $Res Function(LoginEvent) _then;
}

abstract class $LoginWithGoogleCopyWith<$Res> {
  factory $LoginWithGoogleCopyWith(
          LoginWithGoogle value, $Res Function(LoginWithGoogle) then) =
      _$LoginWithGoogleCopyWithImpl<$Res>;
}

class _$LoginWithGoogleCopyWithImpl<$Res> extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginWithGoogleCopyWith<$Res> {
  _$LoginWithGoogleCopyWithImpl(
      LoginWithGoogle _value, $Res Function(LoginWithGoogle) _then)
      : super(_value, (v) => _then(v as LoginWithGoogle));

  @override
  LoginWithGoogle get _value => super._value as LoginWithGoogle;
}

class _$LoginWithGoogle
    with DiagnosticableTreeMixin
    implements LoginWithGoogle {
  const _$LoginWithGoogle();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEvent.loginWithGoogle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoginEvent.loginWithGoogle'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginWithGoogle(),
    @required Result loginWithTestUser(),
    @required Result loginWithTestUserTwo(),
    @required Result loginWithTestUserOwner(),
  }) {
    assert(loginWithGoogle != null);
    assert(loginWithTestUser != null);
    assert(loginWithTestUserTwo != null);
    assert(loginWithTestUserOwner != null);
    return loginWithGoogle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginWithGoogle(),
    Result loginWithTestUser(),
    Result loginWithTestUserTwo(),
    Result loginWithTestUserOwner(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithGoogle != null) {
      return loginWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginWithGoogle(LoginWithGoogle value),
    @required Result loginWithTestUser(LoginWithTestUser value),
    @required Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    @required Result loginWithTestUserOwner(LoginWithTestUserOwner value),
  }) {
    assert(loginWithGoogle != null);
    assert(loginWithTestUser != null);
    assert(loginWithTestUserTwo != null);
    assert(loginWithTestUserOwner != null);
    return loginWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginWithGoogle(LoginWithGoogle value),
    Result loginWithTestUser(LoginWithTestUser value),
    Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    Result loginWithTestUserOwner(LoginWithTestUserOwner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithGoogle != null) {
      return loginWithGoogle(this);
    }
    return orElse();
  }
}

abstract class LoginWithGoogle implements LoginEvent {
  const factory LoginWithGoogle() = _$LoginWithGoogle;
}

abstract class $LoginWithTestUserCopyWith<$Res> {
  factory $LoginWithTestUserCopyWith(
          LoginWithTestUser value, $Res Function(LoginWithTestUser) then) =
      _$LoginWithTestUserCopyWithImpl<$Res>;
}

class _$LoginWithTestUserCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginWithTestUserCopyWith<$Res> {
  _$LoginWithTestUserCopyWithImpl(
      LoginWithTestUser _value, $Res Function(LoginWithTestUser) _then)
      : super(_value, (v) => _then(v as LoginWithTestUser));

  @override
  LoginWithTestUser get _value => super._value as LoginWithTestUser;
}

class _$LoginWithTestUser
    with DiagnosticableTreeMixin
    implements LoginWithTestUser {
  const _$LoginWithTestUser();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEvent.loginWithTestUser()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginEvent.loginWithTestUser'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginWithTestUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginWithGoogle(),
    @required Result loginWithTestUser(),
    @required Result loginWithTestUserTwo(),
    @required Result loginWithTestUserOwner(),
  }) {
    assert(loginWithGoogle != null);
    assert(loginWithTestUser != null);
    assert(loginWithTestUserTwo != null);
    assert(loginWithTestUserOwner != null);
    return loginWithTestUser();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginWithGoogle(),
    Result loginWithTestUser(),
    Result loginWithTestUserTwo(),
    Result loginWithTestUserOwner(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithTestUser != null) {
      return loginWithTestUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginWithGoogle(LoginWithGoogle value),
    @required Result loginWithTestUser(LoginWithTestUser value),
    @required Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    @required Result loginWithTestUserOwner(LoginWithTestUserOwner value),
  }) {
    assert(loginWithGoogle != null);
    assert(loginWithTestUser != null);
    assert(loginWithTestUserTwo != null);
    assert(loginWithTestUserOwner != null);
    return loginWithTestUser(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginWithGoogle(LoginWithGoogle value),
    Result loginWithTestUser(LoginWithTestUser value),
    Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    Result loginWithTestUserOwner(LoginWithTestUserOwner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithTestUser != null) {
      return loginWithTestUser(this);
    }
    return orElse();
  }
}

abstract class LoginWithTestUser implements LoginEvent {
  const factory LoginWithTestUser() = _$LoginWithTestUser;
}

abstract class $LoginWithTestUserTwoCopyWith<$Res> {
  factory $LoginWithTestUserTwoCopyWith(LoginWithTestUserTwo value,
          $Res Function(LoginWithTestUserTwo) then) =
      _$LoginWithTestUserTwoCopyWithImpl<$Res>;
}

class _$LoginWithTestUserTwoCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginWithTestUserTwoCopyWith<$Res> {
  _$LoginWithTestUserTwoCopyWithImpl(
      LoginWithTestUserTwo _value, $Res Function(LoginWithTestUserTwo) _then)
      : super(_value, (v) => _then(v as LoginWithTestUserTwo));

  @override
  LoginWithTestUserTwo get _value => super._value as LoginWithTestUserTwo;
}

class _$LoginWithTestUserTwo
    with DiagnosticableTreeMixin
    implements LoginWithTestUserTwo {
  const _$LoginWithTestUserTwo();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEvent.loginWithTestUserTwo()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginEvent.loginWithTestUserTwo'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginWithTestUserTwo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginWithGoogle(),
    @required Result loginWithTestUser(),
    @required Result loginWithTestUserTwo(),
    @required Result loginWithTestUserOwner(),
  }) {
    assert(loginWithGoogle != null);
    assert(loginWithTestUser != null);
    assert(loginWithTestUserTwo != null);
    assert(loginWithTestUserOwner != null);
    return loginWithTestUserTwo();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginWithGoogle(),
    Result loginWithTestUser(),
    Result loginWithTestUserTwo(),
    Result loginWithTestUserOwner(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithTestUserTwo != null) {
      return loginWithTestUserTwo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginWithGoogle(LoginWithGoogle value),
    @required Result loginWithTestUser(LoginWithTestUser value),
    @required Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    @required Result loginWithTestUserOwner(LoginWithTestUserOwner value),
  }) {
    assert(loginWithGoogle != null);
    assert(loginWithTestUser != null);
    assert(loginWithTestUserTwo != null);
    assert(loginWithTestUserOwner != null);
    return loginWithTestUserTwo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginWithGoogle(LoginWithGoogle value),
    Result loginWithTestUser(LoginWithTestUser value),
    Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    Result loginWithTestUserOwner(LoginWithTestUserOwner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithTestUserTwo != null) {
      return loginWithTestUserTwo(this);
    }
    return orElse();
  }
}

abstract class LoginWithTestUserTwo implements LoginEvent {
  const factory LoginWithTestUserTwo() = _$LoginWithTestUserTwo;
}

abstract class $LoginWithTestUserOwnerCopyWith<$Res> {
  factory $LoginWithTestUserOwnerCopyWith(LoginWithTestUserOwner value,
          $Res Function(LoginWithTestUserOwner) then) =
      _$LoginWithTestUserOwnerCopyWithImpl<$Res>;
}

class _$LoginWithTestUserOwnerCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginWithTestUserOwnerCopyWith<$Res> {
  _$LoginWithTestUserOwnerCopyWithImpl(LoginWithTestUserOwner _value,
      $Res Function(LoginWithTestUserOwner) _then)
      : super(_value, (v) => _then(v as LoginWithTestUserOwner));

  @override
  LoginWithTestUserOwner get _value => super._value as LoginWithTestUserOwner;
}

class _$LoginWithTestUserOwner
    with DiagnosticableTreeMixin
    implements LoginWithTestUserOwner {
  const _$LoginWithTestUserOwner();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEvent.loginWithTestUserOwner()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginEvent.loginWithTestUserOwner'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginWithTestUserOwner);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginWithGoogle(),
    @required Result loginWithTestUser(),
    @required Result loginWithTestUserTwo(),
    @required Result loginWithTestUserOwner(),
  }) {
    assert(loginWithGoogle != null);
    assert(loginWithTestUser != null);
    assert(loginWithTestUserTwo != null);
    assert(loginWithTestUserOwner != null);
    return loginWithTestUserOwner();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginWithGoogle(),
    Result loginWithTestUser(),
    Result loginWithTestUserTwo(),
    Result loginWithTestUserOwner(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithTestUserOwner != null) {
      return loginWithTestUserOwner();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loginWithGoogle(LoginWithGoogle value),
    @required Result loginWithTestUser(LoginWithTestUser value),
    @required Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    @required Result loginWithTestUserOwner(LoginWithTestUserOwner value),
  }) {
    assert(loginWithGoogle != null);
    assert(loginWithTestUser != null);
    assert(loginWithTestUserTwo != null);
    assert(loginWithTestUserOwner != null);
    return loginWithTestUserOwner(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginWithGoogle(LoginWithGoogle value),
    Result loginWithTestUser(LoginWithTestUser value),
    Result loginWithTestUserTwo(LoginWithTestUserTwo value),
    Result loginWithTestUserOwner(LoginWithTestUserOwner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithTestUserOwner != null) {
      return loginWithTestUserOwner(this);
    }
    return orElse();
  }
}

abstract class LoginWithTestUserOwner implements LoginEvent {
  const factory LoginWithTestUserOwner() = _$LoginWithTestUserOwner;
}
