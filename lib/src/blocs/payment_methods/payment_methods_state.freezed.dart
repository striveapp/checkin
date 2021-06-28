// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_methods_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentMethodsStateTearOff {
  const _$PaymentMethodsStateTearOff();

  InitialPaymentMethodsState initialPaymentMethodsState() {
    return const InitialPaymentMethodsState();
  }

  PaymentMethodLoaded paymentMethodLoaded(
      {required PaymentMethod paymentMethod}) {
    return PaymentMethodLoaded(
      paymentMethod: paymentMethod,
    );
  }

  PaymentMethodEmpty paymentMethodEmpty({required String customerEmail}) {
    return PaymentMethodEmpty(
      customerEmail: customerEmail,
    );
  }

  PaymentMethodLoading paymentMethodLoading({required bool show}) {
    return PaymentMethodLoading(
      show: show,
    );
  }
}

/// @nodoc
const $PaymentMethodsState = _$PaymentMethodsStateTearOff();

/// @nodoc
mixin _$PaymentMethodsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialPaymentMethodsState,
    required TResult Function(PaymentMethod paymentMethod) paymentMethodLoaded,
    required TResult Function(String customerEmail) paymentMethodEmpty,
    required TResult Function(bool show) paymentMethodLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialPaymentMethodsState,
    TResult Function(PaymentMethod paymentMethod)? paymentMethodLoaded,
    TResult Function(String customerEmail)? paymentMethodEmpty,
    TResult Function(bool show)? paymentMethodLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPaymentMethodsState value)
        initialPaymentMethodsState,
    required TResult Function(PaymentMethodLoaded value) paymentMethodLoaded,
    required TResult Function(PaymentMethodEmpty value) paymentMethodEmpty,
    required TResult Function(PaymentMethodLoading value) paymentMethodLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPaymentMethodsState value)?
        initialPaymentMethodsState,
    TResult Function(PaymentMethodLoaded value)? paymentMethodLoaded,
    TResult Function(PaymentMethodEmpty value)? paymentMethodEmpty,
    TResult Function(PaymentMethodLoading value)? paymentMethodLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsStateCopyWith<$Res> {
  factory $PaymentMethodsStateCopyWith(
          PaymentMethodsState value, $Res Function(PaymentMethodsState) then) =
      _$PaymentMethodsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentMethodsStateCopyWithImpl<$Res>
    implements $PaymentMethodsStateCopyWith<$Res> {
  _$PaymentMethodsStateCopyWithImpl(this._value, this._then);

  final PaymentMethodsState _value;
  // ignore: unused_field
  final $Res Function(PaymentMethodsState) _then;
}

/// @nodoc
abstract class $InitialPaymentMethodsStateCopyWith<$Res> {
  factory $InitialPaymentMethodsStateCopyWith(InitialPaymentMethodsState value,
          $Res Function(InitialPaymentMethodsState) then) =
      _$InitialPaymentMethodsStateCopyWithImpl<$Res>;
}

/// @nodoc
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

/// @nodoc

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
  TResult when<TResult extends Object?>({
    required TResult Function() initialPaymentMethodsState,
    required TResult Function(PaymentMethod paymentMethod) paymentMethodLoaded,
    required TResult Function(String customerEmail) paymentMethodEmpty,
    required TResult Function(bool show) paymentMethodLoading,
  }) {
    return initialPaymentMethodsState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialPaymentMethodsState,
    TResult Function(PaymentMethod paymentMethod)? paymentMethodLoaded,
    TResult Function(String customerEmail)? paymentMethodEmpty,
    TResult Function(bool show)? paymentMethodLoading,
    required TResult orElse(),
  }) {
    if (initialPaymentMethodsState != null) {
      return initialPaymentMethodsState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPaymentMethodsState value)
        initialPaymentMethodsState,
    required TResult Function(PaymentMethodLoaded value) paymentMethodLoaded,
    required TResult Function(PaymentMethodEmpty value) paymentMethodEmpty,
    required TResult Function(PaymentMethodLoading value) paymentMethodLoading,
  }) {
    return initialPaymentMethodsState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPaymentMethodsState value)?
        initialPaymentMethodsState,
    TResult Function(PaymentMethodLoaded value)? paymentMethodLoaded,
    TResult Function(PaymentMethodEmpty value)? paymentMethodEmpty,
    TResult Function(PaymentMethodLoading value)? paymentMethodLoading,
    required TResult orElse(),
  }) {
    if (initialPaymentMethodsState != null) {
      return initialPaymentMethodsState(this);
    }
    return orElse();
  }
}

