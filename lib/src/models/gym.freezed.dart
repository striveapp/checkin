// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'gym.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gym _$GymFromJson(Map<String, dynamic> json) {
  return _Gym.fromJson(json);
}

/// @nodoc
class _$GymTearOff {
  const _$GymTearOff();

  _Gym call(
      {required String id,
      required String name,
      required String paymentAppDomain,
      required String stripePublicKey,
      required String imageUrl,
      bool hasActivePayments = false}) {
    return _Gym(
      id: id,
      name: name,
      paymentAppDomain: paymentAppDomain,
      stripePublicKey: stripePublicKey,
      imageUrl: imageUrl,
      hasActivePayments: hasActivePayments,
    );
  }

  Gym fromJson(Map<String, Object> json) {
    return Gym.fromJson(json);
  }
}

/// @nodoc
const $Gym = _$GymTearOff();

/// @nodoc
mixin _$Gym {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get paymentAppDomain => throw _privateConstructorUsedError;
  String get stripePublicKey => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get hasActivePayments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GymCopyWith<Gym> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymCopyWith<$Res> {
  factory $GymCopyWith(Gym value, $Res Function(Gym) then) =
      _$GymCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String paymentAppDomain,
      String stripePublicKey,
      String imageUrl,
      bool hasActivePayments});
}

/// @nodoc
class _$GymCopyWithImpl<$Res> implements $GymCopyWith<$Res> {
  _$GymCopyWithImpl(this._value, this._then);

  final Gym _value;
  // ignore: unused_field
  final $Res Function(Gym) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? paymentAppDomain = freezed,
    Object? stripePublicKey = freezed,
    Object? imageUrl = freezed,
    Object? hasActivePayments = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAppDomain: paymentAppDomain == freezed
          ? _value.paymentAppDomain
          : paymentAppDomain // ignore: cast_nullable_to_non_nullable
              as String,
      stripePublicKey: stripePublicKey == freezed
          ? _value.stripePublicKey
          : stripePublicKey // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hasActivePayments: hasActivePayments == freezed
          ? _value.hasActivePayments
          : hasActivePayments // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GymCopyWith<$Res> implements $GymCopyWith<$Res> {
  factory _$GymCopyWith(_Gym value, $Res Function(_Gym) then) =
      __$GymCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String paymentAppDomain,
      String stripePublicKey,
      String imageUrl,
      bool hasActivePayments});
}

/// @nodoc
class __$GymCopyWithImpl<$Res> extends _$GymCopyWithImpl<$Res>
    implements _$GymCopyWith<$Res> {
  __$GymCopyWithImpl(_Gym _value, $Res Function(_Gym) _then)
      : super(_value, (v) => _then(v as _Gym));

  @override
  _Gym get _value => super._value as _Gym;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? paymentAppDomain = freezed,
    Object? stripePublicKey = freezed,
    Object? imageUrl = freezed,
    Object? hasActivePayments = freezed,
  }) {
    return _then(_Gym(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAppDomain: paymentAppDomain == freezed
          ? _value.paymentAppDomain
          : paymentAppDomain // ignore: cast_nullable_to_non_nullable
              as String,
      stripePublicKey: stripePublicKey == freezed
          ? _value.stripePublicKey
          : stripePublicKey // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hasActivePayments: hasActivePayments == freezed
          ? _value.hasActivePayments
          : hasActivePayments // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gym with DiagnosticableTreeMixin implements _Gym {
  _$_Gym(
      {required this.id,
      required this.name,
      required this.paymentAppDomain,
      required this.stripePublicKey,
      required this.imageUrl,
      this.hasActivePayments = false});

  factory _$_Gym.fromJson(Map<String, dynamic> json) => _$_$_GymFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String paymentAppDomain;
  @override
  final String stripePublicKey;
  @override
  final String imageUrl;
  @JsonKey(defaultValue: false)
  @override
  final bool hasActivePayments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Gym(id: $id, name: $name, paymentAppDomain: $paymentAppDomain, stripePublicKey: $stripePublicKey, imageUrl: $imageUrl, hasActivePayments: $hasActivePayments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Gym'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('paymentAppDomain', paymentAppDomain))
      ..add(DiagnosticsProperty('stripePublicKey', stripePublicKey))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('hasActivePayments', hasActivePayments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gym &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.paymentAppDomain, paymentAppDomain) ||
                const DeepCollectionEquality()
                    .equals(other.paymentAppDomain, paymentAppDomain)) &&
            (identical(other.stripePublicKey, stripePublicKey) ||
                const DeepCollectionEquality()
                    .equals(other.stripePublicKey, stripePublicKey)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.hasActivePayments, hasActivePayments) ||
                const DeepCollectionEquality()
                    .equals(other.hasActivePayments, hasActivePayments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(paymentAppDomain) ^
      const DeepCollectionEquality().hash(stripePublicKey) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(hasActivePayments);

  @JsonKey(ignore: true)
  @override
  _$GymCopyWith<_Gym> get copyWith =>
      __$GymCopyWithImpl<_Gym>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GymToJson(this);
  }
}

abstract class _Gym implements Gym {
  factory _Gym(
      {required String id,
      required String name,
      required String paymentAppDomain,
      required String stripePublicKey,
      required String imageUrl,
      bool hasActivePayments}) = _$_Gym;

  factory _Gym.fromJson(Map<String, dynamic> json) = _$_Gym.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get paymentAppDomain => throw _privateConstructorUsedError;
  @override
  String get stripePublicKey => throw _privateConstructorUsedError;
  @override
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  bool get hasActivePayments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GymCopyWith<_Gym> get copyWith => throw _privateConstructorUsedError;
}
