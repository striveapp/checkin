// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'payment_methods_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PaymentMethodsEventTearOff {
  const _$PaymentMethodsEventTearOff();

  PaymentMethodUpdated paymentMethodUpdated({PaymentMethod paymentMethod}) {
    return PaymentMethodUpdated(
      paymentMethod: paymentMethod,
    );
  }

  RegisterBankAccount registerBankAccount() {
    return const RegisterBankAccount();
  }
}

// ignore: unused_element
const $PaymentMethodsEvent = _$PaymentMethodsEventTearOff();

mixin _$PaymentMethodsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethod paymentMethod),
    @required Result registerBankAccount(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethod paymentMethod),
    Result registerBankAccount(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethodUpdated value),
    @required Result registerBankAccount(RegisterBankAccount value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethodUpdated value),
    Result registerBankAccount(RegisterBankAccount value),
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
  $Res call({PaymentMethod paymentMethod});

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
    Object paymentMethod = freezed,
  }) {
    return _then(PaymentMethodUpdated(
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
  const _$PaymentMethodUpdated({this.paymentMethod});

  @override
  final PaymentMethod paymentMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsEvent.paymentMethodUpdated(paymentMethod: $paymentMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PaymentMethodsEvent.paymentMethodUpdated'))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethodUpdated &&
            (identical(other.paymentMethod, paymentMethod) ||
                const DeepCollectionEquality()
                    .equals(other.paymentMethod, paymentMethod)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(paymentMethod);

  @override
  $PaymentMethodUpdatedCopyWith<PaymentMethodUpdated> get copyWith =>
      _$PaymentMethodUpdatedCopyWithImpl<PaymentMethodUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethod paymentMethod),
    @required Result registerBankAccount(),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    return paymentMethodUpdated(paymentMethod);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethod paymentMethod),
    Result registerBankAccount(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethodUpdated value),
    @required Result registerBankAccount(RegisterBankAccount value),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    return paymentMethodUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethodUpdated value),
    Result registerBankAccount(RegisterBankAccount value),
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
  const factory PaymentMethodUpdated({PaymentMethod paymentMethod}) =
      _$PaymentMethodUpdated;

  PaymentMethod get paymentMethod;
  $PaymentMethodUpdatedCopyWith<PaymentMethodUpdated> get copyWith;
}

abstract class $RegisterBankAccountCopyWith<$Res> {
  factory $RegisterBankAccountCopyWith(
          RegisterBankAccount value, $Res Function(RegisterBankAccount) then) =
      _$RegisterBankAccountCopyWithImpl<$Res>;
}

class _$RegisterBankAccountCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res>
    implements $RegisterBankAccountCopyWith<$Res> {
  _$RegisterBankAccountCopyWithImpl(
      RegisterBankAccount _value, $Res Function(RegisterBankAccount) _then)
      : super(_value, (v) => _then(v as RegisterBankAccount));

  @override
  RegisterBankAccount get _value => super._value as RegisterBankAccount;
}

class _$RegisterBankAccount
    with DiagnosticableTreeMixin
    implements RegisterBankAccount {
  const _$RegisterBankAccount();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsEvent.registerBankAccount()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PaymentMethodsEvent.registerBankAccount'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegisterBankAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethod paymentMethod),
    @required Result registerBankAccount(),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    return registerBankAccount();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethod paymentMethod),
    Result registerBankAccount(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerBankAccount != null) {
      return registerBankAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result paymentMethodUpdated(PaymentMethodUpdated value),
    @required Result registerBankAccount(RegisterBankAccount value),
  }) {
    assert(paymentMethodUpdated != null);
    assert(registerBankAccount != null);
    return registerBankAccount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result paymentMethodUpdated(PaymentMethodUpdated value),
    Result registerBankAccount(RegisterBankAccount value),
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
  const factory RegisterBankAccount() = _$RegisterBankAccount;
}
