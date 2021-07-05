// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'dynamic_link_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DynamicLinkEventTearOff {
  const _$DynamicLinkEventTearOff();

  DeepLinkSetup deepLinkSetup() {
    return const DeepLinkSetup();
  }

  DeepLinkErrorEvent deepLinkErrorEvent({required OnLinkErrorException error}) {
    return DeepLinkErrorEvent(
      error: error,
    );
  }

  DeepLinkReceived deepLinkReceived({required Uri deepLink}) {
    return DeepLinkReceived(
      deepLink: deepLink,
    );
  }

  ShareRegistryLink shareRegistryLink(
      {required String date, required String lessonId}) {
    return ShareRegistryLink(
      date: date,
      lessonId: lessonId,
    );
  }
}

/// @nodoc
const $DynamicLinkEvent = _$DynamicLinkEventTearOff();

/// @nodoc
mixin _$DynamicLinkEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deepLinkSetup,
    required TResult Function(OnLinkErrorException error) deepLinkErrorEvent,
    required TResult Function(Uri deepLink) deepLinkReceived,
    required TResult Function(String date, String lessonId) shareRegistryLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deepLinkSetup,
    TResult Function(OnLinkErrorException error)? deepLinkErrorEvent,
    TResult Function(Uri deepLink)? deepLinkReceived,
    TResult Function(String date, String lessonId)? shareRegistryLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeepLinkSetup value) deepLinkSetup,
    required TResult Function(DeepLinkErrorEvent value) deepLinkErrorEvent,
    required TResult Function(DeepLinkReceived value) deepLinkReceived,
    required TResult Function(ShareRegistryLink value) shareRegistryLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeepLinkSetup value)? deepLinkSetup,
    TResult Function(DeepLinkErrorEvent value)? deepLinkErrorEvent,
    TResult Function(DeepLinkReceived value)? deepLinkReceived,
    TResult Function(ShareRegistryLink value)? shareRegistryLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicLinkEventCopyWith<$Res> {
  factory $DynamicLinkEventCopyWith(
          DynamicLinkEvent value, $Res Function(DynamicLinkEvent) then) =
      _$DynamicLinkEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DynamicLinkEventCopyWithImpl<$Res>
    implements $DynamicLinkEventCopyWith<$Res> {
  _$DynamicLinkEventCopyWithImpl(this._value, this._then);

  final DynamicLinkEvent _value;
  // ignore: unused_field
  final $Res Function(DynamicLinkEvent) _then;
}

/// @nodoc
abstract class $DeepLinkSetupCopyWith<$Res> {
  factory $DeepLinkSetupCopyWith(
          DeepLinkSetup value, $Res Function(DeepLinkSetup) then) =
      _$DeepLinkSetupCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeepLinkSetupCopyWithImpl<$Res>
    extends _$DynamicLinkEventCopyWithImpl<$Res>
    implements $DeepLinkSetupCopyWith<$Res> {
  _$DeepLinkSetupCopyWithImpl(
      DeepLinkSetup _value, $Res Function(DeepLinkSetup) _then)
      : super(_value, (v) => _then(v as DeepLinkSetup));

  @override
  DeepLinkSetup get _value => super._value as DeepLinkSetup;
}

/// @nodoc

class _$DeepLinkSetup implements DeepLinkSetup {
  const _$DeepLinkSetup();

  @override
  String toString() {
    return 'DynamicLinkEvent.deepLinkSetup()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeepLinkSetup);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deepLinkSetup,
    required TResult Function(OnLinkErrorException error) deepLinkErrorEvent,
    required TResult Function(Uri deepLink) deepLinkReceived,
    required TResult Function(String date, String lessonId) shareRegistryLink,
  }) {
    return deepLinkSetup();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deepLinkSetup,
    TResult Function(OnLinkErrorException error)? deepLinkErrorEvent,
    TResult Function(Uri deepLink)? deepLinkReceived,
    TResult Function(String date, String lessonId)? shareRegistryLink,
    required TResult orElse(),
  }) {
    if (deepLinkSetup != null) {
      return deepLinkSetup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeepLinkSetup value) deepLinkSetup,
    required TResult Function(DeepLinkErrorEvent value) deepLinkErrorEvent,
    required TResult Function(DeepLinkReceived value) deepLinkReceived,
    required TResult Function(ShareRegistryLink value) shareRegistryLink,
  }) {
    return deepLinkSetup(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeepLinkSetup value)? deepLinkSetup,
    TResult Function(DeepLinkErrorEvent value)? deepLinkErrorEvent,
    TResult Function(DeepLinkReceived value)? deepLinkReceived,
    TResult Function(ShareRegistryLink value)? shareRegistryLink,
    required TResult orElse(),
  }) {
    if (deepLinkSetup != null) {
      return deepLinkSetup(this);
    }
    return orElse();
  }
}

abstract class DeepLinkSetup implements DynamicLinkEvent {
  const factory DeepLinkSetup() = _$DeepLinkSetup;
}

