// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payment_methods_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PaymentMethodsEventTearOff {
  const _$PaymentMethodsEventTearOff();

// ignore: unused_element
  PaymentMethodUpdated paymentMethodUpdated(
      {@required String userEmail, PaymentMethod paymentMethod}) {
    return PaymentMethodUpdated(
      userEmail: userEmail,
      paymentMethod: paymentMethod,
    );
  }

// ignore: unused_element
  RegisterBankAccount registerBankAccount({@required Gym gym, @required String billingEmail}) {
    return RegisterBankAccount(
      gym: gym,
      billingEmail: billingEmail,
    );
  }

// ignore: unused_element
  ChangeBankAccount changeBankAccount({@required Gym gym, @required String billingEmail}) {
    return ChangeBankAccount(
      gym: gym,
      billingEmail: billingEmail,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PaymentMethodsEvent = _$PaymentMethodsEventTearOff();

/// @nodoc
mixin _$PaymentMethodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    @required TResult registerBankAccount(Gym gym, String billingEmail),
    @required TResult changeBankAccount(Gym gym, String billingEmail),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    TResult registerBankAccount(Gym gym, String billingEmail),
    TResult changeBankAccount(Gym gym, String billingEmail),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult paymentMethodUpdated(PaymentMethodUpdated value),
    @required TResult registerBankAccount(RegisterBankAccount value),
    @required TResult changeBankAccount(ChangeBankAccount value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult paymentMethodUpdated(PaymentMethodUpdated value),
    TResult registerBankAccount(RegisterBankAccount value),
    TResult changeBankAccount(ChangeBankAccount value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PaymentMethodsEventCopyWith<$Res> {
  factory $PaymentMethodsEventCopyWith(
          PaymentMethodsEvent value, $Res Function(PaymentMethodsEvent) then) =
      _$PaymentMethodsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentMethodsEventCopyWithImpl<$Res> implements $PaymentMethodsEventCopyWith<$Res> {
  _$PaymentMethodsEventCopyWithImpl(this._value, this._then);

  final PaymentMethodsEvent _value;
  // ignore: unused_field
  final $Res Function(PaymentMethodsEvent) _then;
}

/// @nodoc
abstract class $PaymentMethodUpdatedCopyWith<$Res> {
  factory $PaymentMethodUpdatedCopyWith(
          PaymentMethodUpdated value, $Res Function(PaymentMethodUpdated) then) =
      _$PaymentMethodUpdatedCopyWithImpl<$Res>;
  $Res call({String userEmail, PaymentMethod paymentMethod});

  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class _$PaymentMethodUpdatedCopyWithImpl<$Res> extends _$PaymentMethodsEventCopyWithImpl<$Res>
    implements $PaymentMethodUpdatedCopyWith<$Res> {
  _$PaymentMethodUpdatedCopyWithImpl(
      PaymentMethodUpdated _value, $Res Function(PaymentMethodUpdated) _then)
      : super(_value, (v) => _then(v as PaymentMethodUpdated));

  @override
  PaymentMethodUpdated get _value => super._value as PaymentMethodUpdated;

  @override
  $Res call({
    Object userEmail = freezed,
    Object paymentMethod = freezed,
  }) {
    return _then(PaymentMethodUpdated(
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      paymentMethod:
          paymentMethod == freezed ? _value.paymentMethod : paymentMethod as PaymentMethod,
    ));
  }

  @override
  $PaymentMethodCopyWith<$Res> get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }
    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value));
    });
  }
}

/// @nodoc
class _$PaymentMethodUpdated with DiagnosticableTreeMixin implements PaymentMethodUpdated {
  const _$PaymentMethodUpdated({@required this.userEmail, this.paymentMethod})
      : assert(userEmail != null);

