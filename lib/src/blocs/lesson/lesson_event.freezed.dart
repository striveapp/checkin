// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lesson_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LessonEventTearOff {
  const _$LessonEventTearOff();

// ignore: unused_element
  LessonUpdated lessonUpdated({@required Lesson lesson}) {
    return LessonUpdated(
      lesson: lesson,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonEvent = _$LessonEventTearOff();

/// @nodoc
mixin _$LessonEvent {
  Lesson get lesson;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result lessonUpdated(Lesson lesson),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result lessonUpdated(Lesson lesson),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result lessonUpdated(LessonUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result lessonUpdated(LessonUpdated value),
    @required Result orElse(),
  });

  $LessonEventCopyWith<LessonEvent> get copyWith;
}

/// @nodoc
abstract class $LessonEventCopyWith<$Res> {
  factory $LessonEventCopyWith(
          LessonEvent value, $Res Function(LessonEvent) then) =
      _$LessonEventCopyWithImpl<$Res>;
  $Res call({Lesson lesson});

  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class _$LessonEventCopyWithImpl<$Res> implements $LessonEventCopyWith<$Res> {
  _$LessonEventCopyWithImpl(this._value, this._then);

  final LessonEvent _value;
  // ignore: unused_field
  final $Res Function(LessonEvent) _then;

  @override
  $Res call({
    Object lesson = freezed,
  }) {
    return _then(_value.copyWith(
      lesson: lesson == freezed ? _value.lesson : lesson as Lesson,
    ));
  }

  @override
  $LessonCopyWith<$Res> get lesson {
    if (_value.lesson == null) {
      return null;
    }
    return $LessonCopyWith<$Res>(_value.lesson, (value) {
      return _then(_value.copyWith(lesson: value));
    });
  }
}

/// @nodoc
abstract class $LessonUpdatedCopyWith<$Res>
    implements $LessonEventCopyWith<$Res> {
  factory $LessonUpdatedCopyWith(
          LessonUpdated value, $Res Function(LessonUpdated) then) =
      _$LessonUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({Lesson lesson});

  @override
  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class _$LessonUpdatedCopyWithImpl<$Res> extends _$LessonEventCopyWithImpl<$Res>
    implements $LessonUpdatedCopyWith<$Res> {
  _$LessonUpdatedCopyWithImpl(
      LessonUpdated _value, $Res Function(LessonUpdated) _then)
      : super(_value, (v) => _then(v as LessonUpdated));

  @override
  LessonUpdated get _value => super._value as LessonUpdated;

  @override
  $Res call({
    Object lesson = freezed,
  }) {
    return _then(LessonUpdated(
      lesson: lesson == freezed ? _value.lesson : lesson as Lesson,
    ));
  }
}

/// @nodoc
class _$LessonUpdated with DiagnosticableTreeMixin implements LessonUpdated {
  const _$LessonUpdated({@required this.lesson}) : assert(lesson != null);

  @override
  final Lesson lesson;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonEvent.lessonUpdated(lesson: $lesson)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonEvent.lessonUpdated'))
      ..add(DiagnosticsProperty('lesson', lesson));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonUpdated &&
            (identical(other.lesson, lesson) ||
                const DeepCollectionEquality().equals(other.lesson, lesson)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lesson);

  @override
  $LessonUpdatedCopyWith<LessonUpdated> get copyWith =>
      _$LessonUpdatedCopyWithImpl<LessonUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result lessonUpdated(Lesson lesson),
  }) {
    assert(lessonUpdated != null);
    return lessonUpdated(lesson);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result lessonUpdated(Lesson lesson),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lessonUpdated != null) {
      return lessonUpdated(lesson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result lessonUpdated(LessonUpdated value),
  }) {
    assert(lessonUpdated != null);
    return lessonUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result lessonUpdated(LessonUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lessonUpdated != null) {
      return lessonUpdated(this);
    }
    return orElse();
  }
}

abstract class LessonUpdated implements LessonEvent {
  const factory LessonUpdated({@required Lesson lesson}) = _$LessonUpdated;

  @override
  Lesson get lesson;
  @override
  $LessonUpdatedCopyWith<LessonUpdated> get copyWith;
}
