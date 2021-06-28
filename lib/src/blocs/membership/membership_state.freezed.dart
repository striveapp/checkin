// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'membership_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MembershipStateTearOff {
  const _$MembershipStateTearOff();

  InitialMembershipState initialMembershipState() {
    return const InitialMembershipState();
  }

  MembershipActive membershipActive({required Membership membership}) {
    return MembershipActive(
      membership: membership,
    );
  }

  MembershipInactive membershipInactive(
      {required String customerEmail, String? customerId}) {
    return MembershipInactive(
      customerEmail: customerEmail,
      customerId: customerId,
    );
  }

  MembershipLoading membershipLoading() {
    return const MembershipLoading();
  }

  MembershipError membershipError({required String errorMessage}) {
    return MembershipError(
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $MembershipState = _$MembershipStateTearOff();

/// @nodoc
mixin _$MembershipState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialMembershipState,
    required TResult Function(Membership membership) membershipActive,
    required TResult Function(String customerEmail, String? customerId)
        membershipInactive,
    required TResult Function() membershipLoading,
    required TResult Function(String errorMessage) membershipError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialMembershipState,
    TResult Function(Membership membership)? membershipActive,
    TResult Function(String customerEmail, String? customerId)?
        membershipInactive,
    TResult Function()? membershipLoading,
    TResult Function(String errorMessage)? membershipError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMembershipState value)
        initialMembershipState,
    required TResult Function(MembershipActive value) membershipActive,
    required TResult Function(MembershipInactive value) membershipInactive,
    required TResult Function(MembershipLoading value) membershipLoading,
    required TResult Function(MembershipError value) membershipError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMembershipState value)? initialMembershipState,
    TResult Function(MembershipActive value)? membershipActive,
    TResult Function(MembershipInactive value)? membershipInactive,
    TResult Function(MembershipLoading value)? membershipLoading,
    TResult Function(MembershipError value)? membershipError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function() initialMembershipState,
    required TResult Function(Membership membership) membershipActive,
    required TResult Function(String customerEmail, String? customerId)
        membershipInactive,
    required TResult Function() membershipLoading,
    required TResult Function(String errorMessage) membershipError,
  }) {
    return initialMembershipState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialMembershipState,
    TResult Function(Membership membership)? membershipActive,
    TResult Function(String customerEmail, String? customerId)?
        membershipInactive,
    TResult Function()? membershipLoading,
    TResult Function(String errorMessage)? membershipError,
    required TResult orElse(),
  }) {
    if (initialMembershipState != null) {
      return initialMembershipState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMembershipState value)
        initialMembershipState,
    required TResult Function(MembershipActive value) membershipActive,
    required TResult Function(MembershipInactive value) membershipInactive,
    required TResult Function(MembershipLoading value) membershipLoading,
    required TResult Function(MembershipError value) membershipError,
  }) {
    return initialMembershipState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMembershipState value)? initialMembershipState,
    TResult Function(MembershipActive value)? membershipActive,
    TResult Function(MembershipInactive value)? membershipInactive,
    TResult Function(MembershipLoading value)? membershipLoading,
    TResult Function(MembershipError value)? membershipError,
    required TResult orElse(),
  }) {
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
    Object? membership = freezed,
  }) {
    return _then(MembershipActive(
      membership: membership == freezed
          ? _value.membership
          : membership // ignore: cast_nullable_to_non_nullable
              as Membership,
    ));
  }

  @override
  $MembershipCopyWith<$Res> get membership {
    return $MembershipCopyWith<$Res>(_value.membership, (value) {
      return _then(_value.copyWith(membership: value));
    });
  }
}

/// @nodoc

class _$MembershipActive
    with DiagnosticableTreeMixin
    implements MembershipActive {
  const _$MembershipActive({required this.membership});

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

  @JsonKey(ignore: true)
  @override
  $MembershipActiveCopyWith<MembershipActive> get copyWith =>
      _$MembershipActiveCopyWithImpl<MembershipActive>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialMembershipState,
    required TResult Function(Membership membership) membershipActive,
    required TResult Function(String customerEmail, String? customerId)
        membershipInactive,
    required TResult Function() membershipLoading,
    required TResult Function(String errorMessage) membershipError,
  }) {
    return membershipActive(membership);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialMembershipState,
    TResult Function(Membership membership)? membershipActive,
    TResult Function(String customerEmail, String? customerId)?
        membershipInactive,
    TResult Function()? membershipLoading,
    TResult Function(String errorMessage)? membershipError,
    required TResult orElse(),
  }) {
    if (membershipActive != null) {
      return membershipActive(membership);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMembershipState value)
        initialMembershipState,
    required TResult Function(MembershipActive value) membershipActive,
    required TResult Function(MembershipInactive value) membershipInactive,
    required TResult Function(MembershipLoading value) membershipLoading,
    required TResult Function(MembershipError value) membershipError,
  }) {
    return membershipActive(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMembershipState value)? initialMembershipState,
    TResult Function(MembershipActive value)? membershipActive,
    TResult Function(MembershipInactive value)? membershipInactive,
    TResult Function(MembershipLoading value)? membershipLoading,
    TResult Function(MembershipError value)? membershipError,
    required TResult orElse(),
  }) {
    if (membershipActive != null) {
      return membershipActive(this);
    }
    return orElse();
  }
}

abstract class MembershipActive implements MembershipState {
  const factory MembershipActive({required Membership membership}) =
      _$MembershipActive;

