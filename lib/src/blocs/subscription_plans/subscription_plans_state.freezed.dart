// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'subscription_plans_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SubscriptionPlansStateTearOff {
  const _$SubscriptionPlansStateTearOff();

  SubscriptionPlansInitial subscriptionPlansInitial() {
    return const SubscriptionPlansInitial();
  }

  SubscriptionPlansLoaded subscriptionPlansLoaded(
      {@required List<SubscriptionPlan> subscriptionPlans,
      @required String basePaymentUrl,
      @required String gymId}) {
    return SubscriptionPlansLoaded(
      subscriptionPlans: subscriptionPlans,
      basePaymentUrl: basePaymentUrl,
      gymId: gymId,
    );
  }

  SubscriptionPlansEmpty subscriptionPlansEmpty() {
    return const SubscriptionPlansEmpty();
  }
}

// ignore: unused_element
const $SubscriptionPlansState = _$SubscriptionPlansStateTearOff();

mixin _$SubscriptionPlansState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionPlansInitial(),
    @required
        Result subscriptionPlansLoaded(List<SubscriptionPlan> subscriptionPlans,
            String basePaymentUrl, String gymId),
    @required Result subscriptionPlansEmpty(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionPlansInitial(),
    Result subscriptionPlansLoaded(List<SubscriptionPlan> subscriptionPlans,
        String basePaymentUrl, String gymId),
    Result subscriptionPlansEmpty(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionPlansInitial(SubscriptionPlansInitial value),
    @required Result subscriptionPlansLoaded(SubscriptionPlansLoaded value),
    @required Result subscriptionPlansEmpty(SubscriptionPlansEmpty value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionPlansInitial(SubscriptionPlansInitial value),
    Result subscriptionPlansLoaded(SubscriptionPlansLoaded value),
    Result subscriptionPlansEmpty(SubscriptionPlansEmpty value),
    @required Result orElse(),
  });
}

abstract class $SubscriptionPlansStateCopyWith<$Res> {
  factory $SubscriptionPlansStateCopyWith(SubscriptionPlansState value,
          $Res Function(SubscriptionPlansState) then) =
      _$SubscriptionPlansStateCopyWithImpl<$Res>;
}

class _$SubscriptionPlansStateCopyWithImpl<$Res>
    implements $SubscriptionPlansStateCopyWith<$Res> {
  _$SubscriptionPlansStateCopyWithImpl(this._value, this._then);

  final SubscriptionPlansState _value;
  // ignore: unused_field
  final $Res Function(SubscriptionPlansState) _then;
}

abstract class $SubscriptionPlansInitialCopyWith<$Res> {
  factory $SubscriptionPlansInitialCopyWith(SubscriptionPlansInitial value,
          $Res Function(SubscriptionPlansInitial) then) =
      _$SubscriptionPlansInitialCopyWithImpl<$Res>;
}

class _$SubscriptionPlansInitialCopyWithImpl<$Res>
    extends _$SubscriptionPlansStateCopyWithImpl<$Res>
    implements $SubscriptionPlansInitialCopyWith<$Res> {
  _$SubscriptionPlansInitialCopyWithImpl(SubscriptionPlansInitial _value,
      $Res Function(SubscriptionPlansInitial) _then)
      : super(_value, (v) => _then(v as SubscriptionPlansInitial));

  @override
  SubscriptionPlansInitial get _value =>
      super._value as SubscriptionPlansInitial;
}

