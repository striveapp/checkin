// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'payment_methods_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PaymentMethodsStateTearOff {
  const _$PaymentMethodsStateTearOff();

  InitialPaymentMethodsState initialPaymentMethodsState() {
    return const InitialPaymentMethodsState();
  }

  PaymentMethodLoaded paymentMethodLoaded({PaymentMethod paymentMethod}) {
    return PaymentMethodLoaded(
      paymentMethod: paymentMethod,
    );
  }

  PaymentMethodEmpty paymentMethodEmpty() {
    return const PaymentMethodEmpty();
  }
}

// ignore: unused_element
const $PaymentMethodsState = _$PaymentMethodsStateTearOff();

mixin _$PaymentMethodsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialPaymentMethodsState(),
    @required Result paymentMethodLoaded(PaymentMethod paymentMethod),
    @required Result paymentMethodEmpty(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    @required Result paymentMethodLoaded(PaymentMethodLoaded value),
    @required Result paymentMethodEmpty(PaymentMethodEmpty value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    @required Result orElse(),
  });
}

abstract class $PaymentMethodsStateCopyWith<$Res> {
  factory $PaymentMethodsStateCopyWith(
          PaymentMethodsState value, $Res Function(PaymentMethodsState) then) =
      _$PaymentMethodsStateCopyWithImpl<$Res>;
}

class _$PaymentMethodsStateCopyWithImpl<$Res>
    implements $PaymentMethodsStateCopyWith<$Res> {
  _$PaymentMethodsStateCopyWithImpl(this._value, this._then);

  final PaymentMethodsState _value;
  // ignore: unused_field
  final $Res Function(PaymentMethodsState) _then;
}

abstract class $InitialPaymentMethodsStateCopyWith<$Res> {
  factory $InitialPaymentMethodsStateCopyWith(InitialPaymentMethodsState value,
          $Res Function(InitialPaymentMethodsState) then) =
      _$InitialPaymentMethodsStateCopyWithImpl<$Res>;
}

class _$InitialPaymentMethodsStateCopyWithImpl<$Res>
    extends _$PaymentMethodsStateCopyWithImpl<$Res>
    implements $InitialPaymentMethodsStateCopyWith<$Res> {
  _$InitialPaymentMethodsStateCopyWithImpl(InitialPaymentMethodsState _value,
      $Res Function(InitialPaymentMethodsState) _then)
      : super(_value, (v) => _then(v as InitialPaymentMethodsState));

  @override
  InitialPaymentMethodsState get _value =>
      super._value as InitialPaymentMethodsState;
}

class _$InitialPaymentMethodsState
    with DiagnosticableTreeMixin
    implements InitialPaymentMethodsState {
  const _$InitialPaymentMethodsState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsState.initialPaymentMethodsState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PaymentMethodsState.initialPaymentMethodsState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialPaymentMethodsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialPaymentMethodsState(),
    @required Result paymentMethodLoaded(PaymentMethod paymentMethod),
    @required Result paymentMethodEmpty(),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    return initialPaymentMethodsState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialPaymentMethodsState != null) {
      return initialPaymentMethodsState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    @required Result paymentMethodLoaded(PaymentMethodLoaded value),
    @required Result paymentMethodEmpty(PaymentMethodEmpty value),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    return initialPaymentMethodsState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialPaymentMethodsState != null) {
      return initialPaymentMethodsState(this);
    }
    return orElse();
  }
}

abstract class InitialPaymentMethodsState implements PaymentMethodsState {
  const factory InitialPaymentMethodsState() = _$InitialPaymentMethodsState;
}

