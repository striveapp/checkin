// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'payment_methods_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PaymentMethodsEventTearOff {
  const _$PaymentMethodsEventTearOff();

  PaymentMethodUpdated paymentMethodUpdated(
      {@required String userEmail, PaymentMethod paymentMethod}) {
    return PaymentMethodUpdated(
      userEmail: userEmail,
      paymentMethod: paymentMethod,
    );
  }

  RegisterBankAccount registerBankAccount(
      {@required Gym gym, @required String billingEmail}) {
    return RegisterBankAccount(
      gym: gym,
      billingEmail: billingEmail,
    );
  }

  ChangeBankAccount changeBankAccount(
      {@required Gym gym,
      @required String billingEmail,
      @required String customerId}) {
    return ChangeBankAccount(
      gym: gym,
      billingEmail: billingEmail,
      customerId: customerId,
    );
  }
}

// ignore: unused_element
const $PaymentMethodsEvent = _$PaymentMethodsEventTearOff();

mixin _$PaymentMethodsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result paymentMethodUpdated(
            String userEmail, PaymentMethod paymentMethod),
    @required Result registerBankAccount(Gym gym, String billingEmail),
    @required
        Result changeBankAccount(
            Gym gym, String billingEmail, String customerId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    Result registerBankAccount(Gym gym, String billingEmail),
    Result changeBankAccount(Gym gym, String billingEmail, String customerId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethodUpdated value),
    @required Result registerBankAccount(RegisterBankAccount value),
    @required Result changeBankAccount(ChangeBankAccount value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethodUpdated value),
    Result registerBankAccount(RegisterBankAccount value),
    Result changeBankAccount(ChangeBankAccount value),
    @required Result orElse(),
  });
}

abstract class $PaymentMethodsEventCopyWith<$Res> {
  factory $PaymentMethodsEventCopyWith(
          PaymentMethodsEvent value, $Res Function(PaymentMethodsEvent) then) =
      _$PaymentMethodsEventCopyWithImpl<$Res>;
}

class _$PaymentMethodsEventCopyWithImpl<$Res>
    implements $PaymentMethodsEventCopyWith<$Res> {
  _$PaymentMethodsEventCopyWithImpl(this._value, this._then);

  final PaymentMethodsEvent _value;
  // ignore: unused_field
  final $Res Function(PaymentMethodsEvent) _then;
}

abstract class $PaymentMethodUpdatedCopyWith<$Res> {
  factory $PaymentMethodUpdatedCopyWith(PaymentMethodUpdated value,
          $Res Function(PaymentMethodUpdated) then) =
      _$PaymentMethodUpdatedCopyWithImpl<$Res>;
  $Res call({String userEmail, PaymentMethod paymentMethod});

  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

class _$PaymentMethodUpdatedCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res>
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
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod as PaymentMethod,
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

class _$PaymentMethodUpdated
    with DiagnosticableTreeMixin
    implements PaymentMethodUpdated {
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
      ..add(DiagnosticsProperty(
          'type', 'PaymentMethodsEvent.paymentMethodUpdated'))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethodUpdated &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)) &&
            (identical(other.paymentMethod, paymentMethod) ||
                const DeepCollectionEquality()
                    .equals(other.paymentMethod, paymentMethod)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(paymentMethod);

  @override
  $PaymentMethodUpdatedCopyWith<PaymentMethodUpdated> get copyWith =>
      _$PaymentMethodUpdatedCopyWithImpl<PaymentMethodUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result paymentMethodUpdated(
            String userEmail, PaymentMethod paymentMethod),
    @required Result registerBankAccount(Gym gym, String billingEmail),
    @required
        Result changeBankAccount(
            Gym gym, String billingEmail, String customerId),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return paymentMethodUpdated(userEmail, paymentMethod);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    Result registerBankAccount(Gym gym, String billingEmail),
    Result changeBankAccount(Gym gym, String billingEmail, String customerId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(userEmail, paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethodUpdated value),
    @required Result registerBankAccount(RegisterBankAccount value),
    @required Result changeBankAccount(ChangeBankAccount value),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return paymentMethodUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethodUpdated value),
    Result registerBankAccount(RegisterBankAccount value),
    Result changeBankAccount(ChangeBankAccount value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodUpdated implements PaymentMethodsEvent {
  const factory PaymentMethodUpdated(
      {@required String userEmail,
      PaymentMethod paymentMethod}) = _$PaymentMethodUpdated;

  String get userEmail;
  PaymentMethod get paymentMethod;
  $PaymentMethodUpdatedCopyWith<PaymentMethodUpdated> get copyWith;
}

abstract class $RegisterBankAccountCopyWith<$Res> {
  factory $RegisterBankAccountCopyWith(
          RegisterBankAccount value, $Res Function(RegisterBankAccount) then) =
      _$RegisterBankAccountCopyWithImpl<$Res>;
  $Res call({Gym gym, String billingEmail});
}

class _$RegisterBankAccountCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res>
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
      billingEmail: billingEmail == freezed
          ? _value.billingEmail
          : billingEmail as String,
    ));
  }
}

