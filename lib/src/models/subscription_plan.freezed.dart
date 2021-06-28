// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'subscription_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SubscriptionPlanTearOff {
  const _$SubscriptionPlanTearOff();

  SimpleSubscription simpleSubscription(
      {required String name,
      required String code,
      required String interval,
      required String currency,
      required int price,
      String? description}) {
    return SimpleSubscription(
      name: name,
      code: code,
      interval: interval,
      currency: currency,
      price: price,
      description: description,
    );
  }

  SubscriptionWithPrices subscriptionWithPrices(
      {required String id,
      required String name,
      required String currency,
      required int startingPrice,
      String? description}) {
    return SubscriptionWithPrices(
      id: id,
      name: name,
      currency: currency,
      startingPrice: startingPrice,
      description: description,
    );
  }
}

/// @nodoc
const $SubscriptionPlan = _$SubscriptionPlanTearOff();

/// @nodoc
mixin _$SubscriptionPlan {
  String get name => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String code, String interval,
            String currency, int price, String? description)
        simpleSubscription,
    required TResult Function(String id, String name, String currency,
            int startingPrice, String? description)
        subscriptionWithPrices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String code, String interval, String currency,
            int price, String? description)?
        simpleSubscription,
    TResult Function(String id, String name, String currency, int startingPrice,
            String? description)?
        subscriptionWithPrices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleSubscription value) simpleSubscription,
    required TResult Function(SubscriptionWithPrices value)
        subscriptionWithPrices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleSubscription value)? simpleSubscription,
    TResult Function(SubscriptionWithPrices value)? subscriptionWithPrices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionPlanCopyWith<SubscriptionPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPlanCopyWith<$Res> {
  factory $SubscriptionPlanCopyWith(
          SubscriptionPlan value, $Res Function(SubscriptionPlan) then) =
      _$SubscriptionPlanCopyWithImpl<$Res>;
  $Res call({String name, String currency, String? description});
}

/// @nodoc
class _$SubscriptionPlanCopyWithImpl<$Res>
    implements $SubscriptionPlanCopyWith<$Res> {
  _$SubscriptionPlanCopyWithImpl(this._value, this._then);

  final SubscriptionPlan _value;
  // ignore: unused_field
  final $Res Function(SubscriptionPlan) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? currency = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class $SimpleSubscriptionCopyWith<$Res>
    implements $SubscriptionPlanCopyWith<$Res> {
  factory $SimpleSubscriptionCopyWith(
          SimpleSubscription value, $Res Function(SimpleSubscription) then) =
      _$SimpleSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String code,
      String interval,
      String currency,
      int price,
      String? description});
}

/// @nodoc
class _$SimpleSubscriptionCopyWithImpl<$Res>
    extends _$SubscriptionPlanCopyWithImpl<$Res>
    implements $SimpleSubscriptionCopyWith<$Res> {
  _$SimpleSubscriptionCopyWithImpl(
      SimpleSubscription _value, $Res Function(SimpleSubscription) _then)
      : super(_value, (v) => _then(v as SimpleSubscription));

  @override
  SimpleSubscription get _value => super._value as SimpleSubscription;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? interval = freezed,
    Object? currency = freezed,
    Object? price = freezed,
    Object? description = freezed,
  }) {
    return _then(SimpleSubscription(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SimpleSubscription
    with DiagnosticableTreeMixin
    implements SimpleSubscription {
  const _$SimpleSubscription(
      {required this.name,
      required this.code,
      required this.interval,
      required this.currency,
      required this.price,
      this.description});

  @override
  final String name;
  @override
  final String code;
  @override
  final String interval;
  @override
  final String currency;
  @override
  final int price;
  @override
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionPlan.simpleSubscription(name: $name, code: $code, interval: $interval, currency: $currency, price: $price, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubscriptionPlan.simpleSubscription'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('interval', interval))
      ..add(DiagnosticsProperty('currency', currency))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SimpleSubscription &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  $SimpleSubscriptionCopyWith<SimpleSubscription> get copyWith =>
      _$SimpleSubscriptionCopyWithImpl<SimpleSubscription>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String code, String interval,
            String currency, int price, String? description)
        simpleSubscription,
    required TResult Function(String id, String name, String currency,
            int startingPrice, String? description)
        subscriptionWithPrices,
  }) {
    return simpleSubscription(
        name, code, interval, currency, price, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String code, String interval, String currency,
            int price, String? description)?
        simpleSubscription,
    TResult Function(String id, String name, String currency, int startingPrice,
            String? description)?
        subscriptionWithPrices,
    required TResult orElse(),
  }) {
    if (simpleSubscription != null) {
      return simpleSubscription(
          name, code, interval, currency, price, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleSubscription value) simpleSubscription,
    required TResult Function(SubscriptionWithPrices value)
        subscriptionWithPrices,
  }) {
    return simpleSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleSubscription value)? simpleSubscription,
    TResult Function(SubscriptionWithPrices value)? subscriptionWithPrices,
    required TResult orElse(),
  }) {
    if (simpleSubscription != null) {
      return simpleSubscription(this);
    }
    return orElse();
  }
}

