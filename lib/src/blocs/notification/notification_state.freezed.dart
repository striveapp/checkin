// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationStateTearOff {
  const _$NotificationStateTearOff();

  NotificationInitial notificationInitial() {
    return const NotificationInitial();
  }

  NotificationToNavigate notificationToNavigate({required String path}) {
    return NotificationToNavigate(
      path: path,
    );
  }

  ShowSnackBar showSnackBar(
      {required String title,
      List<String>? titleLocArgs,
      required String body,
      List<String>? bodyLocArgs}) {
    return ShowSnackBar(
      title: title,
      titleLocArgs: titleLocArgs,
      body: body,
      bodyLocArgs: bodyLocArgs,
    );
  }
}

/// @nodoc
const $NotificationState = _$NotificationStateTearOff();

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInitial,
    required TResult Function(String path) notificationToNavigate,
    required TResult Function(String title, List<String>? titleLocArgs,
            String body, List<String>? bodyLocArgs)
        showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInitial,
    TResult Function(String path)? notificationToNavigate,
    TResult Function(String title, List<String>? titleLocArgs, String body,
            List<String>? bodyLocArgs)?
        showSnackBar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitial value) notificationInitial,
    required TResult Function(NotificationToNavigate value)
        notificationToNavigate,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitial value)? notificationInitial,
    TResult Function(NotificationToNavigate value)? notificationToNavigate,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInitial,
    required TResult Function(String path) notificationToNavigate,
    required TResult Function(String title, List<String>? titleLocArgs,
            String body, List<String>? bodyLocArgs)
        showSnackBar,
  }) {
    return notificationInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInitial,
    TResult Function(String path)? notificationToNavigate,
    TResult Function(String title, List<String>? titleLocArgs, String body,
            List<String>? bodyLocArgs)?
        showSnackBar,
    required TResult orElse(),
  }) {
    if (notificationInitial != null) {
      return notificationInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitial value) notificationInitial,
    required TResult Function(NotificationToNavigate value)
        notificationToNavigate,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) {
    return notificationInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitial value)? notificationInitial,
    TResult Function(NotificationToNavigate value)? notificationToNavigate,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) {
    if (notificationInitial != null) {
      return notificationInitial(this);
    }
    return orElse();
  }
}

abstract class NotificationInitial implements NotificationState {
  const factory NotificationInitial() = _$NotificationInitial;
}

/// @nodoc
abstract class $NotificationToNavigateCopyWith<$Res> {
  factory $NotificationToNavigateCopyWith(NotificationToNavigate value,
          $Res Function(NotificationToNavigate) then) =
      _$NotificationToNavigateCopyWithImpl<$Res>;
  $Res call({String path});
}

/// @nodoc
class _$NotificationToNavigateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationToNavigateCopyWith<$Res> {
  _$NotificationToNavigateCopyWithImpl(NotificationToNavigate _value,
      $Res Function(NotificationToNavigate) _then)
      : super(_value, (v) => _then(v as NotificationToNavigate));

