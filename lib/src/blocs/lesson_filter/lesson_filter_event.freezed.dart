// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lesson_filter_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LessonFilterEventTearOff {
  const _$LessonFilterEventTearOff();

// ignore: unused_element
  LessonFilterUpdated lessonFilterUpdated(
      {@required Set<String> availableLessonTypes}) {
    return LessonFilterUpdated(
      availableLessonTypes: availableLessonTypes,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonFilterEvent = _$LessonFilterEventTearOff();

/// @nodoc
mixin _$LessonFilterEvent {
  Set<String> get availableLessonTypes;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonFilterUpdated(Set<String> availableLessonTypes),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonFilterUpdated(Set<String> availableLessonTypes),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonFilterUpdated(LessonFilterUpdated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonFilterUpdated(LessonFilterUpdated value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $LessonFilterEventCopyWith<LessonFilterEvent> get copyWith;
}

/// @nodoc
abstract class $LessonFilterEventCopyWith<$Res> {
  factory $LessonFilterEventCopyWith(
          LessonFilterEvent value, $Res Function(LessonFilterEvent) then) =
      _$LessonFilterEventCopyWithImpl<$Res>;
  $Res call({Set<String> availableLessonTypes});
}

/// @nodoc
class _$LessonFilterEventCopyWithImpl<$Res>
    implements $LessonFilterEventCopyWith<$Res> {
  _$LessonFilterEventCopyWithImpl(this._value, this._then);

  final LessonFilterEvent _value;
  // ignore: unused_field
  final $Res Function(LessonFilterEvent) _then;

  @override
  $Res call({
    Object availableLessonTypes = freezed,
  }) {
    return _then(_value.copyWith(
      availableLessonTypes: availableLessonTypes == freezed
          ? _value.availableLessonTypes
          : availableLessonTypes as Set<String>,
    ));
  }
}

/// @nodoc
abstract class $LessonFilterUpdatedCopyWith<$Res>
    implements $LessonFilterEventCopyWith<$Res> {
  factory $LessonFilterUpdatedCopyWith(
          LessonFilterUpdated value, $Res Function(LessonFilterUpdated) then) =
      _$LessonFilterUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({Set<String> availableLessonTypes});
}

/// @nodoc
class _$LessonFilterUpdatedCopyWithImpl<$Res>
    extends _$LessonFilterEventCopyWithImpl<$Res>
    implements $LessonFilterUpdatedCopyWith<$Res> {
  _$LessonFilterUpdatedCopyWithImpl(
      LessonFilterUpdated _value, $Res Function(LessonFilterUpdated) _then)
      : super(_value, (v) => _then(v as LessonFilterUpdated));

  @override
  LessonFilterUpdated get _value => super._value as LessonFilterUpdated;

  @override
  $Res call({
    Object availableLessonTypes = freezed,
  }) {
    return _then(LessonFilterUpdated(
      availableLessonTypes: availableLessonTypes == freezed
          ? _value.availableLessonTypes
          : availableLessonTypes as Set<String>,
    ));
  }
}

/// @nodoc
class _$LessonFilterUpdated
    with DiagnosticableTreeMixin
    implements LessonFilterUpdated {
  const _$LessonFilterUpdated({@required this.availableLessonTypes})
      : assert(availableLessonTypes != null);

  @override
  final Set<String> availableLessonTypes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonFilterEvent.lessonFilterUpdated(availableLessonTypes: $availableLessonTypes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'LessonFilterEvent.lessonFilterUpdated'))
      ..add(DiagnosticsProperty('availableLessonTypes', availableLessonTypes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonFilterUpdated &&
            (identical(other.availableLessonTypes, availableLessonTypes) ||
                const DeepCollectionEquality()
                    .equals(other.availableLessonTypes, availableLessonTypes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(availableLessonTypes);

  @JsonKey(ignore: true)
  @override
  $LessonFilterUpdatedCopyWith<LessonFilterUpdated> get copyWith =>
      _$LessonFilterUpdatedCopyWithImpl<LessonFilterUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonFilterUpdated(Set<String> availableLessonTypes),
  }) {
    assert(lessonFilterUpdated != null);
    return lessonFilterUpdated(availableLessonTypes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonFilterUpdated(Set<String> availableLessonTypes),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonFilterUpdated != null) {
      return lessonFilterUpdated(availableLessonTypes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonFilterUpdated(LessonFilterUpdated value),
  }) {
    assert(lessonFilterUpdated != null);
    return lessonFilterUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonFilterUpdated(LessonFilterUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonFilterUpdated != null) {
      return lessonFilterUpdated(this);
    }
    return orElse();
  }
}

abstract class LessonFilterUpdated implements LessonFilterEvent {
  const factory LessonFilterUpdated(
      {@required Set<String> availableLessonTypes}) = _$LessonFilterUpdated;

  @override
  Set<String> get availableLessonTypes;
  @override
  @JsonKey(ignore: true)
  $LessonFilterUpdatedCopyWith<LessonFilterUpdated> get copyWith;
}
