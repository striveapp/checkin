// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sessions_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SessionsEventTearOff {
  const _$SessionsEventTearOff();

// ignore: unused_element
  SessionsUpdated sessionsUpdated(
      {@required Membership membership, UserHistory userHistory}) {
    return SessionsUpdated(
      membership: membership,
      userHistory: userHistory,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SessionsEvent = _$SessionsEventTearOff();

/// @nodoc
mixin _$SessionsEvent {
  Membership get membership;
  UserHistory get userHistory;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result sessionsUpdated(Membership membership, UserHistory userHistory),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result sessionsUpdated(Membership membership, UserHistory userHistory),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result sessionsUpdated(SessionsUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result sessionsUpdated(SessionsUpdated value),
    @required Result orElse(),
  });

  $SessionsEventCopyWith<SessionsEvent> get copyWith;
}

/// @nodoc
abstract class $SessionsEventCopyWith<$Res> {
  factory $SessionsEventCopyWith(
          SessionsEvent value, $Res Function(SessionsEvent) then) =
      _$SessionsEventCopyWithImpl<$Res>;
  $Res call({Membership membership, UserHistory userHistory});

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
    Object membership = freezed,
    Object userHistory = freezed,
  }) {
    return _then(_value.copyWith(
      membership:
          membership == freezed ? _value.membership : membership as Membership,
      userHistory: userHistory == freezed
          ? _value.userHistory
          : userHistory as UserHistory,
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
abstract class $SessionsUpdatedCopyWith<$Res>
    implements $SessionsEventCopyWith<$Res> {
  factory $SessionsUpdatedCopyWith(
          SessionsUpdated value, $Res Function(SessionsUpdated) then) =
      _$SessionsUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({Membership membership, UserHistory userHistory});

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
    Object membership = freezed,
    Object userHistory = freezed,
  }) {
    return _then(SessionsUpdated(
      membership:
          membership == freezed ? _value.membership : membership as Membership,
      userHistory: userHistory == freezed
          ? _value.userHistory
          : userHistory as UserHistory,
    ));
  }
}

/// @nodoc
class _$SessionsUpdated
    with DiagnosticableTreeMixin
    implements SessionsUpdated {
  const _$SessionsUpdated({@required this.membership, this.userHistory})
      : assert(membership != null);

  @override
  final Membership membership;
  @override
  final UserHistory userHistory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsEvent.sessionsUpdated(membership: $membership, userHistory: $userHistory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsEvent.sessionsUpdated'))
      ..add(DiagnosticsProperty('membership', membership))
      ..add(DiagnosticsProperty('userHistory', userHistory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SessionsUpdated &&
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

  @override
  $SessionsUpdatedCopyWith<SessionsUpdated> get copyWith =>
      _$SessionsUpdatedCopyWithImpl<SessionsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result sessionsUpdated(Membership membership, UserHistory userHistory),
  }) {
    assert(sessionsUpdated != null);
    return sessionsUpdated(membership, userHistory);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result sessionsUpdated(Membership membership, UserHistory userHistory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sessionsUpdated != null) {
      return sessionsUpdated(membership, userHistory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result sessionsUpdated(SessionsUpdated value),
  }) {
    assert(sessionsUpdated != null);
    return sessionsUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result sessionsUpdated(SessionsUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sessionsUpdated != null) {
      return sessionsUpdated(this);
    }
    return orElse();
  }
}

abstract class SessionsUpdated implements SessionsEvent {
  const factory SessionsUpdated(
      {@required Membership membership,
      UserHistory userHistory}) = _$SessionsUpdated;

  @override
  Membership get membership;
  @override
  UserHistory get userHistory;
  @override
  $SessionsUpdatedCopyWith<SessionsUpdated> get copyWith;
}
