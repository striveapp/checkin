// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payment_methods_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PaymentMethodsStateTearOff {
  const _$PaymentMethodsStateTearOff();

// ignore: unused_element
  InitialPaymentMethodsState initialPaymentMethodsState() {
    return const InitialPaymentMethodsState();
  }

// ignore: unused_element
  PaymentMethodLoaded paymentMethodLoaded(
      {@required PaymentMethod paymentMethod}) {
    return PaymentMethodLoaded(
      paymentMethod: paymentMethod,
    );
  }

// ignore: unused_element
  PaymentMethodEmpty paymentMethodEmpty({@required String customerEmail}) {
    return PaymentMethodEmpty(
      customerEmail: customerEmail,
    );
  }

// ignore: unused_element
  PaymentMethodLoading paymentMethodLoading({@required bool show}) {
    return PaymentMethodLoading(
      show: show,
    );
  }
}

// ignore: unused_element
const $PaymentMethodsState = _$PaymentMethodsStateTearOff();

mixin _$PaymentMethodsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialPaymentMethodsState(),
    @required Result paymentMethodLoaded(PaymentMethod paymentMethod),
    @required Result paymentMethodEmpty(String customerEmail),
    @required Result paymentMethodLoading(bool show),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(String customerEmail),
    Result paymentMethodLoading(bool show),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    @required Result paymentMethodLoaded(PaymentMethodLoaded value),
    @required Result paymentMethodEmpty(PaymentMethodEmpty value),
    @required Result paymentMethodLoading(PaymentMethodLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    Result paymentMethodLoading(PaymentMethodLoading value),
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
    @required Result paymentMethodEmpty(String customerEmail),
    @required Result paymentMethodLoading(bool show),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    assert(paymentMethodLoading != null);
    return initialPaymentMethodsState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(String customerEmail),
    Result paymentMethodLoading(bool show),
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
    @required Result paymentMethodLoading(PaymentMethodLoading value),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    assert(paymentMethodLoading != null);
    return initialPaymentMethodsState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    Result paymentMethodLoading(PaymentMethodLoading value),
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
  const _$PaymentMethodLoaded({@required this.paymentMethod})
      : assert(paymentMethod != null);

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
    @required Result paymentMethodEmpty(String customerEmail),
    @required Result paymentMethodLoading(bool show),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    assert(paymentMethodLoading != null);
    return paymentMethodLoaded(paymentMethod);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(String customerEmail),
    Result paymentMethodLoading(bool show),
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
    @required Result paymentMethodLoading(PaymentMethodLoading value),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    assert(paymentMethodLoading != null);
    return paymentMethodLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    Result paymentMethodLoading(PaymentMethodLoading value),
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
  const factory PaymentMethodLoaded({@required PaymentMethod paymentMethod}) =
      _$PaymentMethodLoaded;

  PaymentMethod get paymentMethod;
  $PaymentMethodLoadedCopyWith<PaymentMethodLoaded> get copyWith;
}

abstract class $PaymentMethodEmptyCopyWith<$Res> {
  factory $PaymentMethodEmptyCopyWith(
          PaymentMethodEmpty value, $Res Function(PaymentMethodEmpty) then) =
      _$PaymentMethodEmptyCopyWithImpl<$Res>;
  $Res call({String customerEmail});
}

class _$PaymentMethodEmptyCopyWithImpl<$Res>
    extends _$PaymentMethodsStateCopyWithImpl<$Res>
    implements $PaymentMethodEmptyCopyWith<$Res> {
  _$PaymentMethodEmptyCopyWithImpl(
      PaymentMethodEmpty _value, $Res Function(PaymentMethodEmpty) _then)
      : super(_value, (v) => _then(v as PaymentMethodEmpty));

  @override
  PaymentMethodEmpty get _value => super._value as PaymentMethodEmpty;

  @override
  $Res call({
    Object customerEmail = freezed,
  }) {
    return _then(PaymentMethodEmpty(
      customerEmail: customerEmail == freezed
          ? _value.customerEmail
          : customerEmail as String,
    ));
  }
}

