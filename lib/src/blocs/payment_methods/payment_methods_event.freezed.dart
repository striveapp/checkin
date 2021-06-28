// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_methods_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentMethodsEventTearOff {
  const _$PaymentMethodsEventTearOff();

  PaymentMethodUpdated paymentMethodUpdated(
      {required String userEmail, PaymentMethod? paymentMethod}) {
    return PaymentMethodUpdated(
      userEmail: userEmail,
      paymentMethod: paymentMethod,
    );
  }

  RegisterBankAccount registerBankAccount(
      {required Gym gym, required String billingEmail}) {
    return RegisterBankAccount(
      gym: gym,
      billingEmail: billingEmail,
    );
  }

  ChangeBankAccount changeBankAccount(
      {required Gym gym, required String billingEmail}) {
    return ChangeBankAccount(
      gym: gym,
      billingEmail: billingEmail,
    );
  }
}

/// @nodoc
const $PaymentMethodsEvent = _$PaymentMethodsEventTearOff();

/// @nodoc
mixin _$PaymentMethodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userEmail, PaymentMethod? paymentMethod)
        paymentMethodUpdated,
    required TResult Function(Gym gym, String billingEmail) registerBankAccount,
    required TResult Function(Gym gym, String billingEmail) changeBankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userEmail, PaymentMethod? paymentMethod)?
        paymentMethodUpdated,
    TResult Function(Gym gym, String billingEmail)? registerBankAccount,
    TResult Function(Gym gym, String billingEmail)? changeBankAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(RegisterBankAccount value) registerBankAccount,
    required TResult Function(ChangeBankAccount value) changeBankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(RegisterBankAccount value)? registerBankAccount,
    TResult Function(ChangeBankAccount value)? changeBankAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsEventCopyWith<$Res> {
  factory $PaymentMethodsEventCopyWith(
          PaymentMethodsEvent value, $Res Function(PaymentMethodsEvent) then) =
      _$PaymentMethodsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentMethodsEventCopyWithImpl<$Res>
    implements $PaymentMethodsEventCopyWith<$Res> {
  _$PaymentMethodsEventCopyWithImpl(this._value, this._then);

  final PaymentMethodsEvent _value;
  // ignore: unused_field
  final $Res Function(PaymentMethodsEvent) _then;
}

/// @nodoc
abstract class $PaymentMethodUpdatedCopyWith<$Res> {
  factory $PaymentMethodUpdatedCopyWith(PaymentMethodUpdated value,
          $Res Function(PaymentMethodUpdated) then) =
      _$PaymentMethodUpdatedCopyWithImpl<$Res>;
  $Res call({String userEmail, PaymentMethod? paymentMethod});

  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
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
    Object? userEmail = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(PaymentMethodUpdated(
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
    ));
  }

  @override
  $PaymentMethodCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value));
    });
  }
}

/// @nodoc

class _$PaymentMethodUpdated
    with DiagnosticableTreeMixin
    implements PaymentMethodUpdated {
  const _$PaymentMethodUpdated({required this.userEmail, this.paymentMethod});

  @override
  final String userEmail;
  @override
  final PaymentMethod? paymentMethod;

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

  @JsonKey(ignore: true)
  @override
  $PaymentMethodUpdatedCopyWith<PaymentMethodUpdated> get copyWith =>
      _$PaymentMethodUpdatedCopyWithImpl<PaymentMethodUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userEmail, PaymentMethod? paymentMethod)
        paymentMethodUpdated,
    required TResult Function(Gym gym, String billingEmail) registerBankAccount,
    required TResult Function(Gym gym, String billingEmail) changeBankAccount,
  }) {
    return paymentMethodUpdated(userEmail, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userEmail, PaymentMethod? paymentMethod)?
        paymentMethodUpdated,
    TResult Function(Gym gym, String billingEmail)? registerBankAccount,
    TResult Function(Gym gym, String billingEmail)? changeBankAccount,
    required TResult orElse(),
  }) {
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(userEmail, paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(RegisterBankAccount value) registerBankAccount,
    required TResult Function(ChangeBankAccount value) changeBankAccount,
  }) {
    return paymentMethodUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(RegisterBankAccount value)? registerBankAccount,
    TResult Function(ChangeBankAccount value)? changeBankAccount,
    required TResult orElse(),
  }) {
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodUpdated implements PaymentMethodsEvent {
  const factory PaymentMethodUpdated(
      {required String userEmail,
      PaymentMethod? paymentMethod}) = _$PaymentMethodUpdated;

  String get userEmail => throw _privateConstructorUsedError;
  PaymentMethod? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodUpdatedCopyWith<PaymentMethodUpdated> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? gym = freezed,
    Object? billingEmail = freezed,
  }) {
    return _then(RegisterBankAccount(
      gym: gym == freezed
          ? _value.gym
          : gym // ignore: cast_nullable_to_non_nullable
              as Gym,
      billingEmail: billingEmail == freezed
          ? _value.billingEmail
          : billingEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $GymCopyWith<$Res> get gym {
    return $GymCopyWith<$Res>(_value.gym, (value) {
      return _then(_value.copyWith(gym: value));
    });
  }
}

/// @nodoc

class _$RegisterBankAccount
    with DiagnosticableTreeMixin
    implements RegisterBankAccount {
  const _$RegisterBankAccount({required this.gym, required this.billingEmail});

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

  @JsonKey(ignore: true)
  @override
  $RegisterBankAccountCopyWith<RegisterBankAccount> get copyWith =>
      _$RegisterBankAccountCopyWithImpl<RegisterBankAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userEmail, PaymentMethod? paymentMethod)
        paymentMethodUpdated,
    required TResult Function(Gym gym, String billingEmail) registerBankAccount,
    required TResult Function(Gym gym, String billingEmail) changeBankAccount,
  }) {
    return registerBankAccount(gym, billingEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userEmail, PaymentMethod? paymentMethod)?
        paymentMethodUpdated,
    TResult Function(Gym gym, String billingEmail)? registerBankAccount,
    TResult Function(Gym gym, String billingEmail)? changeBankAccount,
    required TResult orElse(),
  }) {
    if (registerBankAccount != null) {
      return registerBankAccount(gym, billingEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(RegisterBankAccount value) registerBankAccount,
    required TResult Function(ChangeBankAccount value) changeBankAccount,
  }) {
    return registerBankAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(RegisterBankAccount value)? registerBankAccount,
    TResult Function(ChangeBankAccount value)? changeBankAccount,
    required TResult orElse(),
  }) {
    if (registerBankAccount != null) {
      return registerBankAccount(this);
    }
    return orElse();
  }
}

