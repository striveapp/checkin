// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'membership_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MembershipStateTearOff {
  const _$MembershipStateTearOff();

  InitialMembershipState initialMembershipState() {
    return const InitialMembershipState();
  }

  MembershipActive membershipActive({@required Membership membership}) {
    return MembershipActive(
      membership: membership,
    );
  }

  MembershipInactive membershipInactive(
      {@required String customerEmail, @required String customerId}) {
    return MembershipInactive(
      customerEmail: customerEmail,
      customerId: customerId,
    );
  }

  MembershipLoading membershipLoading() {
    return const MembershipLoading();
  }
}

// ignore: unused_element
const $MembershipState = _$MembershipStateTearOff();

mixin _$MembershipState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialMembershipState(),
    @required Result membershipActive(Membership membership),
    @required
        Result membershipInactive(String customerEmail, String customerId),
    @required Result membershipLoading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialMembershipState(InitialMembershipState value),
    @required Result membershipActive(MembershipActive value),
    @required Result membershipInactive(MembershipInactive value),
    @required Result membershipLoading(MembershipLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
    @required Result orElse(),
  });
}

abstract class $MembershipStateCopyWith<$Res> {
  factory $MembershipStateCopyWith(
          MembershipState value, $Res Function(MembershipState) then) =
      _$MembershipStateCopyWithImpl<$Res>;
}

class _$MembershipStateCopyWithImpl<$Res>
    implements $MembershipStateCopyWith<$Res> {
  _$MembershipStateCopyWithImpl(this._value, this._then);

  final MembershipState _value;
  // ignore: unused_field
  final $Res Function(MembershipState) _then;
}

abstract class $InitialMembershipStateCopyWith<$Res> {
  factory $InitialMembershipStateCopyWith(InitialMembershipState value,
          $Res Function(InitialMembershipState) then) =
      _$InitialMembershipStateCopyWithImpl<$Res>;
}

class _$InitialMembershipStateCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res>
    implements $InitialMembershipStateCopyWith<$Res> {
  _$InitialMembershipStateCopyWithImpl(InitialMembershipState _value,
      $Res Function(InitialMembershipState) _then)
      : super(_value, (v) => _then(v as InitialMembershipState));

  @override
  InitialMembershipState get _value => super._value as InitialMembershipState;
}

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
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    return initialMembershipState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
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
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    return initialMembershipState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
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

abstract class $MembershipActiveCopyWith<$Res> {
  factory $MembershipActiveCopyWith(
          MembershipActive value, $Res Function(MembershipActive) then) =
      _$MembershipActiveCopyWithImpl<$Res>;
  $Res call({Membership membership});

  $MembershipCopyWith<$Res> get membership;
}

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
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    return membershipActive(membership);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
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
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    return membershipActive(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
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

abstract class $MembershipInactiveCopyWith<$Res> {
  factory $MembershipInactiveCopyWith(
          MembershipInactive value, $Res Function(MembershipInactive) then) =
      _$MembershipInactiveCopyWithImpl<$Res>;
  $Res call({String customerEmail, String customerId});
}

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

class _$MembershipInactive
    with DiagnosticableTreeMixin
    implements MembershipInactive {
  const _$MembershipInactive(
      {@required this.customerEmail, @required this.customerId})
      : assert(customerEmail != null),
        assert(customerId != null);

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
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    return membershipInactive(customerEmail, customerId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
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
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    return membershipInactive(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
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
      @required String customerId}) = _$MembershipInactive;

  String get customerEmail;
  String get customerId;
  $MembershipInactiveCopyWith<MembershipInactive> get copyWith;
}

abstract class $MembershipLoadingCopyWith<$Res> {
  factory $MembershipLoadingCopyWith(
          MembershipLoading value, $Res Function(MembershipLoading) then) =
      _$MembershipLoadingCopyWithImpl<$Res>;
}

class _$MembershipLoadingCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res>
    implements $MembershipLoadingCopyWith<$Res> {
  _$MembershipLoadingCopyWithImpl(
      MembershipLoading _value, $Res Function(MembershipLoading) _then)
      : super(_value, (v) => _then(v as MembershipLoading));

  @override
  MembershipLoading get _value => super._value as MembershipLoading;
}

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
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    return membershipLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialMembershipState(),
    Result membershipActive(Membership membership),
    Result membershipInactive(String customerEmail, String customerId),
    Result membershipLoading(),
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
  }) {
    assert(initialMembershipState != null);
    assert(membershipActive != null);
    assert(membershipInactive != null);
    assert(membershipLoading != null);
    return membershipLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialMembershipState(InitialMembershipState value),
    Result membershipActive(MembershipActive value),
    Result membershipInactive(MembershipInactive value),
    Result membershipLoading(MembershipLoading value),
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
