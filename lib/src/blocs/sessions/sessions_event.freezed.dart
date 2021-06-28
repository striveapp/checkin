// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sessions_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SessionsEventTearOff {
  const _$SessionsEventTearOff();

  SessionsUpdated sessionsUpdated({required Membership membership}) {
    return SessionsUpdated(
      membership: membership,
    );
  }

  SessionsUpdatedWithHistory sessionsUpdatedWithHistory(
      {required Membership membership, required UserHistory userHistory}) {
    return SessionsUpdatedWithHistory(
      membership: membership,
      userHistory: userHistory,
    );
  }
}

/// @nodoc
const $SessionsEvent = _$SessionsEventTearOff();

/// @nodoc
mixin _$SessionsEvent {
  Membership get membership => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Membership membership) sessionsUpdated,
    required TResult Function(Membership membership, UserHistory userHistory)
        sessionsUpdatedWithHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Membership membership)? sessionsUpdated,
    TResult Function(Membership membership, UserHistory userHistory)?
        sessionsUpdatedWithHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionsUpdated value) sessionsUpdated,
    required TResult Function(SessionsUpdatedWithHistory value)
        sessionsUpdatedWithHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionsUpdated value)? sessionsUpdated,
    TResult Function(SessionsUpdatedWithHistory value)?
        sessionsUpdatedWithHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionsEventCopyWith<SessionsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsEventCopyWith<$Res> {
  factory $SessionsEventCopyWith(
          SessionsEvent value, $Res Function(SessionsEvent) then) =
      _$SessionsEventCopyWithImpl<$Res>;
  $Res call({Membership membership});

  $MembershipCopyWith<$Res> get membership;
}

/// @nodoc
class _$SessionsEventCopyWithImpl<$Res>
    implements $SessionsEventCopyWith<$Res> {
  _$SessionsEventCopyWithImpl(this._value, this._then);

  final SessionsEvent _value;
  // ignore: unused_field
  final $Res Function(SessionsEvent) _then;

  @override
  $Res call({
    Object? membership = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class $SessionsUpdatedCopyWith<$Res>
    implements $SessionsEventCopyWith<$Res> {
  factory $SessionsUpdatedCopyWith(
          SessionsUpdated value, $Res Function(SessionsUpdated) then) =
      _$SessionsUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({Membership membership});

  @override
  $MembershipCopyWith<$Res> get membership;
}

/// @nodoc
class _$SessionsUpdatedCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res>
    implements $SessionsUpdatedCopyWith<$Res> {
  _$SessionsUpdatedCopyWithImpl(
      SessionsUpdated _value, $Res Function(SessionsUpdated) _then)
      : super(_value, (v) => _then(v as SessionsUpdated));

  @override
  SessionsUpdated get _value => super._value as SessionsUpdated;

  @override
  $Res call({
    Object? membership = freezed,
  }) {
    return _then(SessionsUpdated(
      membership: membership == freezed
          ? _value.membership
          : membership // ignore: cast_nullable_to_non_nullable
              as Membership,
    ));
  }
}

/// @nodoc

class _$SessionsUpdated
    with DiagnosticableTreeMixin
    implements SessionsUpdated {
  const _$SessionsUpdated({required this.membership});

  @override
  final Membership membership;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsEvent.sessionsUpdated(membership: $membership)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsEvent.sessionsUpdated'))
      ..add(DiagnosticsProperty('membership', membership));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionsUpdated &&
            (identical(other.membership, membership) ||
                const DeepCollectionEquality()
                    .equals(other.membership, membership)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(membership);

  @JsonKey(ignore: true)
  @override
  $SessionsUpdatedCopyWith<SessionsUpdated> get copyWith =>
      _$SessionsUpdatedCopyWithImpl<SessionsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Membership membership) sessionsUpdated,
    required TResult Function(Membership membership, UserHistory userHistory)
        sessionsUpdatedWithHistory,
  }) {
    return sessionsUpdated(membership);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Membership membership)? sessionsUpdated,
    TResult Function(Membership membership, UserHistory userHistory)?
        sessionsUpdatedWithHistory,
    required TResult orElse(),
  }) {
    if (sessionsUpdated != null) {
      return sessionsUpdated(membership);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionsUpdated value) sessionsUpdated,
    required TResult Function(SessionsUpdatedWithHistory value)
        sessionsUpdatedWithHistory,
  }) {
    return sessionsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionsUpdated value)? sessionsUpdated,
    TResult Function(SessionsUpdatedWithHistory value)?
        sessionsUpdatedWithHistory,
    required TResult orElse(),
  }) {
    if (sessionsUpdated != null) {
      return sessionsUpdated(this);
    }
    return orElse();
  }
}

