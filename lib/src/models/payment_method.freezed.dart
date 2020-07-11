// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PaymentMethodTearOff {
  const _$PaymentMethodTearOff();

  _PaymentMethod call(
      {@required String customerId,
      @required String billingEmail,
      @required String lastFourDigits,
      @required String country}) {
    return _PaymentMethod(
      customerId: customerId,
      billingEmail: billingEmail,
      lastFourDigits: lastFourDigits,
      country: country,
    );
  }
}

// ignore: unused_element
const $PaymentMethod = _$PaymentMethodTearOff();

mixin _$PaymentMethod {
  String get customerId;
  String get billingEmail;
  String get lastFourDigits;
  String get country;

  $PaymentMethodCopyWith<PaymentMethod> get copyWith;
}

abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res>;
  $Res call(
      {String customerId,
      String billingEmail,
      String lastFourDigits,
      String country});
}

class _$PaymentMethodCopyWithImpl<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  final PaymentMethod _value;
  // ignore: unused_field
  final $Res Function(PaymentMethod) _then;

  @override
  $Res call({
    Object customerId = freezed,
    Object billingEmail = freezed,
    Object lastFourDigits = freezed,
    Object country = freezed,
  }) {
    return _then(_value.copyWith(
      customerId:
          customerId == freezed ? _value.customerId : customerId as String,
      billingEmail: billingEmail == freezed
          ? _value.billingEmail
          : billingEmail as String,
      lastFourDigits: lastFourDigits == freezed
          ? _value.lastFourDigits
          : lastFourDigits as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

abstract class _$PaymentMethodCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$PaymentMethodCopyWith(
          _PaymentMethod value, $Res Function(_PaymentMethod) then) =
      __$PaymentMethodCopyWithImpl<$Res>;
  @override
  $Res call(
      {String customerId,
      String billingEmail,
      String lastFourDigits,
      String country});
}

class __$PaymentMethodCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res>
    implements _$PaymentMethodCopyWith<$Res> {
  __$PaymentMethodCopyWithImpl(
      _PaymentMethod _value, $Res Function(_PaymentMethod) _then)
      : super(_value, (v) => _then(v as _PaymentMethod));

  @override
  _PaymentMethod get _value => super._value as _PaymentMethod;

  @override
  $Res call({
    Object customerId = freezed,
    Object billingEmail = freezed,
    Object lastFourDigits = freezed,
    Object country = freezed,
  }) {
    return _then(_PaymentMethod(
      customerId:
          customerId == freezed ? _value.customerId : customerId as String,
      billingEmail: billingEmail == freezed
          ? _value.billingEmail
          : billingEmail as String,
      lastFourDigits: lastFourDigits == freezed
          ? _value.lastFourDigits
          : lastFourDigits as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

class _$_PaymentMethod with DiagnosticableTreeMixin implements _PaymentMethod {
  _$_PaymentMethod(
      {@required this.customerId,
      @required this.billingEmail,
      @required this.lastFourDigits,
      @required this.country})
      : assert(customerId != null),
        assert(billingEmail != null),
        assert(lastFourDigits != null),
        assert(country != null);

  @override
  final String customerId;
  @override
  final String billingEmail;
  @override
  final String lastFourDigits;
  @override
  final String country;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethod(customerId: $customerId, billingEmail: $billingEmail, lastFourDigits: $lastFourDigits, country: $country)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentMethod'))
      ..add(DiagnosticsProperty('customerId', customerId))
      ..add(DiagnosticsProperty('billingEmail', billingEmail))
      ..add(DiagnosticsProperty('lastFourDigits', lastFourDigits))
      ..add(DiagnosticsProperty('country', country));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaymentMethod &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.billingEmail, billingEmail) ||
                const DeepCollectionEquality()
                    .equals(other.billingEmail, billingEmail)) &&
            (identical(other.lastFourDigits, lastFourDigits) ||
                const DeepCollectionEquality()
                    .equals(other.lastFourDigits, lastFourDigits)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(billingEmail) ^
      const DeepCollectionEquality().hash(lastFourDigits) ^
      const DeepCollectionEquality().hash(country);

  @override
  _$PaymentMethodCopyWith<_PaymentMethod> get copyWith =>
      __$PaymentMethodCopyWithImpl<_PaymentMethod>(this, _$identity);
}

abstract class _PaymentMethod implements PaymentMethod {
  factory _PaymentMethod(
      {@required String customerId,
      @required String billingEmail,
      @required String lastFourDigits,
      @required String country}) = _$_PaymentMethod;

  @override
  String get customerId;
  @override
  String get billingEmail;
  @override
  String get lastFourDigits;
  @override
  String get country;
  @override
  _$PaymentMethodCopyWith<_PaymentMethod> get copyWith;
}
