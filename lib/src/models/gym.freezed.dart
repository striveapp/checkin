// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'gym.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GymTearOff {
  const _$GymTearOff();

// ignore: unused_element
  _Gym call(
      {@required String id,
      @required String paymentAppDomain,
      @required String host,
      @required String stripePublicKey,
      @required bool hasActivePayments}) {
    return _Gym(
      id: id,
      paymentAppDomain: paymentAppDomain,
      host: host,
      stripePublicKey: stripePublicKey,
      hasActivePayments: hasActivePayments,
    );
  }
}

// ignore: unused_element
const $Gym = _$GymTearOff();

mixin _$Gym {
  String get id;
  String get paymentAppDomain;
  String get host;
  String get stripePublicKey;
  bool get hasActivePayments;

  $GymCopyWith<Gym> get copyWith;
}

abstract class $GymCopyWith<$Res> {
  factory $GymCopyWith(Gym value, $Res Function(Gym) then) =
      _$GymCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String paymentAppDomain,
      String host,
      String stripePublicKey,
      bool hasActivePayments});
}

class _$GymCopyWithImpl<$Res> implements $GymCopyWith<$Res> {
  _$GymCopyWithImpl(this._value, this._then);

  final Gym _value;
  // ignore: unused_field
  final $Res Function(Gym) _then;

  @override
  $Res call({
    Object id = freezed,
    Object paymentAppDomain = freezed,
    Object host = freezed,
    Object stripePublicKey = freezed,
    Object hasActivePayments = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      paymentAppDomain: paymentAppDomain == freezed
          ? _value.paymentAppDomain
          : paymentAppDomain as String,
      host: host == freezed ? _value.host : host as String,
      stripePublicKey: stripePublicKey == freezed
          ? _value.stripePublicKey
          : stripePublicKey as String,
      hasActivePayments: hasActivePayments == freezed
          ? _value.hasActivePayments
          : hasActivePayments as bool,
    ));
  }
}

abstract class _$GymCopyWith<$Res> implements $GymCopyWith<$Res> {
  factory _$GymCopyWith(_Gym value, $Res Function(_Gym) then) =
      __$GymCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String paymentAppDomain,
      String host,
      String stripePublicKey,
      bool hasActivePayments});
}

class __$GymCopyWithImpl<$Res> extends _$GymCopyWithImpl<$Res>
    implements _$GymCopyWith<$Res> {
  __$GymCopyWithImpl(_Gym _value, $Res Function(_Gym) _then)
      : super(_value, (v) => _then(v as _Gym));

  @override
  _Gym get _value => super._value as _Gym;

  @override
  $Res call({
    Object id = freezed,
    Object paymentAppDomain = freezed,
    Object host = freezed,
    Object stripePublicKey = freezed,
    Object hasActivePayments = freezed,
  }) {
    return _then(_Gym(
      id: id == freezed ? _value.id : id as String,
      paymentAppDomain: paymentAppDomain == freezed
          ? _value.paymentAppDomain
          : paymentAppDomain as String,
      host: host == freezed ? _value.host : host as String,
      stripePublicKey: stripePublicKey == freezed
          ? _value.stripePublicKey
          : stripePublicKey as String,
      hasActivePayments: hasActivePayments == freezed
          ? _value.hasActivePayments
          : hasActivePayments as bool,
    ));
  }
}

class _$_Gym with DiagnosticableTreeMixin implements _Gym {
  _$_Gym(
      {@required this.id,
      @required this.paymentAppDomain,
      @required this.host,
      @required this.stripePublicKey,
      @required this.hasActivePayments})
      : assert(id != null),
        assert(paymentAppDomain != null),
        assert(host != null),
        assert(stripePublicKey != null),
        assert(hasActivePayments != null);

  @override
  final String id;
  @override
  final String paymentAppDomain;
  @override
  final String host;
  @override
  final String stripePublicKey;
  @override
  final bool hasActivePayments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Gym(id: $id, paymentAppDomain: $paymentAppDomain, host: $host, stripePublicKey: $stripePublicKey, hasActivePayments: $hasActivePayments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Gym'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('paymentAppDomain', paymentAppDomain))
      ..add(DiagnosticsProperty('host', host))
      ..add(DiagnosticsProperty('stripePublicKey', stripePublicKey))
      ..add(DiagnosticsProperty('hasActivePayments', hasActivePayments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gym &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.paymentAppDomain, paymentAppDomain) ||
                const DeepCollectionEquality()
                    .equals(other.paymentAppDomain, paymentAppDomain)) &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.stripePublicKey, stripePublicKey) ||
                const DeepCollectionEquality()
                    .equals(other.stripePublicKey, stripePublicKey)) &&
            (identical(other.hasActivePayments, hasActivePayments) ||
                const DeepCollectionEquality()
                    .equals(other.hasActivePayments, hasActivePayments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(paymentAppDomain) ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(stripePublicKey) ^
      const DeepCollectionEquality().hash(hasActivePayments);

  @override
  _$GymCopyWith<_Gym> get copyWith =>
      __$GymCopyWithImpl<_Gym>(this, _$identity);
}

abstract class _Gym implements Gym {
  factory _Gym(
      {@required String id,
      @required String paymentAppDomain,
      @required String host,
      @required String stripePublicKey,
      @required bool hasActivePayments}) = _$_Gym;

  @override
  String get id;
  @override
  String get paymentAppDomain;
  @override
  String get host;
  @override
  String get stripePublicKey;
  @override
  bool get hasActivePayments;
  @override
  _$GymCopyWith<_Gym> get copyWith;
}
