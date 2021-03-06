// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationEventTearOff {
  const _$NotificationEventTearOff();

  InitializeNotifications initializeNotifications() {
    return const InitializeNotifications();
  }

  UpdateToken updateToken({String? loggedUserEmail}) {
    return UpdateToken(
      loggedUserEmail: loggedUserEmail,
    );
  }

  MessageOpenedApp messageOpenedApp({Notification? notification}) {
    return MessageOpenedApp(
      notification: notification,
    );
  }

  Message message({Notification? notification}) {
    return Message(
      notification: notification,
    );
  }
}

/// @nodoc
const $NotificationEvent = _$NotificationEventTearOff();

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNotifications,
    required TResult Function(String? loggedUserEmail) updateToken,
    required TResult Function(Notification? notification) messageOpenedApp,
    required TResult Function(Notification? notification) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNotifications,
    TResult Function(String? loggedUserEmail)? updateToken,
    TResult Function(Notification? notification)? messageOpenedApp,
    TResult Function(Notification? notification)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNotifications value)
        initializeNotifications,
    required TResult Function(UpdateToken value) updateToken,
    required TResult Function(MessageOpenedApp value) messageOpenedApp,
    required TResult Function(Message value) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNotifications value)? initializeNotifications,
    TResult Function(UpdateToken value)? updateToken,
    TResult Function(MessageOpenedApp value)? messageOpenedApp,
    TResult Function(Message value)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  final NotificationEvent _value;
  // ignore: unused_field
  final $Res Function(NotificationEvent) _then;
}

/// @nodoc
abstract class $InitializeNotificationsCopyWith<$Res> {
  factory $InitializeNotificationsCopyWith(InitializeNotifications value,
          $Res Function(InitializeNotifications) then) =
      _$InitializeNotificationsCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeNotificationsCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements $InitializeNotificationsCopyWith<$Res> {
  _$InitializeNotificationsCopyWithImpl(InitializeNotifications _value,
      $Res Function(InitializeNotifications) _then)
      : super(_value, (v) => _then(v as InitializeNotifications));

  @override
  InitializeNotifications get _value => super._value as InitializeNotifications;
}

/// @nodoc

class _$InitializeNotifications
    with DiagnosticableTreeMixin
    implements InitializeNotifications {
  const _$InitializeNotifications();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.initializeNotifications()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'NotificationEvent.initializeNotifications'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeNotifications);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNotifications,
    required TResult Function(String? loggedUserEmail) updateToken,
    required TResult Function(Notification? notification) messageOpenedApp,
    required TResult Function(Notification? notification) message,
  }) {
    return initializeNotifications();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNotifications,
    TResult Function(String? loggedUserEmail)? updateToken,
    TResult Function(Notification? notification)? messageOpenedApp,
    TResult Function(Notification? notification)? message,
    required TResult orElse(),
  }) {
    if (initializeNotifications != null) {
      return initializeNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNotifications value)
        initializeNotifications,
    required TResult Function(UpdateToken value) updateToken,
    required TResult Function(MessageOpenedApp value) messageOpenedApp,
    required TResult Function(Message value) message,
  }) {
    return initializeNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNotifications value)? initializeNotifications,
    TResult Function(UpdateToken value)? updateToken,
    TResult Function(MessageOpenedApp value)? messageOpenedApp,
    TResult Function(Message value)? message,
    required TResult orElse(),
  }) {
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
  factory $UpdateTokenCopyWith(
          UpdateToken value, $Res Function(UpdateToken) then) =
      _$UpdateTokenCopyWithImpl<$Res>;
  $Res call({String? loggedUserEmail});
}

/// @nodoc
class _$UpdateTokenCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements $UpdateTokenCopyWith<$Res> {
  _$UpdateTokenCopyWithImpl(
      UpdateToken _value, $Res Function(UpdateToken) _then)
      : super(_value, (v) => _then(v as UpdateToken));

  @override
  UpdateToken get _value => super._value as UpdateToken;

  @override
  $Res call({
    Object? loggedUserEmail = freezed,
  }) {
    return _then(UpdateToken(
      loggedUserEmail: loggedUserEmail == freezed
          ? _value.loggedUserEmail
          : loggedUserEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateToken with DiagnosticableTreeMixin implements UpdateToken {
  const _$UpdateToken({this.loggedUserEmail});

  @override
  final String? loggedUserEmail;

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
                const DeepCollectionEquality()
                    .equals(other.loggedUserEmail, loggedUserEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loggedUserEmail);

  @JsonKey(ignore: true)
  @override
  $UpdateTokenCopyWith<UpdateToken> get copyWith =>
      _$UpdateTokenCopyWithImpl<UpdateToken>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNotifications,
    required TResult Function(String? loggedUserEmail) updateToken,
    required TResult Function(Notification? notification) messageOpenedApp,
    required TResult Function(Notification? notification) message,
  }) {
    return updateToken(loggedUserEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNotifications,
    TResult Function(String? loggedUserEmail)? updateToken,
    TResult Function(Notification? notification)? messageOpenedApp,
    TResult Function(Notification? notification)? message,
    required TResult orElse(),
  }) {
    if (updateToken != null) {
      return updateToken(loggedUserEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNotifications value)
        initializeNotifications,
    required TResult Function(UpdateToken value) updateToken,
    required TResult Function(MessageOpenedApp value) messageOpenedApp,
    required TResult Function(Message value) message,
  }) {
    return updateToken(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNotifications value)? initializeNotifications,
    TResult Function(UpdateToken value)? updateToken,
    TResult Function(MessageOpenedApp value)? messageOpenedApp,
    TResult Function(Message value)? message,
    required TResult orElse(),
  }) {
    if (updateToken != null) {
      return updateToken(this);
    }
    return orElse();
  }
}

abstract class UpdateToken implements NotificationEvent {
  const factory UpdateToken({String? loggedUserEmail}) = _$UpdateToken;

