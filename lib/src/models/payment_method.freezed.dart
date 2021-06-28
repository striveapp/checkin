// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentMethodTearOff {
  const _$PaymentMethodTearOff();

  _PaymentMethod call(
      {required String customerId,
      required String billingEmail,
      required String lastFourDigits,
      required String country}) {
    return _PaymentMethod(
      customerId: customerId,
      billingEmail: billingEmail,
      lastFourDigits: lastFourDigits,
      country: country,
    );
  }
}

/// @nodoc
const $PaymentMethod = _$PaymentMethodTearOff();

/// @nodoc
mixin _$PaymentMethod {
  String get customerId => throw _privateConstructorUsedError;
  String get billingEmail => throw _privateConstructorUsedError;
  String get lastFourDigits => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
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

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  final PaymentMethod _value;
  // ignore: unused_field
  final $Res Function(PaymentMethod) _then;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? billingEmail = freezed,
    Object? lastFourDigits = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      billingEmail: billingEmail == freezed
          ? _value.billingEmail
          : billingEmail // ignore: cast_nullable_to_non_nullable
              as String,
      lastFourDigits: lastFourDigits == freezed
          ? _value.lastFourDigits
          : lastFourDigits // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
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

/// @nodoc
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
    Object? customerId = freezed,
    Object? billingEmail = freezed,
    Object? lastFourDigits = freezed,
    Object? country = freezed,
  }) {
    return _then(_PaymentMethod(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      billingEmail: billingEmail == freezed
          ? _value.billingEmail
          : billingEmail // ignore: cast_nullable_to_non_nullable
              as String,
      lastFourDigits: lastFourDigits == freezed
          ? _value.lastFourDigits
          : lastFourDigits // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PaymentMethod with DiagnosticableTreeMixin implements _PaymentMethod {
  _$_PaymentMethod(
      {required this.customerId,
      required this.billingEmail,
      required this.lastFourDigits,
      required this.country});

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

  @JsonKey(ignore: true)
  @override
  _$PaymentMethodCopyWith<_PaymentMethod> get copyWith =>
      __$PaymentMethodCopyWithImpl<_PaymentMethod>(this, _$identity);
}

abstract class _PaymentMethod implements PaymentMethod {
  factory _PaymentMethod(
      {required String customerId,
      required String billingEmail,
      required String lastFourDigits,
      required String country}) = _$_PaymentMethod;

  @override
  String get customerId => throw _privateConstructorUsedError;
  @override
  String get billingEmail => throw _privateConstructorUsedError;
  @override
  String get lastFourDigits => throw _privateConstructorUsedError;
  @override
  String get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaymentMethodCopyWith<_PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}
