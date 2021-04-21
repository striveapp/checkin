// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationStateTearOff {
  const _$NotificationStateTearOff();

// ignore: unused_element
  NotificationInitial notificationInitial() {
    return const NotificationInitial();
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationState = _$NotificationStateTearOff();

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult notificationInitial(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult notificationInitial(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult notificationInitial(NotificationInitial value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult notificationInitial(NotificationInitial value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  final NotificationState _value;
  // ignore: unused_field
  final $Res Function(NotificationState) _then;
}

/// @nodoc
abstract class $NotificationInitialCopyWith<$Res> {
  factory $NotificationInitialCopyWith(
          NotificationInitial value, $Res Function(NotificationInitial) then) =
      _$NotificationInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationInitialCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationInitialCopyWith<$Res> {
  _$NotificationInitialCopyWithImpl(
      NotificationInitial _value, $Res Function(NotificationInitial) _then)
      : super(_value, (v) => _then(v as NotificationInitial));

  @override
  NotificationInitial get _value => super._value as NotificationInitial;
}

/// @nodoc
class _$NotificationInitial
    with DiagnosticableTreeMixin
    implements NotificationInitial {
  const _$NotificationInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState.notificationInitial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'NotificationState.notificationInitial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotificationInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult notificationInitial(),
  }) {
    assert(notificationInitial != null);
    return notificationInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult notificationInitial(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (notificationInitial != null) {
      return notificationInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult notificationInitial(NotificationInitial value),
  }) {
    assert(notificationInitial != null);
    return notificationInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult notificationInitial(NotificationInitial value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (notificationInitial != null) {
      return notificationInitial(this);
    }
    return orElse();
  }
}

abstract class NotificationInitial implements NotificationState {
  const factory NotificationInitial() = _$NotificationInitial;
}