abstract class InitialPaymentMethodsState implements PaymentMethodsState {
  const factory InitialPaymentMethodsState() = _$InitialPaymentMethodsState;
}

/// @nodoc
abstract class $PaymentMethodLoadedCopyWith<$Res> {
  factory $PaymentMethodLoadedCopyWith(
          PaymentMethodLoaded value, $Res Function(PaymentMethodLoaded) then) =
      _$PaymentMethodLoadedCopyWithImpl<$Res>;
  $Res call({PaymentMethod paymentMethod});

  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
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
    Object? paymentMethod = freezed,
  }) {
    return _then(PaymentMethodLoaded(
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ));
  }

  @override
  $PaymentMethodCopyWith<$Res> get paymentMethod {
    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value));
    });
  }
}

/// @nodoc

class _$PaymentMethodLoaded
    with DiagnosticableTreeMixin
    implements PaymentMethodLoaded {
  const _$PaymentMethodLoaded({required this.paymentMethod});

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

  @JsonKey(ignore: true)
  @override
  $PaymentMethodLoadedCopyWith<PaymentMethodLoaded> get copyWith =>
      _$PaymentMethodLoadedCopyWithImpl<PaymentMethodLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialPaymentMethodsState,
    required TResult Function(PaymentMethod paymentMethod) paymentMethodLoaded,
    required TResult Function(String customerEmail) paymentMethodEmpty,
    required TResult Function(bool show) paymentMethodLoading,
  }) {
    return paymentMethodLoaded(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialPaymentMethodsState,
    TResult Function(PaymentMethod paymentMethod)? paymentMethodLoaded,
    TResult Function(String customerEmail)? paymentMethodEmpty,
    TResult Function(bool show)? paymentMethodLoading,
    required TResult orElse(),
  }) {
    if (paymentMethodLoaded != null) {
      return paymentMethodLoaded(paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPaymentMethodsState value)
        initialPaymentMethodsState,
    required TResult Function(PaymentMethodLoaded value) paymentMethodLoaded,
    required TResult Function(PaymentMethodEmpty value) paymentMethodEmpty,
    required TResult Function(PaymentMethodLoading value) paymentMethodLoading,
  }) {
    return paymentMethodLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPaymentMethodsState value)?
        initialPaymentMethodsState,
    TResult Function(PaymentMethodLoaded value)? paymentMethodLoaded,
    TResult Function(PaymentMethodEmpty value)? paymentMethodEmpty,
    TResult Function(PaymentMethodLoading value)? paymentMethodLoading,
    required TResult orElse(),
  }) {
    if (paymentMethodLoaded != null) {
      return paymentMethodLoaded(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodLoaded implements PaymentMethodsState {
  const factory PaymentMethodLoaded({required PaymentMethod paymentMethod}) =
      _$PaymentMethodLoaded;

  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodLoadedCopyWith<PaymentMethodLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodEmptyCopyWith<$Res> {
  factory $PaymentMethodEmptyCopyWith(
          PaymentMethodEmpty value, $Res Function(PaymentMethodEmpty) then) =
      _$PaymentMethodEmptyCopyWithImpl<$Res>;
  $Res call({String customerEmail});
}

/// @nodoc
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
    Object? customerEmail = freezed,
  }) {
    return _then(PaymentMethodEmpty(
      customerEmail: customerEmail == freezed
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentMethodEmpty
    with DiagnosticableTreeMixin
    implements PaymentMethodEmpty {
  const _$PaymentMethodEmpty({required this.customerEmail});

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

  @JsonKey(ignore: true)
  @override
  $PaymentMethodEmptyCopyWith<PaymentMethodEmpty> get copyWith =>
      _$PaymentMethodEmptyCopyWithImpl<PaymentMethodEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialPaymentMethodsState,
    required TResult Function(PaymentMethod paymentMethod) paymentMethodLoaded,
    required TResult Function(String customerEmail) paymentMethodEmpty,
    required TResult Function(bool show) paymentMethodLoading,
  }) {
    return paymentMethodEmpty(customerEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialPaymentMethodsState,
    TResult Function(PaymentMethod paymentMethod)? paymentMethodLoaded,
    TResult Function(String customerEmail)? paymentMethodEmpty,
    TResult Function(bool show)? paymentMethodLoading,
    required TResult orElse(),
  }) {
    if (paymentMethodEmpty != null) {
      return paymentMethodEmpty(customerEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPaymentMethodsState value)
        initialPaymentMethodsState,
    required TResult Function(PaymentMethodLoaded value) paymentMethodLoaded,
    required TResult Function(PaymentMethodEmpty value) paymentMethodEmpty,
    required TResult Function(PaymentMethodLoading value) paymentMethodLoading,
  }) {
    return paymentMethodEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPaymentMethodsState value)?
        initialPaymentMethodsState,
    TResult Function(PaymentMethodLoaded value)? paymentMethodLoaded,
    TResult Function(PaymentMethodEmpty value)? paymentMethodEmpty,
    TResult Function(PaymentMethodLoading value)? paymentMethodLoading,
    required TResult orElse(),
  }) {
    if (paymentMethodEmpty != null) {
      return paymentMethodEmpty(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodEmpty implements PaymentMethodsState {
  const factory PaymentMethodEmpty({required String customerEmail}) =
      _$PaymentMethodEmpty;

  String get customerEmail => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodEmptyCopyWith<PaymentMethodEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodLoadingCopyWith<$Res> {
  factory $PaymentMethodLoadingCopyWith(PaymentMethodLoading value,
          $Res Function(PaymentMethodLoading) then) =
      _$PaymentMethodLoadingCopyWithImpl<$Res>;
  $Res call({bool show});
}

/// @nodoc
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
    Object? show = freezed,
  }) {
    return _then(PaymentMethodLoading(
      show: show == freezed
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaymentMethodLoading
    with DiagnosticableTreeMixin
    implements PaymentMethodLoading {
  const _$PaymentMethodLoading({required this.show});

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

  @JsonKey(ignore: true)
  @override
  $PaymentMethodLoadingCopyWith<PaymentMethodLoading> get copyWith =>
      _$PaymentMethodLoadingCopyWithImpl<PaymentMethodLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialPaymentMethodsState,
    required TResult Function(PaymentMethod paymentMethod) paymentMethodLoaded,
    required TResult Function(String customerEmail) paymentMethodEmpty,
    required TResult Function(bool show) paymentMethodLoading,
  }) {
    return paymentMethodLoading(show);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialPaymentMethodsState,
    TResult Function(PaymentMethod paymentMethod)? paymentMethodLoaded,
    TResult Function(String customerEmail)? paymentMethodEmpty,
    TResult Function(bool show)? paymentMethodLoading,
    required TResult orElse(),
  }) {
    if (paymentMethodLoading != null) {
      return paymentMethodLoading(show);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPaymentMethodsState value)
        initialPaymentMethodsState,
    required TResult Function(PaymentMethodLoaded value) paymentMethodLoaded,
    required TResult Function(PaymentMethodEmpty value) paymentMethodEmpty,
    required TResult Function(PaymentMethodLoading value) paymentMethodLoading,
  }) {
    return paymentMethodLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPaymentMethodsState value)?
        initialPaymentMethodsState,
    TResult Function(PaymentMethodLoaded value)? paymentMethodLoaded,
    TResult Function(PaymentMethodEmpty value)? paymentMethodEmpty,
    TResult Function(PaymentMethodLoading value)? paymentMethodLoading,
    required TResult orElse(),
  }) {
    if (paymentMethodLoading != null) {
      return paymentMethodLoading(this);
    }
    return orElse();
  }
}

abstract class PaymentMethodLoading implements PaymentMethodsState {
  const factory PaymentMethodLoading({required bool show}) =
      _$PaymentMethodLoading;

  bool get show => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodLoadingCopyWith<PaymentMethodLoading> get copyWith =>
      throw _privateConstructorUsedError;
}
