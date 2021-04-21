// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notification_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationEventTearOff {
  const _$NotificationEventTearOff();

// ignore: unused_element
  InitializeNotifications initializeNotifications() {
    return const InitializeNotifications();
  }

// ignore: unused_element
  UpdateToken updateToken({String loggedUserEmail}) {
    return UpdateToken(
      loggedUserEmail: loggedUserEmail,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationEvent = _$NotificationEventTearOff();

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNotifications(),
    @required TResult updateToken(String loggedUserEmail),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNotifications(),
    TResult updateToken(String loggedUserEmail),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNotifications(InitializeNotifications value),
    @required TResult updateToken(UpdateToken value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNotifications(InitializeNotifications value),
    TResult updateToken(UpdateToken value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res> implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  final NotificationEvent _value;
  // ignore: unused_field
  final $Res Function(NotificationEvent) _then;
}

/// @nodoc
abstract class $InitializeNotificationsCopyWith<$Res> {
  factory $InitializeNotificationsCopyWith(
          InitializeNotifications value, $Res Function(InitializeNotifications) then) =
      _$InitializeNotificationsCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeNotificationsCopyWithImpl<$Res> extends _$NotificationEventCopyWithImpl<$Res>
    implements $InitializeNotificationsCopyWith<$Res> {
  _$InitializeNotificationsCopyWithImpl(
      InitializeNotifications _value, $Res Function(InitializeNotifications) _then)
      : super(_value, (v) => _then(v as InitializeNotifications));

  @override
  InitializeNotifications get _value => super._value as InitializeNotifications;
}

/// @nodoc
class _$InitializeNotifications with DiagnosticableTreeMixin implements InitializeNotifications {
  const _$InitializeNotifications();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.initializeNotifications()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'NotificationEvent.initializeNotifications'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeNotifications);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNotifications(),
    @required TResult updateToken(String loggedUserEmail),
  }) {
    assert(initializeNotifications != null);
    assert(updateToken != null);
    return initializeNotifications();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNotifications(),
    TResult updateToken(String loggedUserEmail),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeNotifications != null) {
      return initializeNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNotifications(InitializeNotifications value),
    @required TResult updateToken(UpdateToken value),
  }) {
    assert(initializeNotifications != null);
    assert(updateToken != null);
    return initializeNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNotifications(InitializeNotifications value),
    TResult updateToken(UpdateToken value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeNotifications != null) {
      return initializeNotifications(this);
    }
    return orElse();
  }
}

abstract class InitializeNotifications implements NotificationEvent {
  const factory InitializeNotifications() = _$InitializeNotifications;
}

/// @nodoc
abstract class $UpdateTokenCopyWith<$Res> {
  factory $UpdateTokenCopyWith(UpdateToken value, $Res Function(UpdateToken) then) =
      _$UpdateTokenCopyWithImpl<$Res>;
  $Res call({String loggedUserEmail});
}

/// @nodoc
class _$UpdateTokenCopyWithImpl<$Res> extends _$NotificationEventCopyWithImpl<$Res>
    implements $UpdateTokenCopyWith<$Res> {
  _$UpdateTokenCopyWithImpl(UpdateToken _value, $Res Function(UpdateToken) _then)
      : super(_value, (v) => _then(v as UpdateToken));

  @override
  UpdateToken get _value => super._value as UpdateToken;

  @override
  $Res call({
    Object loggedUserEmail = freezed,
  }) {
    return _then(UpdateToken(
      loggedUserEmail:
          loggedUserEmail == freezed ? _value.loggedUserEmail : loggedUserEmail as String,
    ));
  }
}

/// @nodoc
class _$UpdateToken with DiagnosticableTreeMixin implements UpdateToken {
  const _$UpdateToken({this.loggedUserEmail});

  @override
  final String loggedUserEmail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.updateToken(loggedUserEmail: $loggedUserEmail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationEvent.updateToken'))
      ..add(DiagnosticsProperty('loggedUserEmail', loggedUserEmail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateToken &&
            (identical(other.loggedUserEmail, loggedUserEmail) ||
                const DeepCollectionEquality().equals(other.loggedUserEmail, loggedUserEmail)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(loggedUserEmail);

  @JsonKey(ignore: true)
  @override
  $UpdateTokenCopyWith<UpdateToken> get copyWith =>
      _$UpdateTokenCopyWithImpl<UpdateToken>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNotifications(),
    @required TResult updateToken(String loggedUserEmail),
  }) {
    assert(initializeNotifications != null);
    assert(updateToken != null);
    return updateToken(loggedUserEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNotifications(),
    TResult updateToken(String loggedUserEmail),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateToken != null) {
      return updateToken(loggedUserEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNotifications(InitializeNotifications value),
    @required TResult updateToken(UpdateToken value),
  }) {
    assert(initializeNotifications != null);
    assert(updateToken != null);
    return updateToken(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNotifications(InitializeNotifications value),
    TResult updateToken(UpdateToken value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateToken != null) {
      return updateToken(this);
    }
    return orElse();
  }
}

abstract class UpdateToken implements NotificationEvent {
  const factory UpdateToken({String loggedUserEmail}) = _$UpdateToken;

  String get loggedUserEmail;
  @JsonKey(ignore: true)
  $UpdateTokenCopyWith<UpdateToken> get copyWith;
}