abstract class SimpleSubscription implements SubscriptionPlan {
  const factory SimpleSubscription(
      {required String name,
      required String code,
      required String interval,
      required String currency,
      required int price,
      String? description}) = _$SimpleSubscription;

  @override
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get interval => throw _privateConstructorUsedError;
  @override
  String get currency => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SimpleSubscriptionCopyWith<SimpleSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionWithPricesCopyWith<$Res>
    implements $SubscriptionPlanCopyWith<$Res> {
  factory $SubscriptionWithPricesCopyWith(SubscriptionWithPrices value,
          $Res Function(SubscriptionWithPrices) then) =
      _$SubscriptionWithPricesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String currency,
      int startingPrice,
      String? description});
}

/// @nodoc
class _$SubscriptionWithPricesCopyWithImpl<$Res>
    extends _$SubscriptionPlanCopyWithImpl<$Res>
    implements $SubscriptionWithPricesCopyWith<$Res> {
  _$SubscriptionWithPricesCopyWithImpl(SubscriptionWithPrices _value,
      $Res Function(SubscriptionWithPrices) _then)
      : super(_value, (v) => _then(v as SubscriptionWithPrices));

  @override
  SubscriptionWithPrices get _value => super._value as SubscriptionWithPrices;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currency = freezed,
    Object? startingPrice = freezed,
    Object? description = freezed,
  }) {
    return _then(SubscriptionWithPrices(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      startingPrice: startingPrice == freezed
          ? _value.startingPrice
          : startingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubscriptionWithPrices
    with DiagnosticableTreeMixin
    implements SubscriptionWithPrices {
  const _$SubscriptionWithPrices(
      {required this.id,
      required this.name,
      required this.currency,
      required this.startingPrice,
      this.description});

  @override
  final String id;
  @override
  final String name;
  @override
  final String currency;
  @override
  final int startingPrice;
  @override
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionPlan.subscriptionWithPrices(id: $id, name: $name, currency: $currency, startingPrice: $startingPrice, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SubscriptionPlan.subscriptionWithPrices'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('currency', currency))
      ..add(DiagnosticsProperty('startingPrice', startingPrice))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionWithPrices &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.startingPrice, startingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.startingPrice, startingPrice)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(startingPrice) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  $SubscriptionWithPricesCopyWith<SubscriptionWithPrices> get copyWith =>
      _$SubscriptionWithPricesCopyWithImpl<SubscriptionWithPrices>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String code, String interval,
            String currency, int price, String? description)
        simpleSubscription,
    required TResult Function(String id, String name, String currency,
            int startingPrice, String? description)
        subscriptionWithPrices,
  }) {
    return subscriptionWithPrices(
        id, name, currency, startingPrice, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String code, String interval, String currency,
            int price, String? description)?
        simpleSubscription,
    TResult Function(String id, String name, String currency, int startingPrice,
            String? description)?
        subscriptionWithPrices,
    required TResult orElse(),
  }) {
    if (subscriptionWithPrices != null) {
      return subscriptionWithPrices(
          id, name, currency, startingPrice, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SimpleSubscription value) simpleSubscription,
    required TResult Function(SubscriptionWithPrices value)
        subscriptionWithPrices,
  }) {
    return subscriptionWithPrices(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SimpleSubscription value)? simpleSubscription,
    TResult Function(SubscriptionWithPrices value)? subscriptionWithPrices,
    required TResult orElse(),
  }) {
    if (subscriptionWithPrices != null) {
      return subscriptionWithPrices(this);
    }
    return orElse();
  }
}

abstract class SubscriptionWithPrices implements SubscriptionPlan {
  const factory SubscriptionWithPrices(
      {required String id,
      required String name,
      required String currency,
      required int startingPrice,
      String? description}) = _$SubscriptionWithPrices;

  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get currency => throw _privateConstructorUsedError;
  int get startingPrice => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SubscriptionWithPricesCopyWith<SubscriptionWithPrices> get copyWith =>
      throw _privateConstructorUsedError;
}