abstract class SessionsUpdated implements SessionsEvent {
  const factory SessionsUpdated({required Membership membership}) =
      _$SessionsUpdated;

  @override
  Membership get membership => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SessionsUpdatedCopyWith<SessionsUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsUpdatedWithHistoryCopyWith<$Res>
    implements $SessionsEventCopyWith<$Res> {
  factory $SessionsUpdatedWithHistoryCopyWith(SessionsUpdatedWithHistory value,
          $Res Function(SessionsUpdatedWithHistory) then) =
      _$SessionsUpdatedWithHistoryCopyWithImpl<$Res>;
  @override
  $Res call({Membership membership, UserHistory userHistory});

  @override
  $MembershipCopyWith<$Res> get membership;
}

/// @nodoc
class _$SessionsUpdatedWithHistoryCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res>
    implements $SessionsUpdatedWithHistoryCopyWith<$Res> {
  _$SessionsUpdatedWithHistoryCopyWithImpl(SessionsUpdatedWithHistory _value,
      $Res Function(SessionsUpdatedWithHistory) _then)
      : super(_value, (v) => _then(v as SessionsUpdatedWithHistory));

  @override
  SessionsUpdatedWithHistory get _value =>
      super._value as SessionsUpdatedWithHistory;

  @override
  $Res call({
    Object? membership = freezed,
    Object? userHistory = freezed,
  }) {
    return _then(SessionsUpdatedWithHistory(
      membership: membership == freezed
          ? _value.membership
          : membership // ignore: cast_nullable_to_non_nullable
              as Membership,
      userHistory: userHistory == freezed
          ? _value.userHistory
          : userHistory // ignore: cast_nullable_to_non_nullable
              as UserHistory,
    ));
  }
}

/// @nodoc

class _$SessionsUpdatedWithHistory
    with DiagnosticableTreeMixin
    implements SessionsUpdatedWithHistory {
  const _$SessionsUpdatedWithHistory(
      {required this.membership, required this.userHistory});

  @override
  final Membership membership;
  @override
  final UserHistory userHistory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsEvent.sessionsUpdatedWithHistory(membership: $membership, userHistory: $userHistory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SessionsEvent.sessionsUpdatedWithHistory'))
      ..add(DiagnosticsProperty('membership', membership))
      ..add(DiagnosticsProperty('userHistory', userHistory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionsUpdatedWithHistory &&
            (identical(other.membership, membership) ||
                const DeepCollectionEquality()
                    .equals(other.membership, membership)) &&
            (identical(other.userHistory, userHistory) ||
                const DeepCollectionEquality()
                    .equals(other.userHistory, userHistory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(membership) ^
      const DeepCollectionEquality().hash(userHistory);

  @JsonKey(ignore: true)
  @override
  $SessionsUpdatedWithHistoryCopyWith<SessionsUpdatedWithHistory>
      get copyWith =>
          _$SessionsUpdatedWithHistoryCopyWithImpl<SessionsUpdatedWithHistory>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Membership membership) sessionsUpdated,
    required TResult Function(Membership membership, UserHistory userHistory)
        sessionsUpdatedWithHistory,
  }) {
    return sessionsUpdatedWithHistory(membership, userHistory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Membership membership)? sessionsUpdated,
    TResult Function(Membership membership, UserHistory userHistory)?
        sessionsUpdatedWithHistory,
    required TResult orElse(),
  }) {
    if (sessionsUpdatedWithHistory != null) {
      return sessionsUpdatedWithHistory(membership, userHistory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionsUpdated value) sessionsUpdated,
    required TResult Function(SessionsUpdatedWithHistory value)
        sessionsUpdatedWithHistory,
  }) {
    return sessionsUpdatedWithHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionsUpdated value)? sessionsUpdated,
    TResult Function(SessionsUpdatedWithHistory value)?
        sessionsUpdatedWithHistory,
    required TResult orElse(),
  }) {
    if (sessionsUpdatedWithHistory != null) {
      return sessionsUpdatedWithHistory(this);
    }
    return orElse();
  }
}

abstract class SessionsUpdatedWithHistory implements SessionsEvent {
  const factory SessionsUpdatedWithHistory(
      {required Membership membership,
      required UserHistory userHistory}) = _$SessionsUpdatedWithHistory;

  @override
  Membership get membership => throw _privateConstructorUsedError;
  UserHistory get userHistory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SessionsUpdatedWithHistoryCopyWith<SessionsUpdatedWithHistory>
      get copyWith => throw _privateConstructorUsedError;
}
