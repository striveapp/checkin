// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationTearOff {
  const _$NotificationTearOff();

  BasicNotification basicNotification(
      {required String title,
      List<String>? titleLocArgs,
      required String body,
      List<String>? bodyLocArgs}) {
    return BasicNotification(
      title: title,
      titleLocArgs: titleLocArgs,
      body: body,
      bodyLocArgs: bodyLocArgs,
    );
  }

  RoutableNotification routableNotification(
      {required String title, required String path}) {
    return RoutableNotification(
      title: title,
      path: path,
    );
  }
}

/// @nodoc
const $Notification = _$NotificationTearOff();

/// @nodoc
mixin _$Notification {
  String get title => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, List<String>? titleLocArgs,
            String body, List<String>? bodyLocArgs)
        basicNotification,
    required TResult Function(String title, String path) routableNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, List<String>? titleLocArgs, String body,
            List<String>? bodyLocArgs)?
        basicNotification,
    TResult Function(String title, String path)? routableNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicNotification value) basicNotification,
    required TResult Function(RoutableNotification value) routableNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicNotification value)? basicNotification,
    TResult Function(RoutableNotification value)? routableNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
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
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $BasicNotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory $BasicNotificationCopyWith(
          BasicNotification value, $Res Function(BasicNotification) then) =
      _$BasicNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      List<String>? titleLocArgs,
      String body,
      List<String>? bodyLocArgs});
}

/// @nodoc
class _$BasicNotificationCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res>
    implements $BasicNotificationCopyWith<$Res> {
  _$BasicNotificationCopyWithImpl(
      BasicNotification _value, $Res Function(BasicNotification) _then)
      : super(_value, (v) => _then(v as BasicNotification));

  @override
  BasicNotification get _value => super._value as BasicNotification;

  @override
  $Res call({
    Object? title = freezed,
    Object? titleLocArgs = freezed,
    Object? body = freezed,
    Object? bodyLocArgs = freezed,
  }) {
    return _then(BasicNotification(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLocArgs: titleLocArgs == freezed
          ? _value.titleLocArgs
          : titleLocArgs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      bodyLocArgs: bodyLocArgs == freezed
          ? _value.bodyLocArgs
          : bodyLocArgs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$BasicNotification
    with DiagnosticableTreeMixin
    implements BasicNotification {
  _$BasicNotification(
      {required this.title,
      this.titleLocArgs,
      required this.body,
      this.bodyLocArgs});

  @override
  final String title;
  @override
  final List<String>? titleLocArgs;
  @override
  final String body;
  @override
  final List<String>? bodyLocArgs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notification.basicNotification(title: $title, titleLocArgs: $titleLocArgs, body: $body, bodyLocArgs: $bodyLocArgs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notification.basicNotification'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('titleLocArgs', titleLocArgs))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('bodyLocArgs', bodyLocArgs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BasicNotification &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.titleLocArgs, titleLocArgs) ||
                const DeepCollectionEquality()
                    .equals(other.titleLocArgs, titleLocArgs)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.bodyLocArgs, bodyLocArgs) ||
                const DeepCollectionEquality()
                    .equals(other.bodyLocArgs, bodyLocArgs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(titleLocArgs) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(bodyLocArgs);

  @JsonKey(ignore: true)
  @override
  $BasicNotificationCopyWith<BasicNotification> get copyWith =>
      _$BasicNotificationCopyWithImpl<BasicNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, List<String>? titleLocArgs,
            String body, List<String>? bodyLocArgs)
        basicNotification,
    required TResult Function(String title, String path) routableNotification,
  }) {
    return basicNotification(title, titleLocArgs, body, bodyLocArgs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, List<String>? titleLocArgs, String body,
            List<String>? bodyLocArgs)?
        basicNotification,
    TResult Function(String title, String path)? routableNotification,
    required TResult orElse(),
  }) {
    if (basicNotification != null) {
      return basicNotification(title, titleLocArgs, body, bodyLocArgs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicNotification value) basicNotification,
    required TResult Function(RoutableNotification value) routableNotification,
  }) {
    return basicNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicNotification value)? basicNotification,
    TResult Function(RoutableNotification value)? routableNotification,
    required TResult orElse(),
  }) {
    if (basicNotification != null) {
      return basicNotification(this);
    }
    return orElse();
  }
}

abstract class BasicNotification implements Notification {
  factory BasicNotification(
      {required String title,
      List<String>? titleLocArgs,
      required String body,
      List<String>? bodyLocArgs}) = _$BasicNotification;

  @override
  String get title => throw _privateConstructorUsedError;
  List<String>? get titleLocArgs => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  List<String>? get bodyLocArgs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $BasicNotificationCopyWith<BasicNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutableNotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory $RoutableNotificationCopyWith(RoutableNotification value,
          $Res Function(RoutableNotification) then) =
      _$RoutableNotificationCopyWithImpl<$Res>;
  @override
  $Res call({String title, String path});
}

/// @nodoc
class _$RoutableNotificationCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res>
    implements $RoutableNotificationCopyWith<$Res> {
  _$RoutableNotificationCopyWithImpl(
      RoutableNotification _value, $Res Function(RoutableNotification) _then)
      : super(_value, (v) => _then(v as RoutableNotification));

  @override
  RoutableNotification get _value => super._value as RoutableNotification;

  @override
  $Res call({
    Object? title = freezed,
    Object? path = freezed,
  }) {
    return _then(RoutableNotification(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RoutableNotification
    with DiagnosticableTreeMixin
    implements RoutableNotification {
  _$RoutableNotification({required this.title, required this.path});

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
      _$RoutableNotificationCopyWithImpl<RoutableNotification>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, List<String>? titleLocArgs,
            String body, List<String>? bodyLocArgs)
        basicNotification,
    required TResult Function(String title, String path) routableNotification,
  }) {
    return routableNotification(title, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, List<String>? titleLocArgs, String body,
            List<String>? bodyLocArgs)?
        basicNotification,
    TResult Function(String title, String path)? routableNotification,
    required TResult orElse(),
  }) {
    if (routableNotification != null) {
      return routableNotification(title, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicNotification value) basicNotification,
    required TResult Function(RoutableNotification value) routableNotification,
  }) {
    return routableNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicNotification value)? basicNotification,
    TResult Function(RoutableNotification value)? routableNotification,
    required TResult orElse(),
  }) {
    if (routableNotification != null) {
      return routableNotification(this);
    }
    return orElse();
  }
}

abstract class RoutableNotification implements Notification {
  factory RoutableNotification({required String title, required String path}) =
      _$RoutableNotification;

  @override
  String get title => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $RoutableNotificationCopyWith<RoutableNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