abstract class RegisterBankAccount implements PaymentMethodsEvent {
  const factory RegisterBankAccount(
      {required Gym gym, required String billingEmail}) = _$RegisterBankAccount;

  Gym get gym => throw _privateConstructorUsedError;
  String get billingEmail => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterBankAccountCopyWith<RegisterBankAccount> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? gym = freezed,
    Object? billingEmail = freezed,
  }) {
    return _then(ChangeBankAccount(
      gym: gym == freezed
          ? _value.gym
          : gym // ignore: cast_nullable_to_non_nullable
              as Gym,
      billingEmail: billingEmail == freezed
          ? _value.billingEmail
          : billingEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $GymCopyWith<$Res> get gym {
    return $GymCopyWith<$Res>(_value.gym, (value) {
      return _then(_value.copyWith(gym: value));
    });
  }
}

/// @nodoc

class _$ChangeBankAccount
    with DiagnosticableTreeMixin
    implements ChangeBankAccount {
  const _$ChangeBankAccount({required this.gym, required this.billingEmail});

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
      ..add(
          DiagnosticsProperty('type', 'PaymentMethodsEvent.changeBankAccount'))
      ..add(DiagnosticsProperty('gym', gym))
      ..add(DiagnosticsProperty('billingEmail', billingEmail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeBankAccount &&
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

  @JsonKey(ignore: true)
  @override
  $ChangeBankAccountCopyWith<ChangeBankAccount> get copyWith =>
      _$ChangeBankAccountCopyWithImpl<ChangeBankAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userEmail, PaymentMethod? paymentMethod)
        paymentMethodUpdated,
    required TResult Function(Gym gym, String billingEmail) registerBankAccount,
    required TResult Function(Gym gym, String billingEmail) changeBankAccount,
  }) {
    return changeBankAccount(gym, billingEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userEmail, PaymentMethod? paymentMethod)?
        paymentMethodUpdated,
    TResult Function(Gym gym, String billingEmail)? registerBankAccount,
    TResult Function(Gym gym, String billingEmail)? changeBankAccount,
    required TResult orElse(),
  }) {
    if (changeBankAccount != null) {
      return changeBankAccount(gym, billingEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(RegisterBankAccount value) registerBankAccount,
    required TResult Function(ChangeBankAccount value) changeBankAccount,
  }) {
    return changeBankAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(RegisterBankAccount value)? registerBankAccount,
    TResult Function(ChangeBankAccount value)? changeBankAccount,
    required TResult orElse(),
  }) {
    if (changeBankAccount != null) {
      return changeBankAccount(this);
    }
    return orElse();
  }
}

abstract class ChangeBankAccount implements PaymentMethodsEvent {
  const factory ChangeBankAccount(
      {required Gym gym, required String billingEmail}) = _$ChangeBankAccount;

  Gym get gym => throw _privateConstructorUsedError;
  String get billingEmail => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeBankAccountCopyWith<ChangeBankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
