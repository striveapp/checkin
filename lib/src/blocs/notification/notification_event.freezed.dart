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
}

/// @nodoc
// ignore: unused_element
const $NotificationEvent = _$NotificationEventTearOff();

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNotifications(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNotifications(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNotifications(InitializeNotifications value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNotifications(InitializeNotifications value),
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
  TResult when<TResult extends Object>({
    @required TResult initializeNotifications(),
  }) {
    assert(initializeNotifications != null);
    return initializeNotifications();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNotifications(),
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
  }) {
    assert(initializeNotifications != null);
    return initializeNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNotifications(InitializeNotifications value),
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