class _$RegisterBankAccount
    with DiagnosticableTreeMixin
    implements RegisterBankAccount {
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
      ..add(DiagnosticsProperty(
          'type', 'PaymentMethodsEvent.registerBankAccount'))
      ..add(DiagnosticsProperty('gym', gym))
      ..add(DiagnosticsProperty('billingEmail', billingEmail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterBankAccount &&
            (identical(other.gym, gym) ||
                const DeepCollectionEquality().equals(other.gym, gym)) &&
            (identical(other.billingEmail, billingEmail) ||
                const DeepCollectionEquality()
                    .equals(other.billingEmail, billingEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gym) ^
      const DeepCollectionEquality().hash(billingEmail);

  @override
  $RegisterBankAccountCopyWith<RegisterBankAccount> get copyWith =>
      _$RegisterBankAccountCopyWithImpl<RegisterBankAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result paymentMethodUpdated(
            String userEmail, PaymentMethod paymentMethod),
    @required Result registerBankAccount(Gym gym, String billingEmail),
    @required
        Result changeBankAccount(
            Gym gym, String billingEmail, String customerId),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return registerBankAccount(gym, billingEmail);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    Result registerBankAccount(Gym gym, String billingEmail),
    Result changeBankAccount(Gym gym, String billingEmail, String customerId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerBankAccount != null) {
      return registerBankAccount(gym, billingEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethodUpdated value),
    @required Result registerBankAccount(RegisterBankAccount value),
    @required Result changeBankAccount(ChangeBankAccount value),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return registerBankAccount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethodUpdated value),
    Result registerBankAccount(RegisterBankAccount value),
    Result changeBankAccount(ChangeBankAccount value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerBankAccount != null) {
      return registerBankAccount(this);
    }
    return orElse();
  }
}

abstract class RegisterBankAccount implements PaymentMethodsEvent {
  const factory RegisterBankAccount(
      {@required Gym gym,
      @required String billingEmail}) = _$RegisterBankAccount;

  Gym get gym;
  String get billingEmail;
  $RegisterBankAccountCopyWith<RegisterBankAccount> get copyWith;
}

abstract class $ChangeBankAccountCopyWith<$Res> {
  factory $ChangeBankAccountCopyWith(
          ChangeBankAccount value, $Res Function(ChangeBankAccount) then) =
      _$ChangeBankAccountCopyWithImpl<$Res>;
  $Res call({Gym gym, String billingEmail, String customerId});
}

class _$ChangeBankAccountCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res>
    implements $ChangeBankAccountCopyWith<$Res> {
  _$ChangeBankAccountCopyWithImpl(
      ChangeBankAccount _value, $Res Function(ChangeBankAccount) _then)
      : super(_value, (v) => _then(v as ChangeBankAccount));

  @override
  ChangeBankAccount get _value => super._value as ChangeBankAccount;

  @override
  $Res call({
    Object gym = freezed,
    Object billingEmail = freezed,
    Object customerId = freezed,
  }) {
    return _then(ChangeBankAccount(
      gym: gym == freezed ? _value.gym : gym as Gym,
      billingEmail: billingEmail == freezed
          ? _value.billingEmail
          : billingEmail as String,
      customerId:
          customerId == freezed ? _value.customerId : customerId as String,
    ));
  }
}

class _$ChangeBankAccount
    with DiagnosticableTreeMixin
    implements ChangeBankAccount {
  const _$ChangeBankAccount(
      {@required this.gym,
      @required this.billingEmail,
      @required this.customerId})
      : assert(gym != null),
        assert(billingEmail != null),
        assert(customerId != null);

  @override
  final Gym gym;
  @override
  final String billingEmail;
  @override
  final String customerId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsEvent.changeBankAccount(gym: $gym, billingEmail: $billingEmail, customerId: $customerId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'PaymentMethodsEvent.changeBankAccount'))
      ..add(DiagnosticsProperty('gym', gym))
      ..add(DiagnosticsProperty('billingEmail', billingEmail))
      ..add(DiagnosticsProperty('customerId', customerId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeBankAccount &&
            (identical(other.gym, gym) ||
                const DeepCollectionEquality().equals(other.gym, gym)) &&
            (identical(other.billingEmail, billingEmail) ||
                const DeepCollectionEquality()
                    .equals(other.billingEmail, billingEmail)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gym) ^
      const DeepCollectionEquality().hash(billingEmail) ^
      const DeepCollectionEquality().hash(customerId);

  @override
  $ChangeBankAccountCopyWith<ChangeBankAccount> get copyWith =>
      _$ChangeBankAccountCopyWithImpl<ChangeBankAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result paymentMethodUpdated(
            String userEmail, PaymentMethod paymentMethod),
    @required Result registerBankAccount(Gym gym, String billingEmail),
    @required
        Result changeBankAccount(
            Gym gym, String billingEmail, String customerId),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return changeBankAccount(gym, billingEmail, customerId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result paymentMethodUpdated(String userEmail, PaymentMethod paymentMethod),
    Result registerBankAccount(Gym gym, String billingEmail),
    Result changeBankAccount(Gym gym, String billingEmail, String customerId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeBankAccount != null) {
      return changeBankAccount(gym, billingEmail, customerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethodUpdated value),
    @required Result registerBankAccount(RegisterBankAccount value),
    @required Result changeBankAccount(ChangeBankAccount value),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    assert(changeBankAccount != null);
    return changeBankAccount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethodUpdated value),
    Result registerBankAccount(RegisterBankAccount value),
    Result changeBankAccount(ChangeBankAccount value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeBankAccount != null) {
      return changeBankAccount(this);
    }
    return orElse();
  }
}

abstract class ChangeBankAccount implements PaymentMethodsEvent {
  const factory ChangeBankAccount(
      {@required Gym gym,
      @required String billingEmail,
      @required String customerId}) = _$ChangeBankAccount;

  Gym get gym;
  String get billingEmail;
  String get customerId;
  $ChangeBankAccountCopyWith<ChangeBankAccount> get copyWith;
}