  Membership get membership => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembershipActiveCopyWith<MembershipActive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipInactiveCopyWith<$Res> {
  factory $MembershipInactiveCopyWith(
          MembershipInactive value, $Res Function(MembershipInactive) then) =
      _$MembershipInactiveCopyWithImpl<$Res>;
  $Res call({String customerEmail, String? customerId});
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
    Object? customerEmail = freezed,
    Object? customerId = freezed,
  }) {
    return _then(MembershipInactive(
      customerEmail: customerEmail == freezed
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MembershipInactive
    with DiagnosticableTreeMixin
    implements MembershipInactive {
  const _$MembershipInactive({required this.customerEmail, this.customerId});

  @override
  final String customerEmail;
  @override
  final String? customerId;

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

  @JsonKey(ignore: true)
  @override
  $MembershipInactiveCopyWith<MembershipInactive> get copyWith =>
      _$MembershipInactiveCopyWithImpl<MembershipInactive>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialMembershipState,
    required TResult Function(Membership membership) membershipActive,
    required TResult Function(String customerEmail, String? customerId)
        membershipInactive,
    required TResult Function() membershipLoading,
    required TResult Function(String errorMessage) membershipError,
  }) {
    return membershipInactive(customerEmail, customerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialMembershipState,
    TResult Function(Membership membership)? membershipActive,
    TResult Function(String customerEmail, String? customerId)?
        membershipInactive,
    TResult Function()? membershipLoading,
    TResult Function(String errorMessage)? membershipError,
    required TResult orElse(),
  }) {
    if (membershipInactive != null) {
      return membershipInactive(customerEmail, customerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMembershipState value)
        initialMembershipState,
    required TResult Function(MembershipActive value) membershipActive,
    required TResult Function(MembershipInactive value) membershipInactive,
    required TResult Function(MembershipLoading value) membershipLoading,
    required TResult Function(MembershipError value) membershipError,
  }) {
    return membershipInactive(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMembershipState value)? initialMembershipState,
    TResult Function(MembershipActive value)? membershipActive,
    TResult Function(MembershipInactive value)? membershipInactive,
    TResult Function(MembershipLoading value)? membershipLoading,
    TResult Function(MembershipError value)? membershipError,
    required TResult orElse(),
  }) {
    if (membershipInactive != null) {
      return membershipInactive(this);
    }
    return orElse();
  }
}

abstract class MembershipInactive implements MembershipState {
  const factory MembershipInactive(
      {required String customerEmail,
      String? customerId}) = _$MembershipInactive;

  String get customerEmail => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembershipInactiveCopyWith<MembershipInactive> get copyWith =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function() initialMembershipState,
    required TResult Function(Membership membership) membershipActive,
    required TResult Function(String customerEmail, String? customerId)
        membershipInactive,
    required TResult Function() membershipLoading,
    required TResult Function(String errorMessage) membershipError,
  }) {
    return membershipLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialMembershipState,
    TResult Function(Membership membership)? membershipActive,
    TResult Function(String customerEmail, String? customerId)?
        membershipInactive,
    TResult Function()? membershipLoading,
    TResult Function(String errorMessage)? membershipError,
    required TResult orElse(),
  }) {
    if (membershipLoading != null) {
      return membershipLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMembershipState value)
        initialMembershipState,
    required TResult Function(MembershipActive value) membershipActive,
    required TResult Function(MembershipInactive value) membershipInactive,
    required TResult Function(MembershipLoading value) membershipLoading,
    required TResult Function(MembershipError value) membershipError,
  }) {
    return membershipLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMembershipState value)? initialMembershipState,
    TResult Function(MembershipActive value)? membershipActive,
    TResult Function(MembershipInactive value)? membershipInactive,
    TResult Function(MembershipLoading value)? membershipLoading,
    TResult Function(MembershipError value)? membershipError,
    required TResult orElse(),
  }) {
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
    Object? errorMessage = freezed,
  }) {
    return _then(MembershipError(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MembershipError
    with DiagnosticableTreeMixin
    implements MembershipError {
  const _$MembershipError({required this.errorMessage});

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

  @JsonKey(ignore: true)
  @override
  $MembershipErrorCopyWith<MembershipError> get copyWith =>
      _$MembershipErrorCopyWithImpl<MembershipError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialMembershipState,
    required TResult Function(Membership membership) membershipActive,
    required TResult Function(String customerEmail, String? customerId)
        membershipInactive,
    required TResult Function() membershipLoading,
    required TResult Function(String errorMessage) membershipError,
  }) {
    return membershipError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialMembershipState,
    TResult Function(Membership membership)? membershipActive,
    TResult Function(String customerEmail, String? customerId)?
        membershipInactive,
    TResult Function()? membershipLoading,
    TResult Function(String errorMessage)? membershipError,
    required TResult orElse(),
  }) {
    if (membershipError != null) {
      return membershipError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialMembershipState value)
        initialMembershipState,
    required TResult Function(MembershipActive value) membershipActive,
    required TResult Function(MembershipInactive value) membershipInactive,
    required TResult Function(MembershipLoading value) membershipLoading,
    required TResult Function(MembershipError value) membershipError,
  }) {
    return membershipError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialMembershipState value)? initialMembershipState,
    TResult Function(MembershipActive value)? membershipActive,
    TResult Function(MembershipInactive value)? membershipInactive,
    TResult Function(MembershipLoading value)? membershipLoading,
    TResult Function(MembershipError value)? membershipError,
    required TResult orElse(),
  }) {
    if (membershipError != null) {
      return membershipError(this);
    }
    return orElse();
  }
}

abstract class MembershipError implements MembershipState {
  const factory MembershipError({required String errorMessage}) =
      _$MembershipError;

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembershipErrorCopyWith<MembershipError> get copyWith =>
      throw _privateConstructorUsedError;
}
