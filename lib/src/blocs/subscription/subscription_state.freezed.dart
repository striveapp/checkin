// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'subscription_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SubscriptionStateTearOff {
  const _$SubscriptionStateTearOff();

  SubscriptionInitial subscriptionInitial() {
    return const SubscriptionInitial();
  }

  SubscriptionSuccess subscriptionSuccess() {
    return const SubscriptionSuccess();
  }

  SubscriptionLoading subscriptionLoading() {
    return const SubscriptionLoading();
  }

  SubscriptionError subscriptionError({String errorMessage}) {
    return SubscriptionError(
      errorMessage: errorMessage,
    );
  }
}

// ignore: unused_element
const $SubscriptionState = _$SubscriptionStateTearOff();

mixin _$SubscriptionState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionInitial(),
    @required Result subscriptionSuccess(),
    @required Result subscriptionLoading(),
    @required Result subscriptionError(String errorMessage),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionInitial(),
    Result subscriptionSuccess(),
    Result subscriptionLoading(),
    Result subscriptionError(String errorMessage),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionInitial(SubscriptionInitial value),
    @required Result subscriptionSuccess(SubscriptionSuccess value),
    @required Result subscriptionLoading(SubscriptionLoading value),
    @required Result subscriptionError(SubscriptionError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionInitial(SubscriptionInitial value),
    Result subscriptionSuccess(SubscriptionSuccess value),
    Result subscriptionLoading(SubscriptionLoading value),
    Result subscriptionError(SubscriptionError value),
    @required Result orElse(),
  });
}

abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
          SubscriptionState value, $Res Function(SubscriptionState) then) =
      _$SubscriptionStateCopyWithImpl<$Res>;
}

class _$SubscriptionStateCopyWithImpl<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

  final SubscriptionState _value;
  // ignore: unused_field
  final $Res Function(SubscriptionState) _then;
}

abstract class $SubscriptionInitialCopyWith<$Res> {
  factory $SubscriptionInitialCopyWith(
          SubscriptionInitial value, $Res Function(SubscriptionInitial) then) =
      _$SubscriptionInitialCopyWithImpl<$Res>;
}

class _$SubscriptionInitialCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res>
    implements $SubscriptionInitialCopyWith<$Res> {
  _$SubscriptionInitialCopyWithImpl(
      SubscriptionInitial _value, $Res Function(SubscriptionInitial) _then)
      : super(_value, (v) => _then(v as SubscriptionInitial));

  @override
  SubscriptionInitial get _value => super._value as SubscriptionInitial;
}

class _$SubscriptionInitial implements SubscriptionInitial {
  const _$SubscriptionInitial();

  @override
  String toString() {
    return 'SubscriptionState.subscriptionInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SubscriptionInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionInitial(),
    @required Result subscriptionSuccess(),
    @required Result subscriptionLoading(),
    @required Result subscriptionError(String errorMessage),
  }) {
    assert(subscriptionInitial != null);
    assert(subscriptionSuccess != null);
    assert(subscriptionLoading != null);
    assert(subscriptionError != null);
    return subscriptionInitial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionInitial(),
    Result subscriptionSuccess(),
    Result subscriptionLoading(),
    Result subscriptionError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionInitial != null) {
      return subscriptionInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionInitial(SubscriptionInitial value),
    @required Result subscriptionSuccess(SubscriptionSuccess value),
    @required Result subscriptionLoading(SubscriptionLoading value),
    @required Result subscriptionError(SubscriptionError value),
  }) {
    assert(subscriptionInitial != null);
    assert(subscriptionSuccess != null);
    assert(subscriptionLoading != null);
    assert(subscriptionError != null);
    return subscriptionInitial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionInitial(SubscriptionInitial value),
    Result subscriptionSuccess(SubscriptionSuccess value),
    Result subscriptionLoading(SubscriptionLoading value),
    Result subscriptionError(SubscriptionError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionInitial != null) {
      return subscriptionInitial(this);
    }
    return orElse();
  }
}

abstract class SubscriptionInitial implements SubscriptionState {
  const factory SubscriptionInitial() = _$SubscriptionInitial;
}

abstract class $SubscriptionSuccessCopyWith<$Res> {
  factory $SubscriptionSuccessCopyWith(
          SubscriptionSuccess value, $Res Function(SubscriptionSuccess) then) =
      _$SubscriptionSuccessCopyWithImpl<$Res>;
}

class _$SubscriptionSuccessCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res>
    implements $SubscriptionSuccessCopyWith<$Res> {
  _$SubscriptionSuccessCopyWithImpl(
      SubscriptionSuccess _value, $Res Function(SubscriptionSuccess) _then)
      : super(_value, (v) => _then(v as SubscriptionSuccess));

  @override
  SubscriptionSuccess get _value => super._value as SubscriptionSuccess;
}

class _$SubscriptionSuccess implements SubscriptionSuccess {
  const _$SubscriptionSuccess();