/// @nodoc
abstract class $DeepLinkErrorEventCopyWith<$Res> {
  factory $DeepLinkErrorEventCopyWith(
          DeepLinkErrorEvent value, $Res Function(DeepLinkErrorEvent) then) =
      _$DeepLinkErrorEventCopyWithImpl<$Res>;
  $Res call({OnLinkErrorException error});
}

/// @nodoc
class _$DeepLinkErrorEventCopyWithImpl<$Res>
    extends _$DynamicLinkEventCopyWithImpl<$Res>
    implements $DeepLinkErrorEventCopyWith<$Res> {
  _$DeepLinkErrorEventCopyWithImpl(
      DeepLinkErrorEvent _value, $Res Function(DeepLinkErrorEvent) _then)
      : super(_value, (v) => _then(v as DeepLinkErrorEvent));

  @override
  DeepLinkErrorEvent get _value => super._value as DeepLinkErrorEvent;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(DeepLinkErrorEvent(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as OnLinkErrorException,
    ));
  }
}

/// @nodoc

class _$DeepLinkErrorEvent implements DeepLinkErrorEvent {
  const _$DeepLinkErrorEvent({required this.error});

  @override
  final OnLinkErrorException error;

  @override
  String toString() {
    return 'DynamicLinkEvent.deepLinkErrorEvent(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeepLinkErrorEvent &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $DeepLinkErrorEventCopyWith<DeepLinkErrorEvent> get copyWith =>
      _$DeepLinkErrorEventCopyWithImpl<DeepLinkErrorEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deepLinkSetup,
    required TResult Function(OnLinkErrorException error) deepLinkErrorEvent,
    required TResult Function(Uri deepLink) deepLinkReceived,
    required TResult Function(String date, String lessonId) shareRegistryLink,
  }) {
    return deepLinkErrorEvent(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deepLinkSetup,
    TResult Function(OnLinkErrorException error)? deepLinkErrorEvent,
    TResult Function(Uri deepLink)? deepLinkReceived,
    TResult Function(String date, String lessonId)? shareRegistryLink,
    required TResult orElse(),
  }) {
    if (deepLinkErrorEvent != null) {
      return deepLinkErrorEvent(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeepLinkSetup value) deepLinkSetup,
    required TResult Function(DeepLinkErrorEvent value) deepLinkErrorEvent,
    required TResult Function(DeepLinkReceived value) deepLinkReceived,
    required TResult Function(ShareRegistryLink value) shareRegistryLink,
  }) {
    return deepLinkErrorEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeepLinkSetup value)? deepLinkSetup,
    TResult Function(DeepLinkErrorEvent value)? deepLinkErrorEvent,
    TResult Function(DeepLinkReceived value)? deepLinkReceived,
    TResult Function(ShareRegistryLink value)? shareRegistryLink,
    required TResult orElse(),
  }) {
    if (deepLinkErrorEvent != null) {
      return deepLinkErrorEvent(this);
    }
    return orElse();
  }
}

abstract class DeepLinkErrorEvent implements DynamicLinkEvent {
  const factory DeepLinkErrorEvent({required OnLinkErrorException error}) =
      _$DeepLinkErrorEvent;

  OnLinkErrorException get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeepLinkErrorEventCopyWith<DeepLinkErrorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeepLinkReceivedCopyWith<$Res> {
  factory $DeepLinkReceivedCopyWith(
          DeepLinkReceived value, $Res Function(DeepLinkReceived) then) =
      _$DeepLinkReceivedCopyWithImpl<$Res>;
  $Res call({Uri deepLink});
}

/// @nodoc
class _$DeepLinkReceivedCopyWithImpl<$Res>
    extends _$DynamicLinkEventCopyWithImpl<$Res>
    implements $DeepLinkReceivedCopyWith<$Res> {
  _$DeepLinkReceivedCopyWithImpl(
      DeepLinkReceived _value, $Res Function(DeepLinkReceived) _then)
      : super(_value, (v) => _then(v as DeepLinkReceived));

  @override
  DeepLinkReceived get _value => super._value as DeepLinkReceived;

  @override
  $Res call({
    Object? deepLink = freezed,
  }) {
    return _then(DeepLinkReceived(
      deepLink: deepLink == freezed
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$DeepLinkReceived implements DeepLinkReceived {
  const _$DeepLinkReceived({required this.deepLink});

  @override
  final Uri deepLink;

  @override
  String toString() {
    return 'DynamicLinkEvent.deepLinkReceived(deepLink: $deepLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeepLinkReceived &&
            (identical(other.deepLink, deepLink) ||
                const DeepCollectionEquality()
                    .equals(other.deepLink, deepLink)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(deepLink);

  @JsonKey(ignore: true)
  @override
  $DeepLinkReceivedCopyWith<DeepLinkReceived> get copyWith =>
      _$DeepLinkReceivedCopyWithImpl<DeepLinkReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deepLinkSetup,
    required TResult Function(OnLinkErrorException error) deepLinkErrorEvent,
    required TResult Function(Uri deepLink) deepLinkReceived,
    required TResult Function(String date, String lessonId) shareRegistryLink,
  }) {
    return deepLinkReceived(deepLink);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deepLinkSetup,
    TResult Function(OnLinkErrorException error)? deepLinkErrorEvent,
    TResult Function(Uri deepLink)? deepLinkReceived,
    TResult Function(String date, String lessonId)? shareRegistryLink,
    required TResult orElse(),
  }) {
    if (deepLinkReceived != null) {
      return deepLinkReceived(deepLink);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeepLinkSetup value) deepLinkSetup,
    required TResult Function(DeepLinkErrorEvent value) deepLinkErrorEvent,
    required TResult Function(DeepLinkReceived value) deepLinkReceived,
    required TResult Function(ShareRegistryLink value) shareRegistryLink,
  }) {
    return deepLinkReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeepLinkSetup value)? deepLinkSetup,
    TResult Function(DeepLinkErrorEvent value)? deepLinkErrorEvent,
    TResult Function(DeepLinkReceived value)? deepLinkReceived,
    TResult Function(ShareRegistryLink value)? shareRegistryLink,
    required TResult orElse(),
  }) {
    if (deepLinkReceived != null) {
      return deepLinkReceived(this);
    }
    return orElse();
  }
}

abstract class DeepLinkReceived implements DynamicLinkEvent {
  const factory DeepLinkReceived({required Uri deepLink}) = _$DeepLinkReceived;