  String? get loggedUserEmail => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTokenCopyWith<UpdateToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageOpenedAppCopyWith<$Res> {
  factory $MessageOpenedAppCopyWith(
          MessageOpenedApp value, $Res Function(MessageOpenedApp) then) =
      _$MessageOpenedAppCopyWithImpl<$Res>;
  $Res call({Notification? notification});

  $NotificationCopyWith<$Res>? get notification;
}

/// @nodoc
class _$MessageOpenedAppCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements $MessageOpenedAppCopyWith<$Res> {
  _$MessageOpenedAppCopyWithImpl(
      MessageOpenedApp _value, $Res Function(MessageOpenedApp) _then)
      : super(_value, (v) => _then(v as MessageOpenedApp));

  @override
  MessageOpenedApp get _value => super._value as MessageOpenedApp;

  @override
  $Res call({
    Object? notification = freezed,
  }) {
    return _then(MessageOpenedApp(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Notification?,
    ));
  }

  @override
  $NotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $NotificationCopyWith<$Res>(_value.notification!, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }
}

/// @nodoc

class _$MessageOpenedApp
    with DiagnosticableTreeMixin
    implements MessageOpenedApp {
  const _$MessageOpenedApp({this.notification});

  @override
  final Notification? notification;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.messageOpenedApp(notification: $notification)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationEvent.messageOpenedApp'))
      ..add(DiagnosticsProperty('notification', notification));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageOpenedApp &&
            (identical(other.notification, notification) ||
                const DeepCollectionEquality()
                    .equals(other.notification, notification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(notification);

  @JsonKey(ignore: true)
  @override
  $MessageOpenedAppCopyWith<MessageOpenedApp> get copyWith =>
      _$MessageOpenedAppCopyWithImpl<MessageOpenedApp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNotifications,
    required TResult Function(String? loggedUserEmail) updateToken,
    required TResult Function(Notification? notification) messageOpenedApp,
    required TResult Function(Notification? notification) message,
  }) {
    return messageOpenedApp(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNotifications,
    TResult Function(String? loggedUserEmail)? updateToken,
    TResult Function(Notification? notification)? messageOpenedApp,
    TResult Function(Notification? notification)? message,
    required TResult orElse(),
  }) {
    if (messageOpenedApp != null) {
      return messageOpenedApp(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNotifications value)
        initializeNotifications,
    required TResult Function(UpdateToken value) updateToken,
    required TResult Function(MessageOpenedApp value) messageOpenedApp,
    required TResult Function(Message value) message,
  }) {
    return messageOpenedApp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNotifications value)? initializeNotifications,
    TResult Function(UpdateToken value)? updateToken,
    TResult Function(MessageOpenedApp value)? messageOpenedApp,
    TResult Function(Message value)? message,
    required TResult orElse(),
  }) {
    if (messageOpenedApp != null) {
      return messageOpenedApp(this);
    }
    return orElse();
  }
}

abstract class MessageOpenedApp implements NotificationEvent {
  const factory MessageOpenedApp({Notification? notification}) =
      _$MessageOpenedApp;

  Notification? get notification => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageOpenedAppCopyWith<MessageOpenedApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call({Notification? notification});

  $NotificationCopyWith<$Res>? get notification;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> extends _$NotificationEventCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(Message _value, $Res Function(Message) _then)
      : super(_value, (v) => _then(v as Message));

  @override
  Message get _value => super._value as Message;

  @override
  $Res call({
    Object? notification = freezed,
  }) {
    return _then(Message(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Notification?,
    ));
  }

  @override
  $NotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $NotificationCopyWith<$Res>(_value.notification!, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }
}

/// @nodoc

class _$Message with DiagnosticableTreeMixin implements Message {
  const _$Message({this.notification});

  @override
  final Notification? notification;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.message(notification: $notification)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationEvent.message'))
      ..add(DiagnosticsProperty('notification', notification));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Message &&
            (identical(other.notification, notification) ||
                const DeepCollectionEquality()
                    .equals(other.notification, notification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(notification);

  @JsonKey(ignore: true)
  @override
  $MessageCopyWith<Message> get copyWith =>
      _$MessageCopyWithImpl<Message>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNotifications,
    required TResult Function(String? loggedUserEmail) updateToken,
    required TResult Function(Notification? notification) messageOpenedApp,
    required TResult Function(Notification? notification) message,
  }) {
    return message(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNotifications,
    TResult Function(String? loggedUserEmail)? updateToken,
    TResult Function(Notification? notification)? messageOpenedApp,
    TResult Function(Notification? notification)? message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNotifications value)
        initializeNotifications,
    required TResult Function(UpdateToken value) updateToken,
    required TResult Function(MessageOpenedApp value) messageOpenedApp,
    required TResult Function(Message value) message,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNotifications value)? initializeNotifications,
    TResult Function(UpdateToken value)? updateToken,
    TResult Function(MessageOpenedApp value)? messageOpenedApp,
    TResult Function(Message value)? message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class Message implements NotificationEvent {
  const factory Message({Notification? notification}) = _$Message;

  Notification? get notification => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}