  @override
  NotificationToNavigate get _value => super._value as NotificationToNavigate;

  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(NotificationToNavigate(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotificationToNavigate
    with DiagnosticableTreeMixin
    implements NotificationToNavigate {
  const _$NotificationToNavigate({required this.path});

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState.notificationToNavigate(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'NotificationState.notificationToNavigate'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationToNavigate &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(path);

  @JsonKey(ignore: true)
  @override
  $NotificationToNavigateCopyWith<NotificationToNavigate> get copyWith =>
      _$NotificationToNavigateCopyWithImpl<NotificationToNavigate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInitial,
    required TResult Function(String path) notificationToNavigate,
    required TResult Function(String title, List<String>? titleLocArgs,
            String body, List<String>? bodyLocArgs)
        showSnackBar,
  }) {
    return notificationToNavigate(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInitial,
    TResult Function(String path)? notificationToNavigate,
    TResult Function(String title, List<String>? titleLocArgs, String body,
            List<String>? bodyLocArgs)?
        showSnackBar,
    required TResult orElse(),
  }) {
    if (notificationToNavigate != null) {
      return notificationToNavigate(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitial value) notificationInitial,
    required TResult Function(NotificationToNavigate value)
        notificationToNavigate,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) {
    return notificationToNavigate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitial value)? notificationInitial,
    TResult Function(NotificationToNavigate value)? notificationToNavigate,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) {
    if (notificationToNavigate != null) {
      return notificationToNavigate(this);
    }
    return orElse();
  }
}

abstract class NotificationToNavigate implements NotificationState {
  const factory NotificationToNavigate({required String path}) =
      _$NotificationToNavigate;

  String get path => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationToNavigateCopyWith<NotificationToNavigate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowSnackBarCopyWith<$Res> {
  factory $ShowSnackBarCopyWith(
          ShowSnackBar value, $Res Function(ShowSnackBar) then) =
      _$ShowSnackBarCopyWithImpl<$Res>;
  $Res call(
      {String title,
      List<String>? titleLocArgs,
      String body,
      List<String>? bodyLocArgs});
}

/// @nodoc
class _$ShowSnackBarCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements $ShowSnackBarCopyWith<$Res> {
  _$ShowSnackBarCopyWithImpl(
      ShowSnackBar _value, $Res Function(ShowSnackBar) _then)
      : super(_value, (v) => _then(v as ShowSnackBar));

  @override
  ShowSnackBar get _value => super._value as ShowSnackBar;

  @override
  $Res call({
    Object? title = freezed,
    Object? titleLocArgs = freezed,
    Object? body = freezed,
    Object? bodyLocArgs = freezed,
  }) {
    return _then(ShowSnackBar(
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

class _$ShowSnackBar with DiagnosticableTreeMixin implements ShowSnackBar {
  const _$ShowSnackBar(
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
    return 'NotificationState.showSnackBar(title: $title, titleLocArgs: $titleLocArgs, body: $body, bodyLocArgs: $bodyLocArgs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationState.showSnackBar'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('titleLocArgs', titleLocArgs))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('bodyLocArgs', bodyLocArgs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowSnackBar &&
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
  $ShowSnackBarCopyWith<ShowSnackBar> get copyWith =>
      _$ShowSnackBarCopyWithImpl<ShowSnackBar>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInitial,
    required TResult Function(String path) notificationToNavigate,
    required TResult Function(String title, List<String>? titleLocArgs,
            String body, List<String>? bodyLocArgs)
        showSnackBar,
  }) {
    return showSnackBar(title, titleLocArgs, body, bodyLocArgs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInitial,
    TResult Function(String path)? notificationToNavigate,
    TResult Function(String title, List<String>? titleLocArgs, String body,
            List<String>? bodyLocArgs)?
        showSnackBar,
    required TResult orElse(),
  }) {
    if (showSnackBar != null) {
      return showSnackBar(title, titleLocArgs, body, bodyLocArgs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitial value) notificationInitial,
    required TResult Function(NotificationToNavigate value)
        notificationToNavigate,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) {
    return showSnackBar(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitial value)? notificationInitial,
    TResult Function(NotificationToNavigate value)? notificationToNavigate,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) {
    if (showSnackBar != null) {
      return showSnackBar(this);
    }
    return orElse();
  }
}

abstract class ShowSnackBar implements NotificationState {
  const factory ShowSnackBar(
      {required String title,
      List<String>? titleLocArgs,
      required String body,
      List<String>? bodyLocArgs}) = _$ShowSnackBar;

  String get title => throw _privateConstructorUsedError;
  List<String>? get titleLocArgs => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  List<String>? get bodyLocArgs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowSnackBarCopyWith<ShowSnackBar> get copyWith =>
      throw _privateConstructorUsedError;
}