  @override
  final String userEmail;
  @override
  final PaymentMethod paymentMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsEvent.paymentMethodUpdated(userEmail: $userEmail, paymentMethod: $paymentMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentMethodsEvent.paymentMethodUpdated'))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethodUpdated &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality().equals(other.userEmail, userEmail)) &&
            (identical(other.paymentMethod, paymentMethod) ||
                const DeepCollectionEquality().equals(other.paymentMethod, paymentMethod)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(paymentMethod);

  @JsonKey(ignore: true)
  @override
  $PaymentMethodUpdatedCopyWith<PaymentMethodUpdated> get copyWith =>
      _$PaymentMethodUpdatedCopyWithImpl<PaymentMethodUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    @required TResult registerBankAccount(Gym gym, String billingEmail),
    @required TResult changeBankAccount(Gym gym, String billingEmail),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return paymentMethodUpdated(userEmail, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    TResult registerBankAccount(Gym gym, String billingEmail),
    TResult changeBankAccount(Gym gym, String billingEmail),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(userEmail, paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult paymentMethodUpdated(PaymentMethodUpdated value),
    @required TResult registerBankAccount(RegisterBankAccount value),
    @required TResult changeBankAccount(ChangeBankAccount value),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return paymentMethodUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult paymentMethodUpdated(PaymentMethodUpdated value),
    TResult registerBankAccount(RegisterBankAccount value),
    TResult changeBankAccount(ChangeBankAccount value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodUpdated implements PaymentMethodsEvent {
  const factory PaymentMethodUpdated({@required String userEmail, PaymentMethod paymentMethod}) =
      _$PaymentMethodUpdated;

  String get userEmail;
  PaymentMethod get paymentMethod;
  @JsonKey(ignore: true)
  $PaymentMethodUpdatedCopyWith<PaymentMethodUpdated> get copyWith;
}

/// @nodoc
abstract class $RegisterBankAccountCopyWith<$Res> {
  factory $RegisterBankAccountCopyWith(
          RegisterBankAccount value, $Res Function(RegisterBankAccount) then) =
      _$RegisterBankAccountCopyWithImpl<$Res>;
  $Res call({Gym gym, String billingEmail});

  $GymCopyWith<$Res> get gym;
}

/// @nodoc
class _$RegisterBankAccountCopyWithImpl<$Res> extends _$PaymentMethodsEventCopyWithImpl<$Res>
    implements $RegisterBankAccountCopyWith<$Res> {
  _$RegisterBankAccountCopyWithImpl(
      RegisterBankAccount _value, $Res Function(RegisterBankAccount) _then)
      : super(_value, (v) => _then(v as RegisterBankAccount));

  @override
  RegisterBankAccount get _value => super._value as RegisterBankAccount;

  @override
  $Res call({
    Object gym = freezed,
    Object billingEmail = freezed,
  }) {
    return _then(RegisterBankAccount(
      gym: gym == freezed ? _value.gym : gym as Gym,
      billingEmail: billingEmail == freezed ? _value.billingEmail : billingEmail as String,
    ));
  }

  @override
  $GymCopyWith<$Res> get gym {
    if (_value.gym == null) {
      return null;
    }
    return $GymCopyWith<$Res>(_value.gym, (value) {
      return _then(_value.copyWith(gym: value));
    });
  }
}

/// @nodoc
class _$RegisterBankAccount with DiagnosticableTreeMixin implements RegisterBankAccount {
  const _$RegisterBankAccount({@required this.gym, @required this.billingEmail})
      : assert(gym != null),
        assert(billingEmail != null);

  @override
  final Gym gym;
  @override
  final String billingEmail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsEvent.registerBankAccount(gym: $gym, billingEmail: $billingEmail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentMethodsEvent.registerBankAccount'))
      ..add(DiagnosticsProperty('gym', gym))
      ..add(DiagnosticsProperty('billingEmail', billingEmail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterBankAccount &&
            (identical(other.gym, gym) || const DeepCollectionEquality().equals(other.gym, gym)) &&
            (identical(other.billingEmail, billingEmail) ||
                const DeepCollectionEquality().equals(other.billingEmail, billingEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gym) ^
      const DeepCollectionEquality().hash(billingEmail);

  @JsonKey(ignore: true)
  @override
  $RegisterBankAccountCopyWith<RegisterBankAccount> get copyWith =>
      _$RegisterBankAccountCopyWithImpl<RegisterBankAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    @required TResult registerBankAccount(Gym gym, String billingEmail),
    @required TResult changeBankAccount(Gym gym, String billingEmail),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return registerBankAccount(gym, billingEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    TResult registerBankAccount(Gym gym, String billingEmail),
    TResult changeBankAccount(Gym gym, String billingEmail),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerBankAccount != null) {
      return registerBankAccount(gym, billingEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult paymentMethodUpdated(PaymentMethodUpdated value),
    @required TResult registerBankAccount(RegisterBankAccount value),
    @required TResult changeBankAccount(ChangeBankAccount value),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return registerBankAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult paymentMethodUpdated(PaymentMethodUpdated value),
    TResult registerBankAccount(RegisterBankAccount value),
    TResult changeBankAccount(ChangeBankAccount value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerBankAccount != null) {
      return registerBankAccount(this);
    }
    return orElse();
  }
}

abstract class RegisterBankAccount implements PaymentMethodsEvent {
  const factory RegisterBankAccount({@required Gym gym, @required String billingEmail}) =
      _$RegisterBankAccount;

  Gym get gym;
  String get billingEmail;
  @JsonKey(ignore: true)
  $RegisterBankAccountCopyWith<RegisterBankAccount> get copyWith;
}

/// @nodoc
abstract class $ChangeBankAccountCopyWith<$Res> {
  factory $ChangeBankAccountCopyWith(
          ChangeBankAccount value, $Res Function(ChangeBankAccount) then) =
      _$ChangeBankAccountCopyWithImpl<$Res>;
  $Res call({Gym gym, String billingEmail});

  $GymCopyWith<$Res> get gym;
}

/// @nodoc
class _$ChangeBankAccountCopyWithImpl<$Res> extends _$PaymentMethodsEventCopyWithImpl<$Res>
    implements $ChangeBankAccountCopyWith<$Res> {
  _$ChangeBankAccountCopyWithImpl(ChangeBankAccount _value, $Res Function(ChangeBankAccount) _then)
      : super(_value, (v) => _then(v as ChangeBankAccount));

  @override
  ChangeBankAccount get _value => super._value as ChangeBankAccount;

  @override
  $Res call({
    Object gym = freezed,
    Object billingEmail = freezed,
  }) {
    return _then(ChangeBankAccount(
      gym: gym == freezed ? _value.gym : gym as Gym,
      billingEmail: billingEmail == freezed ? _value.billingEmail : billingEmail as String,
    ));
  }

  @override
  $GymCopyWith<$Res> get gym {
    if (_value.gym == null) {
      return null;
    }
    return $GymCopyWith<$Res>(_value.gym, (value) {
      return _then(_value.copyWith(gym: value));
    });
  }
}

/// @nodoc
class _$ChangeBankAccount with DiagnosticableTreeMixin implements ChangeBankAccount {
  const _$ChangeBankAccount({@required this.gym, @required this.billingEmail})
      : assert(gym != null),
        assert(billingEmail != null);

  @override
  final Gym gym;
  @override
  final String billingEmail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsEvent.changeBankAccount(gym: $gym, billingEmail: $billingEmail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentMethodsEvent.changeBankAccount'))
      ..add(DiagnosticsProperty('gym', gym))
      ..add(DiagnosticsProperty('billingEmail', billingEmail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeBankAccount &&
            (identical(other.gym, gym) || const DeepCollectionEquality().equals(other.gym, gym)) &&
            (identical(other.billingEmail, billingEmail) ||
                const DeepCollectionEquality().equals(other.billingEmail, billingEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gym) ^
      const DeepCollectionEquality().hash(billingEmail);

  @JsonKey(ignore: true)
  @override
  $ChangeBankAccountCopyWith<ChangeBankAccount> get copyWith =>
      _$ChangeBankAccountCopyWithImpl<ChangeBankAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    @required TResult registerBankAccount(Gym gym, String billingEmail),
    @required TResult changeBankAccount(Gym gym, String billingEmail),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return changeBankAccount(gym, billingEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    TResult registerBankAccount(Gym gym, String billingEmail),
    TResult changeBankAccount(Gym gym, String billingEmail),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeBankAccount != null) {
      return changeBankAccount(gym, billingEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult paymentMethodUpdated(PaymentMethodUpdated value),
    @required TResult registerBankAccount(RegisterBankAccount value),
    @required TResult changeBankAccount(ChangeBankAccount value),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return changeBankAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult paymentMethodUpdated(PaymentMethodUpdated value),
    TResult registerBankAccount(RegisterBankAccount value),
    TResult changeBankAccount(ChangeBankAccount value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeBankAccount != null) {
      return changeBankAccount(this);
    }
    return orElse();
  }
}

abstract class ChangeBankAccount implements PaymentMethodsEvent {
  const factory ChangeBankAccount({@required Gym gym, @required String billingEmail}) =
      _$ChangeBankAccount;

  Gym get gym;
  String get billingEmail;
  @JsonKey(ignore: true)
  $ChangeBankAccountCopyWith<ChangeBankAccount> get copyWith;
}