  @override
  String toString() {
    return 'SubscriptionState.subscriptionSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SubscriptionSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionInitial(),
    @required Result subscriptionSuccess(),
    @required Result subscriptionLoading(),
    @required Result subscriptionError(String errorMessage),
  }) {
    assert(subscriptionInitial != null);
    assert(subscriptionSuccess != null);
    assert(subscriptionLoading != null);
    assert(subscriptionError != null);
    return subscriptionSuccess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionInitial(),
    Result subscriptionSuccess(),
    Result subscriptionLoading(),
    Result subscriptionError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionSuccess != null) {
      return subscriptionSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionInitial(SubscriptionInitial value),
    @required Result subscriptionSuccess(SubscriptionSuccess value),
    @required Result subscriptionLoading(SubscriptionLoading value),
    @required Result subscriptionError(SubscriptionError value),
  }) {
    assert(subscriptionInitial != null);
    assert(subscriptionSuccess != null);
    assert(subscriptionLoading != null);
    assert(subscriptionError != null);
    return subscriptionSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionInitial(SubscriptionInitial value),
    Result subscriptionSuccess(SubscriptionSuccess value),
    Result subscriptionLoading(SubscriptionLoading value),
    Result subscriptionError(SubscriptionError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionSuccess != null) {
      return subscriptionSuccess(this);
    }
    return orElse();
  }
}

abstract class SubscriptionSuccess implements SubscriptionState {
  const factory SubscriptionSuccess() = _$SubscriptionSuccess;
}

abstract class $SubscriptionLoadingCopyWith<$Res> {
  factory $SubscriptionLoadingCopyWith(
          SubscriptionLoading value, $Res Function(SubscriptionLoading) then) =
      _$SubscriptionLoadingCopyWithImpl<$Res>;
}

class _$SubscriptionLoadingCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res>
    implements $SubscriptionLoadingCopyWith<$Res> {
  _$SubscriptionLoadingCopyWithImpl(
      SubscriptionLoading _value, $Res Function(SubscriptionLoading) _then)
      : super(_value, (v) => _then(v as SubscriptionLoading));

  @override
  SubscriptionLoading get _value => super._value as SubscriptionLoading;
}

class _$SubscriptionLoading implements SubscriptionLoading {
  const _$SubscriptionLoading();

  @override
  String toString() {
    return 'SubscriptionState.subscriptionLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SubscriptionLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionInitial(),
    @required Result subscriptionSuccess(),
    @required Result subscriptionLoading(),
    @required Result subscriptionError(String errorMessage),
  }) {
    assert(subscriptionInitial != null);
    assert(subscriptionSuccess != null);
    assert(subscriptionLoading != null);
    assert(subscriptionError != null);
    return subscriptionLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionInitial(),
    Result subscriptionSuccess(),
    Result subscriptionLoading(),
    Result subscriptionError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionLoading != null) {
      return subscriptionLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionInitial(SubscriptionInitial value),
    @required Result subscriptionSuccess(SubscriptionSuccess value),
    @required Result subscriptionLoading(SubscriptionLoading value),
    @required Result subscriptionError(SubscriptionError value),
  }) {
    assert(subscriptionInitial != null);
    assert(subscriptionSuccess != null);
    assert(subscriptionLoading != null);
    assert(subscriptionError != null);
    return subscriptionLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionInitial(SubscriptionInitial value),
    Result subscriptionSuccess(SubscriptionSuccess value),
    Result subscriptionLoading(SubscriptionLoading value),
    Result subscriptionError(SubscriptionError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionLoading != null) {
      return subscriptionLoading(this);
    }
    return orElse();
  }
}

abstract class SubscriptionLoading implements SubscriptionState {
  const factory SubscriptionLoading() = _$SubscriptionLoading;
}

abstract class $SubscriptionErrorCopyWith<$Res> {
  factory $SubscriptionErrorCopyWith(
          SubscriptionError value, $Res Function(SubscriptionError) then) =
      _$SubscriptionErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

class _$SubscriptionErrorCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res>
    implements $SubscriptionErrorCopyWith<$Res> {
  _$SubscriptionErrorCopyWithImpl(
      SubscriptionError _value, $Res Function(SubscriptionError) _then)
      : super(_value, (v) => _then(v as SubscriptionError));

  @override
  SubscriptionError get _value => super._value as SubscriptionError;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(SubscriptionError(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

class _$SubscriptionError implements SubscriptionError {
  const _$SubscriptionError({this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'SubscriptionState.subscriptionError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubscriptionError &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @override
  $SubscriptionErrorCopyWith<SubscriptionError> get copyWith =>
      _$SubscriptionErrorCopyWithImpl<SubscriptionError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result subscriptionInitial(),
    @required Result subscriptionSuccess(),
    @required Result subscriptionLoading(),
    @required Result subscriptionError(String errorMessage),
  }) {
    assert(subscriptionInitial != null);
    assert(subscriptionSuccess != null);
    assert(subscriptionLoading != null);
    assert(subscriptionError != null);
    return subscriptionError(errorMessage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result subscriptionInitial(),
    Result subscriptionSuccess(),
    Result subscriptionLoading(),
    Result subscriptionError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionError != null) {
      return subscriptionError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result subscriptionInitial(SubscriptionInitial value),
    @required Result subscriptionSuccess(SubscriptionSuccess value),
    @required Result subscriptionLoading(SubscriptionLoading value),
    @required Result subscriptionError(SubscriptionError value),
  }) {
    assert(subscriptionInitial != null);
    assert(subscriptionSuccess != null);
    assert(subscriptionLoading != null);
    assert(subscriptionError != null);
    return subscriptionError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result subscriptionInitial(SubscriptionInitial value),
    Result subscriptionSuccess(SubscriptionSuccess value),
    Result subscriptionLoading(SubscriptionLoading value),
    Result subscriptionError(SubscriptionError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subscriptionError != null) {
      return subscriptionError(this);
    }
    return orElse();
  }
}

abstract class SubscriptionError implements SubscriptionState {
  const factory SubscriptionError({String errorMessage}) = _$SubscriptionError;

  String get errorMessage;
  $SubscriptionErrorCopyWith<SubscriptionError> get copyWith;
}