class _$SubscriptionPlansInitial
    with DiagnosticableTreeMixin
    implements SubscriptionPlansInitial {
  const _$SubscriptionPlansInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionPlansState.subscriptionPlansInitial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SubscriptionPlansState.subscriptionPlansInitial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SubscriptionPlansInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionPlansInitial(),
    @required
        Result subscriptionPlansLoaded(List<SubscriptionPlan> subscriptionPlans,
            String basePaymentUrl, String gymId),
    @required Result subscriptionPlansEmpty(),
  }) {
    assert(subscriptionPlansInitial != null);
    assert(subscriptionPlansLoaded != null);
    assert(subscriptionPlansEmpty != null);
    return subscriptionPlansInitial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionPlansInitial(),
    Result subscriptionPlansLoaded(List<SubscriptionPlan> subscriptionPlans,
        String basePaymentUrl, String gymId),
    Result subscriptionPlansEmpty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionPlansInitial != null) {
      return subscriptionPlansInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionPlansInitial(SubscriptionPlansInitial value),
    @required Result subscriptionPlansLoaded(SubscriptionPlansLoaded value),
    @required Result subscriptionPlansEmpty(SubscriptionPlansEmpty value),
  }) {
    assert(subscriptionPlansInitial != null);
    assert(subscriptionPlansLoaded != null);
    assert(subscriptionPlansEmpty != null);
    return subscriptionPlansInitial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionPlansInitial(SubscriptionPlansInitial value),
    Result subscriptionPlansLoaded(SubscriptionPlansLoaded value),
    Result subscriptionPlansEmpty(SubscriptionPlansEmpty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionPlansInitial != null) {
      return subscriptionPlansInitial(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansInitial implements SubscriptionPlansState {
  const factory SubscriptionPlansInitial() = _$SubscriptionPlansInitial;
}

abstract class $SubscriptionPlansLoadedCopyWith<$Res> {
  factory $SubscriptionPlansLoadedCopyWith(SubscriptionPlansLoaded value,
          $Res Function(SubscriptionPlansLoaded) then) =
      _$SubscriptionPlansLoadedCopyWithImpl<$Res>;
  $Res call(
      {List<SubscriptionPlan> subscriptionPlans,
      String basePaymentUrl,
      String gymId});
}

class _$SubscriptionPlansLoadedCopyWithImpl<$Res>
    extends _$SubscriptionPlansStateCopyWithImpl<$Res>
    implements $SubscriptionPlansLoadedCopyWith<$Res> {
  _$SubscriptionPlansLoadedCopyWithImpl(SubscriptionPlansLoaded _value,
      $Res Function(SubscriptionPlansLoaded) _then)
      : super(_value, (v) => _then(v as SubscriptionPlansLoaded));

  @override
  SubscriptionPlansLoaded get _value => super._value as SubscriptionPlansLoaded;

  @override
  $Res call({
    Object subscriptionPlans = freezed,
    Object basePaymentUrl = freezed,
    Object gymId = freezed,
  }) {
    return _then(SubscriptionPlansLoaded(
      subscriptionPlans: subscriptionPlans == freezed
          ? _value.subscriptionPlans
          : subscriptionPlans as List<SubscriptionPlan>,
      basePaymentUrl: basePaymentUrl == freezed
          ? _value.basePaymentUrl
          : basePaymentUrl as String,
      gymId: gymId == freezed ? _value.gymId : gymId as String,
    ));
  }
}

class _$SubscriptionPlansLoaded
    with DiagnosticableTreeMixin
    implements SubscriptionPlansLoaded {
  const _$SubscriptionPlansLoaded(
      {@required this.subscriptionPlans,
      @required this.basePaymentUrl,
      @required this.gymId})
      : assert(subscriptionPlans != null),
        assert(basePaymentUrl != null),
        assert(gymId != null);

  @override
  final List<SubscriptionPlan> subscriptionPlans;
  @override
  final String basePaymentUrl;
  @override
  final String gymId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionPlansState.subscriptionPlansLoaded(subscriptionPlans: $subscriptionPlans, basePaymentUrl: $basePaymentUrl, gymId: $gymId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SubscriptionPlansState.subscriptionPlansLoaded'))
      ..add(DiagnosticsProperty('subscriptionPlans', subscriptionPlans))
      ..add(DiagnosticsProperty('basePaymentUrl', basePaymentUrl))
      ..add(DiagnosticsProperty('gymId', gymId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionPlansLoaded &&
            (identical(other.subscriptionPlans, subscriptionPlans) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptionPlans, subscriptionPlans)) &&
            (identical(other.basePaymentUrl, basePaymentUrl) ||
                const DeepCollectionEquality()
                    .equals(other.basePaymentUrl, basePaymentUrl)) &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subscriptionPlans) ^
      const DeepCollectionEquality().hash(basePaymentUrl) ^
      const DeepCollectionEquality().hash(gymId);

  @override
  $SubscriptionPlansLoadedCopyWith<SubscriptionPlansLoaded> get copyWith =>
      _$SubscriptionPlansLoadedCopyWithImpl<SubscriptionPlansLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionPlansInitial(),
    @required
        Result subscriptionPlansLoaded(List<SubscriptionPlan> subscriptionPlans,
            String basePaymentUrl, String gymId),
    @required Result subscriptionPlansEmpty(),
  }) {
    assert(subscriptionPlansInitial != null);
    assert(subscriptionPlansLoaded != null);
    assert(subscriptionPlansEmpty != null);
    return subscriptionPlansLoaded(subscriptionPlans, basePaymentUrl, gymId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionPlansInitial(),
    Result subscriptionPlansLoaded(List<SubscriptionPlan> subscriptionPlans,
        String basePaymentUrl, String gymId),
    Result subscriptionPlansEmpty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionPlansLoaded != null) {
      return subscriptionPlansLoaded(subscriptionPlans, basePaymentUrl, gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionPlansInitial(SubscriptionPlansInitial value),
    @required Result subscriptionPlansLoaded(SubscriptionPlansLoaded value),
    @required Result subscriptionPlansEmpty(SubscriptionPlansEmpty value),
  }) {
    assert(subscriptionPlansInitial != null);
    assert(subscriptionPlansLoaded != null);
    assert(subscriptionPlansEmpty != null);
    return subscriptionPlansLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionPlansInitial(SubscriptionPlansInitial value),
    Result subscriptionPlansLoaded(SubscriptionPlansLoaded value),
    Result subscriptionPlansEmpty(SubscriptionPlansEmpty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionPlansLoaded != null) {
      return subscriptionPlansLoaded(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansLoaded implements SubscriptionPlansState {
  const factory SubscriptionPlansLoaded(
      {@required List<SubscriptionPlan> subscriptionPlans,
      @required String basePaymentUrl,
      @required String gymId}) = _$SubscriptionPlansLoaded;

  List<SubscriptionPlan> get subscriptionPlans;
  String get basePaymentUrl;
  String get gymId;
  $SubscriptionPlansLoadedCopyWith<SubscriptionPlansLoaded> get copyWith;
}

abstract class $SubscriptionPlansEmptyCopyWith<$Res> {
  factory $SubscriptionPlansEmptyCopyWith(SubscriptionPlansEmpty value,
          $Res Function(SubscriptionPlansEmpty) then) =
      _$SubscriptionPlansEmptyCopyWithImpl<$Res>;
}

class _$SubscriptionPlansEmptyCopyWithImpl<$Res>
    extends _$SubscriptionPlansStateCopyWithImpl<$Res>
    implements $SubscriptionPlansEmptyCopyWith<$Res> {
  _$SubscriptionPlansEmptyCopyWithImpl(SubscriptionPlansEmpty _value,
      $Res Function(SubscriptionPlansEmpty) _then)
      : super(_value, (v) => _then(v as SubscriptionPlansEmpty));

  @override
  SubscriptionPlansEmpty get _value => super._value as SubscriptionPlansEmpty;
}

class _$SubscriptionPlansEmpty
    with DiagnosticableTreeMixin
    implements SubscriptionPlansEmpty {
  const _$SubscriptionPlansEmpty();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionPlansState.subscriptionPlansEmpty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SubscriptionPlansState.subscriptionPlansEmpty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SubscriptionPlansEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionPlansInitial(),
    @required
        Result subscriptionPlansLoaded(List<SubscriptionPlan> subscriptionPlans,
            String basePaymentUrl, String gymId),
    @required Result subscriptionPlansEmpty(),
  }) {
    assert(subscriptionPlansInitial != null);
    assert(subscriptionPlansLoaded != null);
    assert(subscriptionPlansEmpty != null);
    return subscriptionPlansEmpty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionPlansInitial(),
    Result subscriptionPlansLoaded(List<SubscriptionPlan> subscriptionPlans,
        String basePaymentUrl, String gymId),
    Result subscriptionPlansEmpty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionPlansEmpty != null) {
      return subscriptionPlansEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionPlansInitial(SubscriptionPlansInitial value),
    @required Result subscriptionPlansLoaded(SubscriptionPlansLoaded value),
    @required Result subscriptionPlansEmpty(SubscriptionPlansEmpty value),
  }) {
    assert(subscriptionPlansInitial != null);
    assert(subscriptionPlansLoaded != null);
    assert(subscriptionPlansEmpty != null);
    return subscriptionPlansEmpty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionPlansInitial(SubscriptionPlansInitial value),
    Result subscriptionPlansLoaded(SubscriptionPlansLoaded value),
    Result subscriptionPlansEmpty(SubscriptionPlansEmpty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionPlansEmpty != null) {
      return subscriptionPlansEmpty(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansEmpty implements SubscriptionPlansState {
  const factory SubscriptionPlansEmpty() = _$SubscriptionPlansEmpty;
}