// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'subscription_plans_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SubscriptionPlansEventTearOff {
  const _$SubscriptionPlansEventTearOff();

  SubscriptionPlansUpdated subscriptionPlansUpdated(
      {required List<SubscriptionPlan> subscriptionPlans}) {
    return SubscriptionPlansUpdated(
      subscriptionPlans: subscriptionPlans,
    );
  }

  LoadSubscriptionPlans loadSubscriptionPlans({required String planId}) {
    return LoadSubscriptionPlans(
      planId: planId,
    );
  }
}

/// @nodoc
const $SubscriptionPlansEvent = _$SubscriptionPlansEventTearOff();

/// @nodoc
mixin _$SubscriptionPlansEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SubscriptionPlan> subscriptionPlans)
        subscriptionPlansUpdated,
    required TResult Function(String planId) loadSubscriptionPlans,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SubscriptionPlan> subscriptionPlans)?
        subscriptionPlansUpdated,
    TResult Function(String planId)? loadSubscriptionPlans,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubscriptionPlansUpdated value)
        subscriptionPlansUpdated,
    required TResult Function(LoadSubscriptionPlans value)
        loadSubscriptionPlans,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubscriptionPlansUpdated value)? subscriptionPlansUpdated,
    TResult Function(LoadSubscriptionPlans value)? loadSubscriptionPlans,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPlansEventCopyWith<$Res> {
  factory $SubscriptionPlansEventCopyWith(SubscriptionPlansEvent value,
          $Res Function(SubscriptionPlansEvent) then) =
      _$SubscriptionPlansEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SubscriptionPlansEventCopyWithImpl<$Res>
    implements $SubscriptionPlansEventCopyWith<$Res> {
  _$SubscriptionPlansEventCopyWithImpl(this._value, this._then);

  final SubscriptionPlansEvent _value;
  // ignore: unused_field
  final $Res Function(SubscriptionPlansEvent) _then;
}

/// @nodoc
abstract class $SubscriptionPlansUpdatedCopyWith<$Res> {
  factory $SubscriptionPlansUpdatedCopyWith(SubscriptionPlansUpdated value,
          $Res Function(SubscriptionPlansUpdated) then) =
      _$SubscriptionPlansUpdatedCopyWithImpl<$Res>;
  $Res call({List<SubscriptionPlan> subscriptionPlans});
}

/// @nodoc
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
    Object? subscriptionPlans = freezed,
  }) {
    return _then(SubscriptionPlansUpdated(
      subscriptionPlans: subscriptionPlans == freezed
          ? _value.subscriptionPlans
          : subscriptionPlans // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPlan>,
    ));
  }
}

/// @nodoc

class _$SubscriptionPlansUpdated
    with DiagnosticableTreeMixin
    implements SubscriptionPlansUpdated {
  const _$SubscriptionPlansUpdated({required this.subscriptionPlans});

  @override
  final List<SubscriptionPlan> subscriptionPlans;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionPlansEvent.subscriptionPlansUpdated(subscriptionPlans: $subscriptionPlans)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SubscriptionPlansEvent.subscriptionPlansUpdated'))
      ..add(DiagnosticsProperty('subscriptionPlans', subscriptionPlans));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionPlansUpdated &&
            (identical(other.subscriptionPlans, subscriptionPlans) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptionPlans, subscriptionPlans)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subscriptionPlans);

  @JsonKey(ignore: true)
  @override
  $SubscriptionPlansUpdatedCopyWith<SubscriptionPlansUpdated> get copyWith =>
      _$SubscriptionPlansUpdatedCopyWithImpl<SubscriptionPlansUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SubscriptionPlan> subscriptionPlans)
        subscriptionPlansUpdated,
    required TResult Function(String planId) loadSubscriptionPlans,
  }) {
    return subscriptionPlansUpdated(subscriptionPlans);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SubscriptionPlan> subscriptionPlans)?
        subscriptionPlansUpdated,
    TResult Function(String planId)? loadSubscriptionPlans,
    required TResult orElse(),
  }) {
    if (subscriptionPlansUpdated != null) {
      return subscriptionPlansUpdated(subscriptionPlans);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubscriptionPlansUpdated value)
        subscriptionPlansUpdated,
    required TResult Function(LoadSubscriptionPlans value)
        loadSubscriptionPlans,
  }) {
    return subscriptionPlansUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubscriptionPlansUpdated value)? subscriptionPlansUpdated,
    TResult Function(LoadSubscriptionPlans value)? loadSubscriptionPlans,
    required TResult orElse(),
  }) {
    if (subscriptionPlansUpdated != null) {
      return subscriptionPlansUpdated(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansUpdated implements SubscriptionPlansEvent {
  const factory SubscriptionPlansUpdated(
          {required List<SubscriptionPlan> subscriptionPlans}) =
      _$SubscriptionPlansUpdated;

  List<SubscriptionPlan> get subscriptionPlans =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionPlansUpdatedCopyWith<SubscriptionPlansUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadSubscriptionPlansCopyWith<$Res> {
  factory $LoadSubscriptionPlansCopyWith(LoadSubscriptionPlans value,
          $Res Function(LoadSubscriptionPlans) then) =
      _$LoadSubscriptionPlansCopyWithImpl<$Res>;
  $Res call({String planId});
}

/// @nodoc
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
    Object? planId = freezed,
  }) {
    return _then(LoadSubscriptionPlans(
      planId: planId == freezed
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadSubscriptionPlans
    with DiagnosticableTreeMixin
    implements LoadSubscriptionPlans {
  const _$LoadSubscriptionPlans({required this.planId});

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

  @JsonKey(ignore: true)
  @override
  $LoadSubscriptionPlansCopyWith<LoadSubscriptionPlans> get copyWith =>
      _$LoadSubscriptionPlansCopyWithImpl<LoadSubscriptionPlans>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SubscriptionPlan> subscriptionPlans)
        subscriptionPlansUpdated,
    required TResult Function(String planId) loadSubscriptionPlans,
  }) {
    return loadSubscriptionPlans(planId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SubscriptionPlan> subscriptionPlans)?
        subscriptionPlansUpdated,
    TResult Function(String planId)? loadSubscriptionPlans,
    required TResult orElse(),
  }) {
    if (loadSubscriptionPlans != null) {
      return loadSubscriptionPlans(planId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubscriptionPlansUpdated value)
        subscriptionPlansUpdated,
    required TResult Function(LoadSubscriptionPlans value)
        loadSubscriptionPlans,
  }) {
    return loadSubscriptionPlans(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubscriptionPlansUpdated value)? subscriptionPlansUpdated,
    TResult Function(LoadSubscriptionPlans value)? loadSubscriptionPlans,
    required TResult orElse(),
  }) {
    if (loadSubscriptionPlans != null) {
      return loadSubscriptionPlans(this);
    }
    return orElse();
  }
}

abstract class LoadSubscriptionPlans implements SubscriptionPlansEvent {
  const factory LoadSubscriptionPlans({required String planId}) =
      _$LoadSubscriptionPlans;

  String get planId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadSubscriptionPlansCopyWith<LoadSubscriptionPlans> get copyWith =>
      throw _privateConstructorUsedError;
}