class _$PaymentMethodEmpty
    with DiagnosticableTreeMixin
    implements PaymentMethodEmpty {
  const _$PaymentMethodEmpty({@required this.customerEmail})
      : assert(customerEmail != null);

  @override
  final String customerEmail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsState.paymentMethodEmpty(customerEmail: $customerEmail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'PaymentMethodsState.paymentMethodEmpty'))
      ..add(DiagnosticsProperty('customerEmail', customerEmail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethodEmpty &&
            (identical(other.customerEmail, customerEmail) ||
                const DeepCollectionEquality()
                    .equals(other.customerEmail, customerEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(customerEmail);

  @override
  $PaymentMethodEmptyCopyWith<PaymentMethodEmpty> get copyWith =>
      _$PaymentMethodEmptyCopyWithImpl<PaymentMethodEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialPaymentMethodsState(),
    @required Result paymentMethodLoaded(PaymentMethod paymentMethod),
    @required Result paymentMethodEmpty(String customerEmail),
    @required Result paymentMethodLoading(bool show),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    assert(paymentMethodLoading != null);
    return paymentMethodEmpty(customerEmail);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(String customerEmail),
    Result paymentMethodLoading(bool show),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodEmpty != null) {
      return paymentMethodEmpty(customerEmail);
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
    @required Result paymentMethodLoading(PaymentMethodLoading value),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    assert(paymentMethodLoading != null);
    return paymentMethodEmpty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    Result paymentMethodLoading(PaymentMethodLoading value),
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
  const factory PaymentMethodEmpty({@required String customerEmail}) =
      _$PaymentMethodEmpty;

  String get customerEmail;
  $PaymentMethodEmptyCopyWith<PaymentMethodEmpty> get copyWith;
}

abstract class $PaymentMethodLoadingCopyWith<$Res> {
  factory $PaymentMethodLoadingCopyWith(PaymentMethodLoading value,
          $Res Function(PaymentMethodLoading) then) =
      _$PaymentMethodLoadingCopyWithImpl<$Res>;
  $Res call({bool show});
}

class _$PaymentMethodLoadingCopyWithImpl<$Res>
    extends _$PaymentMethodsStateCopyWithImpl<$Res>
    implements $PaymentMethodLoadingCopyWith<$Res> {
  _$PaymentMethodLoadingCopyWithImpl(
      PaymentMethodLoading _value, $Res Function(PaymentMethodLoading) _then)
      : super(_value, (v) => _then(v as PaymentMethodLoading));

  @override
  PaymentMethodLoading get _value => super._value as PaymentMethodLoading;

  @override
  $Res call({
    Object show = freezed,
  }) {
    return _then(PaymentMethodLoading(
      show: show == freezed ? _value.show : show as bool,
    ));
  }
}

class _$PaymentMethodLoading
    with DiagnosticableTreeMixin
    implements PaymentMethodLoading {
  const _$PaymentMethodLoading({@required this.show}) : assert(show != null);

  @override
  final bool show;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethodsState.paymentMethodLoading(show: $show)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PaymentMethodsState.paymentMethodLoading'))
      ..add(DiagnosticsProperty('show', show));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentMethodLoading &&
            (identical(other.show, show) ||
                const DeepCollectionEquality().equals(other.show, show)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(show);

  @override
  $PaymentMethodLoadingCopyWith<PaymentMethodLoading> get copyWith =>
      _$PaymentMethodLoadingCopyWithImpl<PaymentMethodLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialPaymentMethodsState(),
    @required Result paymentMethodLoaded(PaymentMethod paymentMethod),
    @required Result paymentMethodEmpty(String customerEmail),
    @required Result paymentMethodLoading(bool show),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    assert(paymentMethodLoading != null);
    return paymentMethodLoading(show);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialPaymentMethodsState(),
    Result paymentMethodLoaded(PaymentMethod paymentMethod),
    Result paymentMethodEmpty(String customerEmail),
    Result paymentMethodLoading(bool show),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodLoading != null) {
      return paymentMethodLoading(show);
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
    @required Result paymentMethodLoading(PaymentMethodLoading value),
  }) {
    assert(initialPaymentMethodsState != null);
    assert(paymentMethodLoaded != null);
    assert(paymentMethodEmpty != null);
    assert(paymentMethodLoading != null);
    return paymentMethodLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialPaymentMethodsState(InitialPaymentMethodsState value),
    Result paymentMethodLoaded(PaymentMethodLoaded value),
    Result paymentMethodEmpty(PaymentMethodEmpty value),
    Result paymentMethodLoading(PaymentMethodLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paymentMethodLoading != null) {
      return paymentMethodLoading(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodLoading implements PaymentMethodsState {
  const factory PaymentMethodLoading({@required bool show}) =
      _$PaymentMethodLoading;

  bool get show;
  $PaymentMethodLoadingCopyWith<PaymentMethodLoading> get copyWith;
}
