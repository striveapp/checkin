// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'subscription_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SubscriptionEventTearOff {
  const _$SubscriptionEventTearOff();

  Subscribe subscribe(
      {@required String gymId,
      @required String priceId,
      @required String customerId}) {
    return Subscribe(
      gymId: gymId,
      priceId: priceId,
      customerId: customerId,
    );
  }
}

// ignore: unused_element
const $SubscriptionEvent = _$SubscriptionEventTearOff();

mixin _$SubscriptionEvent {
  String get gymId;
  String get priceId;
  String get customerId;

  $SubscriptionEventCopyWith<SubscriptionEvent> get copyWith;
}

abstract class $SubscriptionEventCopyWith<$Res> {
  factory $SubscriptionEventCopyWith(
          SubscriptionEvent value, $Res Function(SubscriptionEvent) then) =
      _$SubscriptionEventCopyWithImpl<$Res>;
  $Res call({String gymId, String priceId, String customerId});
}

class _$SubscriptionEventCopyWithImpl<$Res>
    implements $SubscriptionEventCopyWith<$Res> {
  _$SubscriptionEventCopyWithImpl(this._value, this._then);

  final SubscriptionEvent _value;
  // ignore: unused_field
  final $Res Function(SubscriptionEvent) _then;

  @override
  $Res call({
    Object gymId = freezed,
    Object priceId = freezed,
    Object customerId = freezed,
  }) {
    return _then(_value.copyWith(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      priceId: priceId == freezed ? _value.priceId : priceId as String,
      customerId:
          customerId == freezed ? _value.customerId : customerId as String,
    ));
  }
}

abstract class $SubscribeCopyWith<$Res>
    implements $SubscriptionEventCopyWith<$Res> {
  factory $SubscribeCopyWith(Subscribe value, $Res Function(Subscribe) then) =
      _$SubscribeCopyWithImpl<$Res>;
  @override
  $Res call({String gymId, String priceId, String customerId});
}

class _$SubscribeCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res>
    implements $SubscribeCopyWith<$Res> {
  _$SubscribeCopyWithImpl(Subscribe _value, $Res Function(Subscribe) _then)
      : super(_value, (v) => _then(v as Subscribe));

  @override
  Subscribe get _value => super._value as Subscribe;

  @override
  $Res call({
    Object gymId = freezed,
    Object priceId = freezed,
    Object customerId = freezed,
  }) {
    return _then(Subscribe(
      gymId: gymId == freezed ? _value.gymId : gymId as String,
      priceId: priceId == freezed ? _value.priceId : priceId as String,
      customerId:
          customerId == freezed ? _value.customerId : customerId as String,
    ));
  }
}

class _$Subscribe with DiagnosticableTreeMixin implements Subscribe {
  const _$Subscribe(
      {@required this.gymId, @required this.priceId, @required this.customerId})
      : assert(gymId != null),
        assert(priceId != null),
        assert(customerId != null);

  @override
  final String gymId;
  @override
  final String priceId;
  @override
  final String customerId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionEvent.subscribe(gymId: $gymId, priceId: $priceId, customerId: $customerId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubscriptionEvent.subscribe'))
      ..add(DiagnosticsProperty('gymId', gymId))
      ..add(DiagnosticsProperty('priceId', priceId))
      ..add(DiagnosticsProperty('customerId', customerId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Subscribe &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.priceId, priceId) ||
                const DeepCollectionEquality()
                    .equals(other.priceId, priceId)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(priceId) ^
      const DeepCollectionEquality().hash(customerId);

  @override
  $SubscribeCopyWith<Subscribe> get copyWith =>
      _$SubscribeCopyWithImpl<Subscribe>(this, _$identity);
}

abstract class Subscribe implements SubscriptionEvent {
  const factory Subscribe(
      {@required String gymId,
      @required String priceId,
      @required String customerId}) = _$Subscribe;

  @override
  String get gymId;
  @override
  String get priceId;
  @override
  String get customerId;
  @override
  $SubscribeCopyWith<Subscribe> get copyWith;
}
