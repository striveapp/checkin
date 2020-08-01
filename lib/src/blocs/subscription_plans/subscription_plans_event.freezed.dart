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

  LoadSubscriptionPlans loadSubscriptionPlans({@required String planId}) {
    return LoadSubscriptionPlans(
      planId: planId,
    );
  }
}

// ignore: unused_element
const $SubscriptionPlansEvent = _$SubscriptionPlansEventTearOff();

mixin _$SubscriptionPlansEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result subscriptionPlansUpdated(
            List<SubscriptionPlan> subscriptionPlans,
            String basePaymentUrl,
            Gym gym),
    @required Result loadSubscriptionPlans(String planId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionPlansUpdated(List<SubscriptionPlan> subscriptionPlans,
        String basePaymentUrl, Gym gym),
    Result loadSubscriptionPlans(String planId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionPlansUpdated(SubscriptionPlansUpdated value),
    @required Result loadSubscriptionPlans(LoadSubscriptionPlans value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionPlansUpdated(SubscriptionPlansUpdated value),
    Result loadSubscriptionPlans(LoadSubscriptionPlans value),
    @required Result orElse(),
  });
}

abstract class $SubscriptionPlansEventCopyWith<$Res> {
  factory $SubscriptionPlansEventCopyWith(SubscriptionPlansEvent value,
          $Res Function(SubscriptionPlansEvent) then) =
      _$SubscriptionPlansEventCopyWithImpl<$Res>;
}

class _$SubscriptionPlansEventCopyWithImpl<$Res>
    implements $SubscriptionPlansEventCopyWith<$Res> {
  _$SubscriptionPlansEventCopyWithImpl(this._value, this._then);

  final SubscriptionPlansEvent _value;
  // ignore: unused_field
  final $Res Function(SubscriptionPlansEvent) _then;
}

abstract class $SubscriptionPlansUpdatedCopyWith<$Res> {
  factory $SubscriptionPlansUpdatedCopyWith(SubscriptionPlansUpdated value,
          $Res Function(SubscriptionPlansUpdated) then) =
      _$SubscriptionPlansUpdatedCopyWithImpl<$Res>;
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

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result subscriptionPlansUpdated(
            List<SubscriptionPlan> subscriptionPlans,
            String basePaymentUrl,
            Gym gym),
    @required Result loadSubscriptionPlans(String planId),
  }) {
    assert(subscriptionPlansUpdated != null);
    assert(loadSubscriptionPlans != null);
    return subscriptionPlansUpdated(subscriptionPlans, basePaymentUrl, gym);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionPlansUpdated(List<SubscriptionPlan> subscriptionPlans,
        String basePaymentUrl, Gym gym),
    Result loadSubscriptionPlans(String planId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionPlansUpdated != null) {
      return subscriptionPlansUpdated(subscriptionPlans, basePaymentUrl, gym);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionPlansUpdated(SubscriptionPlansUpdated value),
    @required Result loadSubscriptionPlans(LoadSubscriptionPlans value),
  }) {
    assert(subscriptionPlansUpdated != null);
    assert(loadSubscriptionPlans != null);
    return subscriptionPlansUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionPlansUpdated(SubscriptionPlansUpdated value),
    Result loadSubscriptionPlans(LoadSubscriptionPlans value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionPlansUpdated != null) {
      return subscriptionPlansUpdated(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansUpdated implements SubscriptionPlansEvent {
  const factory SubscriptionPlansUpdated(
      {@required List<SubscriptionPlan> subscriptionPlans,
      @required String basePaymentUrl,
      @required Gym gym}) = _$SubscriptionPlansUpdated;

  List<SubscriptionPlan> get subscriptionPlans;
  String get basePaymentUrl;
  Gym get gym;
  $SubscriptionPlansUpdatedCopyWith<SubscriptionPlansUpdated> get copyWith;
}

abstract class $LoadSubscriptionPlansCopyWith<$Res> {
  factory $LoadSubscriptionPlansCopyWith(LoadSubscriptionPlans value,
          $Res Function(LoadSubscriptionPlans) then) =
      _$LoadSubscriptionPlansCopyWithImpl<$Res>;
  $Res call({String planId});
}

class _$LoadSubscriptionPlansCopyWithImpl<$Res>
    extends _$SubscriptionPlansEventCopyWithImpl<$Res>
    implements $LoadSubscriptionPlansCopyWith<$Res> {
  _$LoadSubscriptionPlansCopyWithImpl(
      LoadSubscriptionPlans _value, $Res Function(LoadSubscriptionPlans) _then)
      : super(_value, (v) => _then(v as LoadSubscriptionPlans));

  @override
  LoadSubscriptionPlans get _value => super._value as LoadSubscriptionPlans;

  @override
  $Res call({
    Object planId = freezed,
  }) {
    return _then(LoadSubscriptionPlans(
      planId: planId == freezed ? _value.planId : planId as String,
    ));
  }
}

class _$LoadSubscriptionPlans
    with DiagnosticableTreeMixin
    implements LoadSubscriptionPlans {
  const _$LoadSubscriptionPlans({@required this.planId})
      : assert(planId != null);

  @override
  final String planId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionPlansEvent.loadSubscriptionPlans(planId: $planId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SubscriptionPlansEvent.loadSubscriptionPlans'))
      ..add(DiagnosticsProperty('planId', planId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSubscriptionPlans &&
            (identical(other.planId, planId) ||
                const DeepCollectionEquality().equals(other.planId, planId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(planId);

  @override
  $LoadSubscriptionPlansCopyWith<LoadSubscriptionPlans> get copyWith =>
      _$LoadSubscriptionPlansCopyWithImpl<LoadSubscriptionPlans>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result subscriptionPlansUpdated(
            List<SubscriptionPlan> subscriptionPlans,
            String basePaymentUrl,
            Gym gym),
    @required Result loadSubscriptionPlans(String planId),
  }) {
    assert(subscriptionPlansUpdated != null);
    assert(loadSubscriptionPlans != null);
    return loadSubscriptionPlans(planId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionPlansUpdated(List<SubscriptionPlan> subscriptionPlans,
        String basePaymentUrl, Gym gym),
    Result loadSubscriptionPlans(String planId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSubscriptionPlans != null) {
      return loadSubscriptionPlans(planId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionPlansUpdated(SubscriptionPlansUpdated value),
    @required Result loadSubscriptionPlans(LoadSubscriptionPlans value),
  }) {
    assert(subscriptionPlansUpdated != null);
    assert(loadSubscriptionPlans != null);
    return loadSubscriptionPlans(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionPlansUpdated(SubscriptionPlansUpdated value),
    Result loadSubscriptionPlans(LoadSubscriptionPlans value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSubscriptionPlans != null) {
      return loadSubscriptionPlans(this);
    }
    return orElse();
  }
}

abstract class LoadSubscriptionPlans implements SubscriptionPlansEvent {
  const factory LoadSubscriptionPlans({@required String planId}) =
      _$LoadSubscriptionPlans;

  String get planId;
  $LoadSubscriptionPlansCopyWith<LoadSubscriptionPlans> get copyWith;
}