abstract class $PaymentMethodLoadedCopyWith<$Res> {
  factory $PaymentMethodLoadedCopyWith(
          PaymentMethodLoaded value, $Res Function(PaymentMethodLoaded) then) =
      _$PaymentMethodLoadedCopyWithImpl<$Res>;
  $Res call({PaymentMethod paymentMethod});

  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

class _$PaymentMethodLoadedCopyWithImpl<$Res>
    extends _$PaymentMethodsStateCopyWithImpl<$Res>
    implements $PaymentMethodLoadedCopyWith<$Res> {
  _$PaymentMethodLoadedCopyWithImpl(
      PaymentMethodLoaded _value, $Res Function(PaymentMethodLoaded) _then)
      : super(_value, (v) => _then(v as PaymentMethodLoaded));

  @override
  PaymentMethodLoaded get _value => super._value as PaymentMethodLoaded;

  @override
  $Res call({
    Object paymentMethod = freezed,
  }) {
    return _then(PaymentMethodLoaded(
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod as PaymentMethod,
    ));
  }

  @override
  $PaymentMethodCopyWith<$Res> get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }
    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value));
    });
  }
}

class _$PaymentMethodLoaded
    with DiagnosticableTreeMixin
    implements PaymentMethodLoaded {
  const _$PaymentMethodLoaded({this.paymentMethod});

  @override
  final PaymentMethod paymentMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsState.paymentMethodLoaded(paymentMethod: $paymentMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PaymentMethodsState.paymentMethodLoaded'))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethodLoaded &&
            (identical(other.paymentMethod, paymentMethod) ||
                const DeepCollectionEquality()
                    .equals(other.paymentMethod, paymentMethod)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(paymentMethod);

  @override
  $PaymentMethodLoadedCopyWith<PaymentMethodLoaded> get copyWith =>
      _$PaymentMethodLoadedCopyWithImpl<PaymentMethodLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialPaymentMethodsState(),
    @required Result paymentMethodLoaded(PaymentMethod paymentMethod),
    @required Result paymentMethodEmpty(),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    return paymentMethodLoaded(paymentMethod);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodLoaded != null) {
      return paymentMethodLoaded(paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    @required Result paymentMethodLoaded(PaymentMethodLoaded value),
    @required Result paymentMethodEmpty(PaymentMethodEmpty value),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    return paymentMethodLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodLoaded != null) {
      return paymentMethodLoaded(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodLoaded implements PaymentMethodsState {
  const factory PaymentMethodLoaded({PaymentMethod paymentMethod}) =
      _$PaymentMethodLoaded;

  PaymentMethod get paymentMethod;
  $PaymentMethodLoadedCopyWith<PaymentMethodLoaded> get copyWith;
}

abstract class $PaymentMethodEmptyCopyWith<$Res> {
  factory $PaymentMethodEmptyCopyWith(
          PaymentMethodEmpty value, $Res Function(PaymentMethodEmpty) then) =
      _$PaymentMethodEmptyCopyWithImpl<$Res>;
}

class _$PaymentMethodEmptyCopyWithImpl<$Res>
    extends _$PaymentMethodsStateCopyWithImpl<$Res>
    implements $PaymentMethodEmptyCopyWith<$Res> {
  _$PaymentMethodEmptyCopyWithImpl(
      PaymentMethodEmpty _value, $Res Function(PaymentMethodEmpty) _then)
      : super(_value, (v) => _then(v as PaymentMethodEmpty));

  @override
  PaymentMethodEmpty get _value => super._value as PaymentMethodEmpty;
}

class _$PaymentMethodEmpty
    with DiagnosticableTreeMixin
    implements PaymentMethodEmpty {
  const _$PaymentMethodEmpty();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsState.paymentMethodEmpty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PaymentMethodsState.paymentMethodEmpty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PaymentMethodEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialPaymentMethodsState(),
    @required Result paymentMethodLoaded(PaymentMethod paymentMethod),
    @required Result paymentMethodEmpty(),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    return paymentMethodEmpty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodEmpty != null) {
      return paymentMethodEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    @required Result paymentMethodLoaded(PaymentMethodLoaded value),
    @required Result paymentMethodEmpty(PaymentMethodEmpty value),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    return paymentMethodEmpty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodEmpty != null) {
      return paymentMethodEmpty(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodEmpty implements PaymentMethodsState {
  const factory PaymentMethodEmpty() = _$PaymentMethodEmpty;
}
