// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

// ignore: unused_element
  LoginInitial loginInitial() {
    return const LoginInitial();
  }

// ignore: unused_element
  LoginFailure loginFailure({String errorMessage}) {
    return LoginFailure(
      errorMessage: errorMessage,
    );
  }

// ignore: unused_element
  WrongfullyInsertedEmail wrongfullyInsertedEmail() {
    return const WrongfullyInsertedEmail();
  }
}

/// @nodoc
// ignore: unused_element
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loginInitial(),
    @required TResult loginFailure(String errorMessage),
    @required TResult wrongfullyInsertedEmail(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loginInitial(),
    TResult loginFailure(String errorMessage),
    TResult wrongfullyInsertedEmail(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loginInitial(LoginInitial value),
    @required TResult loginFailure(LoginFailure value),
    @required TResult wrongfullyInsertedEmail(WrongfullyInsertedEmail value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loginInitial(LoginInitial value),
    TResult loginFailure(LoginFailure value),
    TResult wrongfullyInsertedEmail(WrongfullyInsertedEmail value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class $LoginInitialCopyWith<$Res> {
  factory $LoginInitialCopyWith(
          LoginInitial value, $Res Function(LoginInitial) then) =
      _$LoginInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginInitialCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginInitialCopyWith<$Res> {
  _$LoginInitialCopyWithImpl(
      LoginInitial _value, $Res Function(LoginInitial) _then)
      : super(_value, (v) => _then(v as LoginInitial));

  @override
  LoginInitial get _value => super._value as LoginInitial;
}

/// @nodoc
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
  TResult when<TResult extends Object>({
    @required TResult loginInitial(),
    @required TResult loginFailure(String errorMessage),
    @required TResult wrongfullyInsertedEmail(),
  }) {
    assert(loginInitial != null);
    assert(loginFailure != null);
    assert(wrongfullyInsertedEmail != null);
    return loginInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loginInitial(),
    TResult loginFailure(String errorMessage),
    TResult wrongfullyInsertedEmail(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loginInitial != null) {
      return loginInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loginInitial(LoginInitial value),
    @required TResult loginFailure(LoginFailure value),
    @required TResult wrongfullyInsertedEmail(WrongfullyInsertedEmail value),
  }) {
    assert(loginInitial != null);
    assert(loginFailure != null);
    assert(wrongfullyInsertedEmail != null);
    return loginInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loginInitial(LoginInitial value),
    TResult loginFailure(LoginFailure value),
    TResult wrongfullyInsertedEmail(WrongfullyInsertedEmail value),
    @required TResult orElse(),
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

/// @nodoc
abstract class $LoginFailureCopyWith<$Res> {
  factory $LoginFailureCopyWith(
          LoginFailure value, $Res Function(LoginFailure) then) =
      _$LoginFailureCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
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

/// @nodoc
class _$LoginFailure with DiagnosticableTreeMixin implements LoginFailure {
  const _$LoginFailure({this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.loginFailure(errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState.loginFailure'))
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
  TResult when<TResult extends Object>({
    @required TResult loginInitial(),
    @required TResult loginFailure(String errorMessage),
    @required TResult wrongfullyInsertedEmail(),
  }) {
    assert(loginInitial != null);
    assert(loginFailure != null);
    assert(wrongfullyInsertedEmail != null);
    return loginFailure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loginInitial(),
    TResult loginFailure(String errorMessage),
    TResult wrongfullyInsertedEmail(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loginFailure != null) {
      return loginFailure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loginInitial(LoginInitial value),
    @required TResult loginFailure(LoginFailure value),
    @required TResult wrongfullyInsertedEmail(WrongfullyInsertedEmail value),
  }) {
    assert(loginInitial != null);
    assert(loginFailure != null);
    assert(wrongfullyInsertedEmail != null);
    return loginFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loginInitial(LoginInitial value),
    TResult loginFailure(LoginFailure value),
    TResult wrongfullyInsertedEmail(WrongfullyInsertedEmail value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loginFailure != null) {
      return loginFailure(this);
    }
    return orElse();
  }
}

abstract class LoginFailure implements LoginState {
  const factory LoginFailure({String errorMessage}) = _$LoginFailure;

  String get errorMessage;
  $LoginFailureCopyWith<LoginFailure> get copyWith;
}

/// @nodoc
abstract class $WrongfullyInsertedEmailCopyWith<$Res> {
  factory $WrongfullyInsertedEmailCopyWith(WrongfullyInsertedEmail value,
          $Res Function(WrongfullyInsertedEmail) then) =
      _$WrongfullyInsertedEmailCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrongfullyInsertedEmailCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $WrongfullyInsertedEmailCopyWith<$Res> {
  _$WrongfullyInsertedEmailCopyWithImpl(WrongfullyInsertedEmail _value,
      $Res Function(WrongfullyInsertedEmail) _then)
      : super(_value, (v) => _then(v as WrongfullyInsertedEmail));

  @override
  WrongfullyInsertedEmail get _value => super._value as WrongfullyInsertedEmail;
}

/// @nodoc
class _$WrongfullyInsertedEmail
    with DiagnosticableTreeMixin
    implements WrongfullyInsertedEmail {
  const _$WrongfullyInsertedEmail();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState.wrongfullyInsertedEmail()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState.wrongfullyInsertedEmail'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is WrongfullyInsertedEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loginInitial(),
    @required TResult loginFailure(String errorMessage),
    @required TResult wrongfullyInsertedEmail(),
  }) {
    assert(loginInitial != null);
    assert(loginFailure != null);
    assert(wrongfullyInsertedEmail != null);
    return wrongfullyInsertedEmail();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loginInitial(),
    TResult loginFailure(String errorMessage),
    TResult wrongfullyInsertedEmail(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (wrongfullyInsertedEmail != null) {
      return wrongfullyInsertedEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loginInitial(LoginInitial value),
    @required TResult loginFailure(LoginFailure value),
    @required TResult wrongfullyInsertedEmail(WrongfullyInsertedEmail value),
  }) {
    assert(loginInitial != null);
    assert(loginFailure != null);
    assert(wrongfullyInsertedEmail != null);
    return wrongfullyInsertedEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loginInitial(LoginInitial value),
    TResult loginFailure(LoginFailure value),
    TResult wrongfullyInsertedEmail(WrongfullyInsertedEmail value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (wrongfullyInsertedEmail != null) {
      return wrongfullyInsertedEmail(this);
    }
    return orElse();
  }
}

abstract class WrongfullyInsertedEmail implements LoginState {
  const factory WrongfullyInsertedEmail() = _$WrongfullyInsertedEmail;
}
