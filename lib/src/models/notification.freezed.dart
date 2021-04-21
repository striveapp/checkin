// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationTearOff {
  const _$NotificationTearOff();

// ignore: unused_element
  BasicNotification basicNotification({@required String title, @required String body}) {
    return BasicNotification(
      title: title,
      body: body,
    );
  }

// ignore: unused_element
  RoutableNotification routableNotification({@required String title, @required String path}) {
    return RoutableNotification(
      title: title,
      path: path,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Notification = _$NotificationTearOff();

/// @nodoc
mixin _$Notification {
  String get title;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult basicNotification(String title, String body),
    @required TResult routableNotification(String title, String path),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult basicNotification(String title, String body),
    TResult routableNotification(String title, String path),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult basicNotification(BasicNotification value),
    @required TResult routableNotification(RoutableNotification value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult basicNotification(BasicNotification value),
    TResult routableNotification(RoutableNotification value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  final Notification _value;
  // ignore: unused_field
  final $Res Function(Notification) _then;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

/// @nodoc
abstract class $BasicNotificationCopyWith<$Res> implements $NotificationCopyWith<$Res> {
  factory $BasicNotificationCopyWith(
          BasicNotification value, $Res Function(BasicNotification) then) =
      _$BasicNotificationCopyWithImpl<$Res>;
  @override
  $Res call({String title, String body});
}

/// @nodoc
class _$BasicNotificationCopyWithImpl<$Res> extends _$NotificationCopyWithImpl<$Res>
    implements $BasicNotificationCopyWith<$Res> {
  _$BasicNotificationCopyWithImpl(BasicNotification _value, $Res Function(BasicNotification) _then)
      : super(_value, (v) => _then(v as BasicNotification));

  @override
  BasicNotification get _value => super._value as BasicNotification;

  @override
  $Res call({
    Object title = freezed,
    Object body = freezed,
  }) {
    return _then(BasicNotification(
      title: title == freezed ? _value.title : title as String,
      body: body == freezed ? _value.body : body as String,
    ));
  }
}

/// @nodoc
class _$BasicNotification with DiagnosticableTreeMixin implements BasicNotification {
  _$BasicNotification({@required this.title, @required this.body})
      : assert(title != null),
        assert(body != null);

  @override
  final String title;
  @override
  final String body;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notification.basicNotification(title: $title, body: $body)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notification.basicNotification'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BasicNotification &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body);

  @JsonKey(ignore: true)
  @override
  $BasicNotificationCopyWith<BasicNotification> get copyWith =>
      _$BasicNotificationCopyWithImpl<BasicNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult basicNotification(String title, String body),
    @required TResult routableNotification(String title, String path),
  }) {
    assert(basicNotification != null);
    assert(routableNotification != null);
    return basicNotification(title, body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult basicNotification(String title, String body),
    TResult routableNotification(String title, String path),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (basicNotification != null) {
      return basicNotification(title, body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult basicNotification(BasicNotification value),
    @required TResult routableNotification(RoutableNotification value),
  }) {
    assert(basicNotification != null);
    assert(routableNotification != null);
    return basicNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult basicNotification(BasicNotification value),
    TResult routableNotification(RoutableNotification value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (basicNotification != null) {
      return basicNotification(this);
    }
    return orElse();
  }
}

abstract class BasicNotification implements Notification {
  factory BasicNotification({@required String title, @required String body}) = _$BasicNotification;

  @override
  String get title;
  String get body;
  @override
  @JsonKey(ignore: true)
  $BasicNotificationCopyWith<BasicNotification> get copyWith;
}

/// @nodoc
abstract class $RoutableNotificationCopyWith<$Res> implements $NotificationCopyWith<$Res> {
  factory $RoutableNotificationCopyWith(
          RoutableNotification value, $Res Function(RoutableNotification) then) =
      _$RoutableNotificationCopyWithImpl<$Res>;
  @override
  $Res call({String title, String path});
}

/// @nodoc
class _$RoutableNotificationCopyWithImpl<$Res> extends _$NotificationCopyWithImpl<$Res>
    implements $RoutableNotificationCopyWith<$Res> {
  _$RoutableNotificationCopyWithImpl(
      RoutableNotification _value, $Res Function(RoutableNotification) _then)
      : super(_value, (v) => _then(v as RoutableNotification));

  @override
  RoutableNotification get _value => super._value as RoutableNotification;

  @override
  $Res call({
    Object title = freezed,
    Object path = freezed,
  }) {
    return _then(RoutableNotification(
      title: title == freezed ? _value.title : title as String,
      path: path == freezed ? _value.path : path as String,
    ));
  }
}

/// @nodoc
class _$RoutableNotification with DiagnosticableTreeMixin implements RoutableNotification {
  _$RoutableNotification({@required this.title, @required this.path})
      : assert(title != null),
        assert(path != null);

  @override
  final String title;
  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notification.routableNotification(title: $title, path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notification.routableNotification'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RoutableNotification &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(path);

  @JsonKey(ignore: true)
  @override
  $RoutableNotificationCopyWith<RoutableNotification> get copyWith =>
      _$RoutableNotificationCopyWithImpl<RoutableNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult basicNotification(String title, String body),
    @required TResult routableNotification(String title, String path),
  }) {
    assert(basicNotification != null);
    assert(routableNotification != null);
    return routableNotification(title, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult basicNotification(String title, String body),
    TResult routableNotification(String title, String path),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (routableNotification != null) {
      return routableNotification(title, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult basicNotification(BasicNotification value),
    @required TResult routableNotification(RoutableNotification value),
  }) {
    assert(basicNotification != null);
    assert(routableNotification != null);
    return routableNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult basicNotification(BasicNotification value),
    TResult routableNotification(RoutableNotification value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (routableNotification != null) {
      return routableNotification(this);
    }
    return orElse();
  }
}

abstract class RoutableNotification implements Notification {
  factory RoutableNotification({@required String title, @required String path}) =
      _$RoutableNotification;

  @override
  String get title;
  String get path;
  @override
  @JsonKey(ignore: true)
  $RoutableNotificationCopyWith<RoutableNotification> get copyWith;
}
