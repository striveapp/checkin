// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'subscription_plans_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SubscriptionPlansEventTearOff {
  const _$SubscriptionPlansEventTearOff();

  SubscriptionPlansUpdated subscriptionPlansUpdated(
      {@required List<SubscriptionPlan> subscriptionPlans,
      @required String basePaymentUrl,
      @required Gym gym}) {
    return SubscriptionPlansUpdated(
      subscriptionPlans: subscriptionPlans,
      basePaymentUrl: basePaymentUrl,
      gym: gym,
    );
  }
}

// ignore: unused_element
const $SubscriptionPlansEvent = _$SubscriptionPlansEventTearOff();

mixin _$SubscriptionPlansEvent {
  List<SubscriptionPlan> get subscriptionPlans;
  String get basePaymentUrl;
  Gym get gym;

  $SubscriptionPlansEventCopyWith<SubscriptionPlansEvent> get copyWith;
}

abstract class $SubscriptionPlansEventCopyWith<$Res> {
  factory $SubscriptionPlansEventCopyWith(SubscriptionPlansEvent value,
          $Res Function(SubscriptionPlansEvent) then) =
      _$SubscriptionPlansEventCopyWithImpl<$Res>;
  $Res call(
      {List<SubscriptionPlan> subscriptionPlans,
      String basePaymentUrl,
      Gym gym});
}

class _$SubscriptionPlansEventCopyWithImpl<$Res>
    implements $SubscriptionPlansEventCopyWith<$Res> {
  _$SubscriptionPlansEventCopyWithImpl(this._value, this._then);

  final SubscriptionPlansEvent _value;
  // ignore: unused_field
  final $Res Function(SubscriptionPlansEvent) _then;

  @override
  $Res call({
    Object subscriptionPlans = freezed,
    Object basePaymentUrl = freezed,
    Object gym = freezed,
  }) {
    return _then(_value.copyWith(
      subscriptionPlans: subscriptionPlans == freezed
          ? _value.subscriptionPlans
          : subscriptionPlans as List<SubscriptionPlan>,
      basePaymentUrl: basePaymentUrl == freezed
          ? _value.basePaymentUrl
          : basePaymentUrl as String,
      gym: gym == freezed ? _value.gym : gym as Gym,
    ));
  }
}

abstract class $SubscriptionPlansUpdatedCopyWith<$Res>
    implements $SubscriptionPlansEventCopyWith<$Res> {
  factory $SubscriptionPlansUpdatedCopyWith(SubscriptionPlansUpdated value,
          $Res Function(SubscriptionPlansUpdated) then) =
      _$SubscriptionPlansUpdatedCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SubscriptionPlan> subscriptionPlans,
      String basePaymentUrl,
      Gym gym});
}

class _$SubscriptionPlansUpdatedCopyWithImpl<$Res>
    extends _$SubscriptionPlansEventCopyWithImpl<$Res>
    implements $SubscriptionPlansUpdatedCopyWith<$Res> {
  _$SubscriptionPlansUpdatedCopyWithImpl(SubscriptionPlansUpdated _value,
      $Res Function(SubscriptionPlansUpdated) _then)
      : super(_value, (v) => _then(v as SubscriptionPlansUpdated));

  @override
  SubscriptionPlansUpdated get _value =>
      super._value as SubscriptionPlansUpdated;

  @override
  $Res call({
    Object subscriptionPlans = freezed,
    Object basePaymentUrl = freezed,
    Object gym = freezed,
  }) {
    return _then(SubscriptionPlansUpdated(
      subscriptionPlans: subscriptionPlans == freezed
          ? _value.subscriptionPlans
          : subscriptionPlans as List<SubscriptionPlan>,
      basePaymentUrl: basePaymentUrl == freezed
          ? _value.basePaymentUrl
          : basePaymentUrl as String,
      gym: gym == freezed ? _value.gym : gym as Gym,
    ));
  }
}

class _$SubscriptionPlansUpdated
    with DiagnosticableTreeMixin
    implements SubscriptionPlansUpdated {
  const _$SubscriptionPlansUpdated(
      {@required this.subscriptionPlans,
      @required this.basePaymentUrl,
      @required this.gym})
      : assert(subscriptionPlans != null),
        assert(basePaymentUrl != null),
        assert(gym != null);

  @override
  final List<SubscriptionPlan> subscriptionPlans;
  @override
  final String basePaymentUrl;
  @override
  final Gym gym;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionPlansEvent.subscriptionPlansUpdated(subscriptionPlans: $subscriptionPlans, basePaymentUrl: $basePaymentUrl, gym: $gym)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SubscriptionPlansEvent.subscriptionPlansUpdated'))
      ..add(DiagnosticsProperty('subscriptionPlans', subscriptionPlans))
      ..add(DiagnosticsProperty('basePaymentUrl', basePaymentUrl))
      ..add(DiagnosticsProperty('gym', gym));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionPlansUpdated &&
            (identical(other.subscriptionPlans, subscriptionPlans) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptionPlans, subscriptionPlans)) &&
            (identical(other.basePaymentUrl, basePaymentUrl) ||
                const DeepCollectionEquality()
                    .equals(other.basePaymentUrl, basePaymentUrl)) &&
            (identical(other.gym, gym) ||
                const DeepCollectionEquality().equals(other.gym, gym)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subscriptionPlans) ^
      const DeepCollectionEquality().hash(basePaymentUrl) ^
      const DeepCollectionEquality().hash(gym);

  @override
  $SubscriptionPlansUpdatedCopyWith<SubscriptionPlansUpdated> get copyWith =>
      _$SubscriptionPlansUpdatedCopyWithImpl<SubscriptionPlansUpdated>(
          this, _$identity);
}

abstract class SubscriptionPlansUpdated implements SubscriptionPlansEvent {
  const factory SubscriptionPlansUpdated(
      {@required List<SubscriptionPlan> subscriptionPlans,
      @required String basePaymentUrl,
      @required Gym gym}) = _$SubscriptionPlansUpdated;

  @override
  List<SubscriptionPlan> get subscriptionPlans;
  @override
  String get basePaymentUrl;
  @override
  Gym get gym;
  @override
  $SubscriptionPlansUpdatedCopyWith<SubscriptionPlansUpdated> get copyWith;
}