  Uri get deepLink => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeepLinkReceivedCopyWith<DeepLinkReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareRegistryLinkCopyWith<$Res> {
  factory $ShareRegistryLinkCopyWith(
          ShareRegistryLink value, $Res Function(ShareRegistryLink) then) =
      _$ShareRegistryLinkCopyWithImpl<$Res>;
  $Res call({String date, String lessonId});
}

/// @nodoc
class _$ShareRegistryLinkCopyWithImpl<$Res>
    extends _$DynamicLinkEventCopyWithImpl<$Res>
    implements $ShareRegistryLinkCopyWith<$Res> {
  _$ShareRegistryLinkCopyWithImpl(
      ShareRegistryLink _value, $Res Function(ShareRegistryLink) _then)
      : super(_value, (v) => _then(v as ShareRegistryLink));

  @override
  ShareRegistryLink get _value => super._value as ShareRegistryLink;

  @override
  $Res call({
    Object? date = freezed,
    Object? lessonId = freezed,
  }) {
    return _then(ShareRegistryLink(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: lessonId == freezed
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShareRegistryLink implements ShareRegistryLink {
  const _$ShareRegistryLink({required this.date, required this.lessonId});

  @override
  final String date;
  @override
  final String lessonId;

  @override
  String toString() {
    return 'DynamicLinkEvent.shareRegistryLink(date: $date, lessonId: $lessonId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShareRegistryLink &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.lessonId, lessonId) ||
                const DeepCollectionEquality()
                    .equals(other.lessonId, lessonId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(lessonId);

  @JsonKey(ignore: true)
  @override
  $ShareRegistryLinkCopyWith<ShareRegistryLink> get copyWith =>
      _$ShareRegistryLinkCopyWithImpl<ShareRegistryLink>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deepLinkSetup,
    required TResult Function(OnLinkErrorException error) deepLinkErrorEvent,
    required TResult Function(Uri deepLink) deepLinkReceived,
    required TResult Function(String date, String lessonId) shareRegistryLink,
  }) {
    return shareRegistryLink(date, lessonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deepLinkSetup,
    TResult Function(OnLinkErrorException error)? deepLinkErrorEvent,
    TResult Function(Uri deepLink)? deepLinkReceived,
    TResult Function(String date, String lessonId)? shareRegistryLink,
    required TResult orElse(),
  }) {
    if (shareRegistryLink != null) {
      return shareRegistryLink(date, lessonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeepLinkSetup value) deepLinkSetup,
    required TResult Function(DeepLinkErrorEvent value) deepLinkErrorEvent,
    required TResult Function(DeepLinkReceived value) deepLinkReceived,
    required TResult Function(ShareRegistryLink value) shareRegistryLink,
  }) {
    return shareRegistryLink(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeepLinkSetup value)? deepLinkSetup,
    TResult Function(DeepLinkErrorEvent value)? deepLinkErrorEvent,
    TResult Function(DeepLinkReceived value)? deepLinkReceived,
    TResult Function(ShareRegistryLink value)? shareRegistryLink,
    required TResult orElse(),
  }) {
    if (shareRegistryLink != null) {
      return shareRegistryLink(this);
    }
    return orElse();
  }
}

abstract class ShareRegistryLink implements DynamicLinkEvent {
  const factory ShareRegistryLink(
      {required String date, required String lessonId}) = _$ShareRegistryLink;

  String get date => throw _privateConstructorUsedError;
  String get lessonId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareRegistryLinkCopyWith<ShareRegistryLink> get copyWith =>
      throw _privateConstructorUsedError;
}
