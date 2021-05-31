// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dynamic_link_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DynamicLinkEventTearOff {
  const _$DynamicLinkEventTearOff();

// ignore: unused_element
  DeepLinkSetup deepLinkSetup() {
    return const DeepLinkSetup();
  }

// ignore: unused_element
  DeepLinkErrorEvent deepLinkErrorEvent({@required OnLinkErrorException error}) {
    return DeepLinkErrorEvent(
      error: error,
    );
  }

// ignore: unused_element
  DeepLinkReceived deepLinkReceived({@required Uri deepLink}) {
    return DeepLinkReceived(
      deepLink: deepLink,
    );
  }

// ignore: unused_element
  ShareRegistryLink shareRegistryLink({@required String date, @required String lessonId}) {
    return ShareRegistryLink(
      date: date,
      lessonId: lessonId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DynamicLinkEvent = _$DynamicLinkEventTearOff();

/// @nodoc
mixin _$DynamicLinkEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult deepLinkSetup(),
    @required TResult deepLinkErrorEvent(OnLinkErrorException error),
    @required TResult deepLinkReceived(Uri deepLink),
    @required TResult shareRegistryLink(String date, String lessonId),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult deepLinkSetup(),
    TResult deepLinkErrorEvent(OnLinkErrorException error),
    TResult deepLinkReceived(Uri deepLink),
    TResult shareRegistryLink(String date, String lessonId),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult deepLinkSetup(DeepLinkSetup value),
    @required TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    @required TResult deepLinkReceived(DeepLinkReceived value),
    @required TResult shareRegistryLink(ShareRegistryLink value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult deepLinkSetup(DeepLinkSetup value),
    TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    TResult deepLinkReceived(DeepLinkReceived value),
    TResult shareRegistryLink(ShareRegistryLink value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $DynamicLinkEventCopyWith<$Res> {
  factory $DynamicLinkEventCopyWith(DynamicLinkEvent value, $Res Function(DynamicLinkEvent) then) =
      _$DynamicLinkEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DynamicLinkEventCopyWithImpl<$Res> implements $DynamicLinkEventCopyWith<$Res> {
  _$DynamicLinkEventCopyWithImpl(this._value, this._then);

  final DynamicLinkEvent _value;
  // ignore: unused_field
  final $Res Function(DynamicLinkEvent) _then;
}

/// @nodoc
abstract class $DeepLinkSetupCopyWith<$Res> {
  factory $DeepLinkSetupCopyWith(DeepLinkSetup value, $Res Function(DeepLinkSetup) then) =
      _$DeepLinkSetupCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeepLinkSetupCopyWithImpl<$Res> extends _$DynamicLinkEventCopyWithImpl<$Res>
    implements $DeepLinkSetupCopyWith<$Res> {
  _$DeepLinkSetupCopyWithImpl(DeepLinkSetup _value, $Res Function(DeepLinkSetup) _then)
      : super(_value, (v) => _then(v as DeepLinkSetup));

  @override
  DeepLinkSetup get _value => super._value as DeepLinkSetup;
}

/// @nodoc
class _$DeepLinkSetup with DiagnosticableTreeMixin implements DeepLinkSetup {
  const _$DeepLinkSetup();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DynamicLinkEvent.deepLinkSetup()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'DynamicLinkEvent.deepLinkSetup'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeepLinkSetup);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult deepLinkSetup(),
    @required TResult deepLinkErrorEvent(OnLinkErrorException error),
    @required TResult deepLinkReceived(Uri deepLink),
    @required TResult shareRegistryLink(String date, String lessonId),
  }) {
    assert(deepLinkSetup != null);
    assert(deepLinkErrorEvent != null);
    assert(deepLinkReceived != null);
    assert(shareRegistryLink != null);
    return deepLinkSetup();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult deepLinkSetup(),
    TResult deepLinkErrorEvent(OnLinkErrorException error),
    TResult deepLinkReceived(Uri deepLink),
    TResult shareRegistryLink(String date, String lessonId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deepLinkSetup != null) {
      return deepLinkSetup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult deepLinkSetup(DeepLinkSetup value),
    @required TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    @required TResult deepLinkReceived(DeepLinkReceived value),
    @required TResult shareRegistryLink(ShareRegistryLink value),
  }) {
    assert(deepLinkSetup != null);
    assert(deepLinkErrorEvent != null);
    assert(deepLinkReceived != null);
    assert(shareRegistryLink != null);
    return deepLinkSetup(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult deepLinkSetup(DeepLinkSetup value),
    TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    TResult deepLinkReceived(DeepLinkReceived value),
    TResult shareRegistryLink(ShareRegistryLink value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
class _$DeepLinkErrorEventCopyWithImpl<$Res> extends _$DynamicLinkEventCopyWithImpl<$Res>
    implements $DeepLinkErrorEventCopyWith<$Res> {
  _$DeepLinkErrorEventCopyWithImpl(
      DeepLinkErrorEvent _value, $Res Function(DeepLinkErrorEvent) _then)
      : super(_value, (v) => _then(v as DeepLinkErrorEvent));

  @override
  DeepLinkErrorEvent get _value => super._value as DeepLinkErrorEvent;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(DeepLinkErrorEvent(
      error: error == freezed ? _value.error : error as OnLinkErrorException,
    ));
  }
}

/// @nodoc
class _$DeepLinkErrorEvent with DiagnosticableTreeMixin implements DeepLinkErrorEvent {
  const _$DeepLinkErrorEvent({@required this.error}) : assert(error != null);

  @override
  final OnLinkErrorException error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DynamicLinkEvent.deepLinkErrorEvent(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DynamicLinkEvent.deepLinkErrorEvent'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeepLinkErrorEvent &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $DeepLinkErrorEventCopyWith<DeepLinkErrorEvent> get copyWith =>
      _$DeepLinkErrorEventCopyWithImpl<DeepLinkErrorEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult deepLinkSetup(),
    @required TResult deepLinkErrorEvent(OnLinkErrorException error),
    @required TResult deepLinkReceived(Uri deepLink),
    @required TResult shareRegistryLink(String date, String lessonId),
  }) {
    assert(deepLinkSetup != null);
    assert(deepLinkErrorEvent != null);
    assert(deepLinkReceived != null);
    assert(shareRegistryLink != null);
    return deepLinkErrorEvent(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult deepLinkSetup(),
    TResult deepLinkErrorEvent(OnLinkErrorException error),
    TResult deepLinkReceived(Uri deepLink),
    TResult shareRegistryLink(String date, String lessonId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deepLinkErrorEvent != null) {
      return deepLinkErrorEvent(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult deepLinkSetup(DeepLinkSetup value),
    @required TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    @required TResult deepLinkReceived(DeepLinkReceived value),
    @required TResult shareRegistryLink(ShareRegistryLink value),
  }) {
    assert(deepLinkSetup != null);
    assert(deepLinkErrorEvent != null);
    assert(deepLinkReceived != null);
    assert(shareRegistryLink != null);
    return deepLinkErrorEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult deepLinkSetup(DeepLinkSetup value),
    TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    TResult deepLinkReceived(DeepLinkReceived value),
    TResult shareRegistryLink(ShareRegistryLink value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deepLinkErrorEvent != null) {
      return deepLinkErrorEvent(this);
    }
    return orElse();
  }
}

abstract class DeepLinkErrorEvent implements DynamicLinkEvent {
  const factory DeepLinkErrorEvent({@required OnLinkErrorException error}) = _$DeepLinkErrorEvent;

  OnLinkErrorException get error;
  @JsonKey(ignore: true)
  $DeepLinkErrorEventCopyWith<DeepLinkErrorEvent> get copyWith;
}

/// @nodoc
abstract class $DeepLinkReceivedCopyWith<$Res> {
  factory $DeepLinkReceivedCopyWith(DeepLinkReceived value, $Res Function(DeepLinkReceived) then) =
      _$DeepLinkReceivedCopyWithImpl<$Res>;
  $Res call({Uri deepLink});
}

/// @nodoc
class _$DeepLinkReceivedCopyWithImpl<$Res> extends _$DynamicLinkEventCopyWithImpl<$Res>
    implements $DeepLinkReceivedCopyWith<$Res> {
  _$DeepLinkReceivedCopyWithImpl(DeepLinkReceived _value, $Res Function(DeepLinkReceived) _then)
      : super(_value, (v) => _then(v as DeepLinkReceived));

  @override
  DeepLinkReceived get _value => super._value as DeepLinkReceived;

  @override
  $Res call({
    Object deepLink = freezed,
  }) {
    return _then(DeepLinkReceived(
      deepLink: deepLink == freezed ? _value.deepLink : deepLink as Uri,
    ));
  }
}

/// @nodoc
class _$DeepLinkReceived with DiagnosticableTreeMixin implements DeepLinkReceived {
  const _$DeepLinkReceived({@required this.deepLink}) : assert(deepLink != null);

  @override
  final Uri deepLink;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DynamicLinkEvent.deepLinkReceived(deepLink: $deepLink)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DynamicLinkEvent.deepLinkReceived'))
      ..add(DiagnosticsProperty('deepLink', deepLink));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeepLinkReceived &&
            (identical(other.deepLink, deepLink) ||
                const DeepCollectionEquality().equals(other.deepLink, deepLink)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(deepLink);

  @JsonKey(ignore: true)
  @override
  $DeepLinkReceivedCopyWith<DeepLinkReceived> get copyWith =>
      _$DeepLinkReceivedCopyWithImpl<DeepLinkReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult deepLinkSetup(),
    @required TResult deepLinkErrorEvent(OnLinkErrorException error),
    @required TResult deepLinkReceived(Uri deepLink),
    @required TResult shareRegistryLink(String date, String lessonId),
  }) {
    assert(deepLinkSetup != null);
    assert(deepLinkErrorEvent != null);
    assert(deepLinkReceived != null);
    assert(shareRegistryLink != null);
    return deepLinkReceived(deepLink);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult deepLinkSetup(),
    TResult deepLinkErrorEvent(OnLinkErrorException error),
    TResult deepLinkReceived(Uri deepLink),
    TResult shareRegistryLink(String date, String lessonId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deepLinkReceived != null) {
      return deepLinkReceived(deepLink);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult deepLinkSetup(DeepLinkSetup value),
    @required TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    @required TResult deepLinkReceived(DeepLinkReceived value),
    @required TResult shareRegistryLink(ShareRegistryLink value),
  }) {
    assert(deepLinkSetup != null);
    assert(deepLinkErrorEvent != null);
    assert(deepLinkReceived != null);
    assert(shareRegistryLink != null);
    return deepLinkReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult deepLinkSetup(DeepLinkSetup value),
    TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    TResult deepLinkReceived(DeepLinkReceived value),
    TResult shareRegistryLink(ShareRegistryLink value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deepLinkReceived != null) {
      return deepLinkReceived(this);
    }
    return orElse();
  }
}

abstract class DeepLinkReceived implements DynamicLinkEvent {
  const factory DeepLinkReceived({@required Uri deepLink}) = _$DeepLinkReceived;

  Uri get deepLink;
  @JsonKey(ignore: true)
  $DeepLinkReceivedCopyWith<DeepLinkReceived> get copyWith;
}

/// @nodoc
abstract class $ShareRegistryLinkCopyWith<$Res> {
  factory $ShareRegistryLinkCopyWith(
          ShareRegistryLink value, $Res Function(ShareRegistryLink) then) =
      _$ShareRegistryLinkCopyWithImpl<$Res>;
  $Res call({String date, String lessonId});
}

/// @nodoc
class _$ShareRegistryLinkCopyWithImpl<$Res> extends _$DynamicLinkEventCopyWithImpl<$Res>
    implements $ShareRegistryLinkCopyWith<$Res> {
  _$ShareRegistryLinkCopyWithImpl(ShareRegistryLink _value, $Res Function(ShareRegistryLink) _then)
      : super(_value, (v) => _then(v as ShareRegistryLink));

  @override
  ShareRegistryLink get _value => super._value as ShareRegistryLink;

  @override
  $Res call({
    Object date = freezed,
    Object lessonId = freezed,
  }) {
    return _then(ShareRegistryLink(
      date: date == freezed ? _value.date : date as String,
      lessonId: lessonId == freezed ? _value.lessonId : lessonId as String,
    ));
  }
}

/// @nodoc
class _$ShareRegistryLink with DiagnosticableTreeMixin implements ShareRegistryLink {
  const _$ShareRegistryLink({@required this.date, @required this.lessonId})
      : assert(date != null),
        assert(lessonId != null);

  @override
  final String date;
  @override
  final String lessonId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DynamicLinkEvent.shareRegistryLink(date: $date, lessonId: $lessonId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DynamicLinkEvent.shareRegistryLink'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('lessonId', lessonId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShareRegistryLink &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.lessonId, lessonId) ||
                const DeepCollectionEquality().equals(other.lessonId, lessonId)));
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
  TResult when<TResult extends Object>({
    @required TResult deepLinkSetup(),
    @required TResult deepLinkErrorEvent(OnLinkErrorException error),
    @required TResult deepLinkReceived(Uri deepLink),
    @required TResult shareRegistryLink(String date, String lessonId),
  }) {
    assert(deepLinkSetup != null);
    assert(deepLinkErrorEvent != null);
    assert(deepLinkReceived != null);
    assert(shareRegistryLink != null);
    return shareRegistryLink(date, lessonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult deepLinkSetup(),
    TResult deepLinkErrorEvent(OnLinkErrorException error),
    TResult deepLinkReceived(Uri deepLink),
    TResult shareRegistryLink(String date, String lessonId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (shareRegistryLink != null) {
      return shareRegistryLink(date, lessonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult deepLinkSetup(DeepLinkSetup value),
    @required TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    @required TResult deepLinkReceived(DeepLinkReceived value),
    @required TResult shareRegistryLink(ShareRegistryLink value),
  }) {
    assert(deepLinkSetup != null);
    assert(deepLinkErrorEvent != null);
    assert(deepLinkReceived != null);
    assert(shareRegistryLink != null);
    return shareRegistryLink(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult deepLinkSetup(DeepLinkSetup value),
    TResult deepLinkErrorEvent(DeepLinkErrorEvent value),
    TResult deepLinkReceived(DeepLinkReceived value),
    TResult shareRegistryLink(ShareRegistryLink value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (shareRegistryLink != null) {
      return shareRegistryLink(this);
    }
    return orElse();
  }
}

abstract class ShareRegistryLink implements DynamicLinkEvent {
  const factory ShareRegistryLink({@required String date, @required String lessonId}) =
      _$ShareRegistryLink;

  String get date;
  String get lessonId;
  @JsonKey(ignore: true)
  $ShareRegistryLinkCopyWith<ShareRegistryLink> get copyWith;
}
