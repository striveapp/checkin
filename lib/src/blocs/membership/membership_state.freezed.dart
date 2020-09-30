// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'membership_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MembershipStateTearOff {
  const _$MembershipStateTearOff();

// ignore: unused_element
  InitialMembershipState initialMembershipState() {
    return const InitialMembershipState();
  }

// ignore: unused_element
  MembershipActive membershipActive({@required Membership membership}) {
    return MembershipActive(
      membership: membership,
    );
  }

// ignore: unused_element
  MembershipInactive membershipInactive(
      {@required String customerEmail, String customerId}) {
    return MembershipInactive(
      customerEmail: customerEmail,
      customerId: customerId,
    );
  }

// ignore: unused_element
  MembershipLoading membershipLoading() {
    return const MembershipLoading();
  }

// ignore: unused_element
  MembershipError membershipError({@required String errorMessage}) {
    return MembershipError(
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MembershipState = _$MembershipStateTearOff();

/// @nodoc
mixin _$MembershipState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialMembershipState(),
    @required Result membershipActive(Membership membership),
    @required
        Result membershipInactive(String customerEmail, String customerId),
    @required Result membershipLoading(),
    @required Result membershipError(String errorMessage),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
    Result membershipError(String errorMessage),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialMembershipState(InitialMembershipState value),
    @required Result membershipActive(MembershipActive value),
    @required Result membershipInactive(MembershipInactive value),
    @required Result membershipLoading(MembershipLoading value),
    @required Result membershipError(MembershipError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
    Result membershipError(MembershipError value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $MembershipStateCopyWith<$Res> {
  factory $MembershipStateCopyWith(
          MembershipState value, $Res Function(MembershipState) then) =
      _$MembershipStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MembershipStateCopyWithImpl<$Res>
    implements $MembershipStateCopyWith<$Res> {
  _$MembershipStateCopyWithImpl(this._value, this._then);

  final MembershipState _value;
  // ignore: unused_field
  final $Res Function(MembershipState) _then;
}

/// @nodoc
abstract class $InitialMembershipStateCopyWith<$Res> {
  factory $InitialMembershipStateCopyWith(InitialMembershipState value,
          $Res Function(InitialMembershipState) then) =
      _$InitialMembershipStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialMembershipStateCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res>
    implements $InitialMembershipStateCopyWith<$Res> {
  _$InitialMembershipStateCopyWithImpl(InitialMembershipState _value,
      $Res Function(InitialMembershipState) _then)
      : super(_value, (v) => _then(v as InitialMembershipState));

  @override
  InitialMembershipState get _value => super._value as InitialMembershipState;
}

/// @nodoc
class _$InitialMembershipState
    with DiagnosticableTreeMixin
    implements InitialMembershipState {
  const _$InitialMembershipState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MembershipState.initialMembershipState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'MembershipState.initialMembershipState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialMembershipState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialMembershipState(),
    @required Result membershipActive(Membership membership),
    @required
        Result membershipInactive(String customerEmail, String customerId),
    @required Result membershipLoading(),
    @required Result membershipError(String errorMessage),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return initialMembershipState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
    Result membershipError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialMembershipState != null) {
      return initialMembershipState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialMembershipState(InitialMembershipState value),
    @required Result membershipActive(MembershipActive value),
    @required Result membershipInactive(MembershipInactive value),
    @required Result membershipLoading(MembershipLoading value),
    @required Result membershipError(MembershipError value),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return initialMembershipState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
    Result membershipError(MembershipError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialMembershipState != null) {
      return initialMembershipState(this);
    }
    return orElse();
  }
}

abstract class InitialMembershipState implements MembershipState {
  const factory InitialMembershipState() = _$InitialMembershipState;
}

/// @nodoc
abstract class $MembershipActiveCopyWith<$Res> {
  factory $MembershipActiveCopyWith(
          MembershipActive value, $Res Function(MembershipActive) then) =
      _$MembershipActiveCopyWithImpl<$Res>;
  $Res call({Membership membership});

  $MembershipCopyWith<$Res> get membership;
}

/// @nodoc
class _$MembershipActiveCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res>
    implements $MembershipActiveCopyWith<$Res> {
  _$MembershipActiveCopyWithImpl(
      MembershipActive _value, $Res Function(MembershipActive) _then)
      : super(_value, (v) => _then(v as MembershipActive));

  @override
  MembershipActive get _value => super._value as MembershipActive;

  @override
  $Res call({
    Object membership = freezed,
  }) {
    return _then(MembershipActive(
      membership:
          membership == freezed ? _value.membership : membership as Membership,
    ));
  }

  @override
  $MembershipCopyWith<$Res> get membership {
    if (_value.membership == null) {
      return null;
    }
    return $MembershipCopyWith<$Res>(_value.membership, (value) {
      return _then(_value.copyWith(membership: value));
    });
  }
}

/// @nodoc
class _$MembershipActive
    with DiagnosticableTreeMixin
    implements MembershipActive {
  const _$MembershipActive({@required this.membership})
      : assert(membership != null);

  @override
  final Membership membership;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MembershipState.membershipActive(membership: $membership)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MembershipState.membershipActive'))
      ..add(DiagnosticsProperty('membership', membership));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MembershipActive &&
            (identical(other.membership, membership) ||
                const DeepCollectionEquality()
                    .equals(other.membership, membership)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(membership);

  @override
  $MembershipActiveCopyWith<MembershipActive> get copyWith =>
      _$MembershipActiveCopyWithImpl<MembershipActive>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialMembershipState(),
    @required Result membershipActive(Membership membership),
    @required
        Result membershipInactive(String customerEmail, String customerId),
    @required Result membershipLoading(),
    @required Result membershipError(String errorMessage),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return membershipActive(membership);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
    Result membershipError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (membershipActive != null) {
      return membershipActive(membership);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialMembershipState(InitialMembershipState value),
    @required Result membershipActive(MembershipActive value),
    @required Result membershipInactive(MembershipInactive value),
    @required Result membershipLoading(MembershipLoading value),
    @required Result membershipError(MembershipError value),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return membershipActive(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
    Result membershipError(MembershipError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (membershipActive != null) {
      return membershipActive(this);
    }
    return orElse();
  }
}

abstract class MembershipActive implements MembershipState {
  const factory MembershipActive({@required Membership membership}) =
      _$MembershipActive;

  Membership get membership;
  $MembershipActiveCopyWith<MembershipActive> get copyWith;
}

/// @nodoc
abstract class $MembershipInactiveCopyWith<$Res> {
  factory $MembershipInactiveCopyWith(
          MembershipInactive value, $Res Function(MembershipInactive) then) =
      _$MembershipInactiveCopyWithImpl<$Res>;
  $Res call({String customerEmail, String customerId});
}

/// @nodoc
class _$MembershipInactiveCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res>
    implements $MembershipInactiveCopyWith<$Res> {
  _$MembershipInactiveCopyWithImpl(
      MembershipInactive _value, $Res Function(MembershipInactive) _then)
      : super(_value, (v) => _then(v as MembershipInactive));

  @override
  MembershipInactive get _value => super._value as MembershipInactive;

  @override
  $Res call({
    Object customerEmail = freezed,
    Object customerId = freezed,
  }) {
    return _then(MembershipInactive(
      customerEmail: customerEmail == freezed
          ? _value.customerEmail
          : customerEmail as String,
      customerId:
          customerId == freezed ? _value.customerId : customerId as String,
    ));
  }
}

/// @nodoc
class _$MembershipInactive
    with DiagnosticableTreeMixin
    implements MembershipInactive {
  const _$MembershipInactive({@required this.customerEmail, this.customerId})
      : assert(customerEmail != null);

  @override
  final String customerEmail;
  @override
  final String customerId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MembershipState.membershipInactive(customerEmail: $customerEmail, customerId: $customerId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MembershipState.membershipInactive'))
      ..add(DiagnosticsProperty('customerEmail', customerEmail))
      ..add(DiagnosticsProperty('customerId', customerId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MembershipInactive &&
            (identical(other.customerEmail, customerEmail) ||
                const DeepCollectionEquality()
                    .equals(other.customerEmail, customerEmail)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customerEmail) ^
      const DeepCollectionEquality().hash(customerId);

  @override
  $MembershipInactiveCopyWith<MembershipInactive> get copyWith =>
      _$MembershipInactiveCopyWithImpl<MembershipInactive>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialMembershipState(),
    @required Result membershipActive(Membership membership),
    @required
        Result membershipInactive(String customerEmail, String customerId),
    @required Result membershipLoading(),
    @required Result membershipError(String errorMessage),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return membershipInactive(customerEmail, customerId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
    Result membershipError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (membershipInactive != null) {
      return membershipInactive(customerEmail, customerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialMembershipState(InitialMembershipState value),
    @required Result membershipActive(MembershipActive value),
    @required Result membershipInactive(MembershipInactive value),
    @required Result membershipLoading(MembershipLoading value),
    @required Result membershipError(MembershipError value),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return membershipInactive(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
    Result membershipError(MembershipError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (membershipInactive != null) {
      return membershipInactive(this);
    }
    return orElse();
  }
}

abstract class MembershipInactive implements MembershipState {
  const factory MembershipInactive(
      {@required String customerEmail,
      String customerId}) = _$MembershipInactive;

  String get customerEmail;
  String get customerId;
  $MembershipInactiveCopyWith<MembershipInactive> get copyWith;
}

/// @nodoc
abstract class $MembershipLoadingCopyWith<$Res> {
  factory $MembershipLoadingCopyWith(
          MembershipLoading value, $Res Function(MembershipLoading) then) =
      _$MembershipLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MembershipLoadingCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res>
    implements $MembershipLoadingCopyWith<$Res> {
  _$MembershipLoadingCopyWithImpl(
      MembershipLoading _value, $Res Function(MembershipLoading) _then)
      : super(_value, (v) => _then(v as MembershipLoading));

  @override
  MembershipLoading get _value => super._value as MembershipLoading;
}

/// @nodoc
class _$MembershipLoading
    with DiagnosticableTreeMixin
    implements MembershipLoading {
  const _$MembershipLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MembershipState.membershipLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MembershipState.membershipLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MembershipLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialMembershipState(),
    @required Result membershipActive(Membership membership),
    @required
        Result membershipInactive(String customerEmail, String customerId),
    @required Result membershipLoading(),
    @required Result membershipError(String errorMessage),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return membershipLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
    Result membershipError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (membershipLoading != null) {
      return membershipLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialMembershipState(InitialMembershipState value),
    @required Result membershipActive(MembershipActive value),
    @required Result membershipInactive(MembershipInactive value),
    @required Result membershipLoading(MembershipLoading value),
    @required Result membershipError(MembershipError value),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return membershipLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
    Result membershipError(MembershipError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (membershipLoading != null) {
      return membershipLoading(this);
    }
    return orElse();
  }
}

abstract class MembershipLoading implements MembershipState {
  const factory MembershipLoading() = _$MembershipLoading;
}

/// @nodoc
abstract class $MembershipErrorCopyWith<$Res> {
  factory $MembershipErrorCopyWith(
          MembershipError value, $Res Function(MembershipError) then) =
      _$MembershipErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$MembershipErrorCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res>
    implements $MembershipErrorCopyWith<$Res> {
  _$MembershipErrorCopyWithImpl(
      MembershipError _value, $Res Function(MembershipError) _then)
      : super(_value, (v) => _then(v as MembershipError));

  @override
  MembershipError get _value => super._value as MembershipError;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(MembershipError(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
class _$MembershipError
    with DiagnosticableTreeMixin
    implements MembershipError {
  const _$MembershipError({@required this.errorMessage})
      : assert(errorMessage != null);

  @override
  final String errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MembershipState.membershipError(errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MembershipState.membershipError'))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MembershipError &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @override
  $MembershipErrorCopyWith<MembershipError> get copyWith =>
      _$MembershipErrorCopyWithImpl<MembershipError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialMembershipState(),
    @required Result membershipActive(Membership membership),
    @required
        Result membershipInactive(String customerEmail, String customerId),
    @required Result membershipLoading(),
    @required Result membershipError(String errorMessage),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return membershipError(errorMessage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
    Result membershipError(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (membershipError != null) {
      return membershipError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialMembershipState(InitialMembershipState value),
    @required Result membershipActive(MembershipActive value),
    @required Result membershipInactive(MembershipInactive value),
    @required Result membershipLoading(MembershipLoading value),
    @required Result membershipError(MembershipError value),
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    assert(membershipError != null);
    return membershipError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
    Result membershipError(MembershipError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (membershipError != null) {
      return membershipError(this);
    }
    return orElse();
  }
}

abstract class MembershipError implements MembershipState {
  const factory MembershipError({@required String errorMessage}) =
      _$MembershipError;

  String get errorMessage;
  $MembershipErrorCopyWith<MembershipError> get copyWith;
}
