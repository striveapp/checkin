// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lesson_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LessonStateTearOff {
  const _$LessonStateTearOff();

// ignore: unused_element
  LessonUninitialized lessonUninitialized() {
    return const LessonUninitialized();
  }

// ignore: unused_element
  LessonLoaded lessonLoaded({@required Lesson lesson}) {
    return LessonLoaded(
      lesson: lesson,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonState = _$LessonStateTearOff();

/// @nodoc
mixin _$LessonState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result lessonUninitialized(),
    @required Result lessonLoaded(Lesson lesson),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result lessonUninitialized(),
    Result lessonLoaded(Lesson lesson),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result lessonUninitialized(LessonUninitialized value),
    @required Result lessonLoaded(LessonLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result lessonUninitialized(LessonUninitialized value),
    Result lessonLoaded(LessonLoaded value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $LessonStateCopyWith<$Res> {
  factory $LessonStateCopyWith(
          LessonState value, $Res Function(LessonState) then) =
      _$LessonStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonStateCopyWithImpl<$Res> implements $LessonStateCopyWith<$Res> {
  _$LessonStateCopyWithImpl(this._value, this._then);

  final LessonState _value;
  // ignore: unused_field
  final $Res Function(LessonState) _then;
}

/// @nodoc
abstract class $LessonUninitializedCopyWith<$Res> {
  factory $LessonUninitializedCopyWith(
          LessonUninitialized value, $Res Function(LessonUninitialized) then) =
      _$LessonUninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonUninitializedCopyWithImpl<$Res>
    extends _$LessonStateCopyWithImpl<$Res>
    implements $LessonUninitializedCopyWith<$Res> {
  _$LessonUninitializedCopyWithImpl(
      LessonUninitialized _value, $Res Function(LessonUninitialized) _then)
      : super(_value, (v) => _then(v as LessonUninitialized));

  @override
  LessonUninitialized get _value => super._value as LessonUninitialized;
}

/// @nodoc
class _$LessonUninitialized
    with DiagnosticableTreeMixin
    implements LessonUninitialized {
  const _$LessonUninitialized();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonState.lessonUninitialized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonState.lessonUninitialized'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LessonUninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result lessonUninitialized(),
    @required Result lessonLoaded(Lesson lesson),
  }) {
    assert(lessonUninitialized != null);
    assert(lessonLoaded != null);
    return lessonUninitialized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result lessonUninitialized(),
    Result lessonLoaded(Lesson lesson),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lessonUninitialized != null) {
      return lessonUninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result lessonUninitialized(LessonUninitialized value),
    @required Result lessonLoaded(LessonLoaded value),
  }) {
    assert(lessonUninitialized != null);
    assert(lessonLoaded != null);
    return lessonUninitialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result lessonUninitialized(LessonUninitialized value),
    Result lessonLoaded(LessonLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lessonUninitialized != null) {
      return lessonUninitialized(this);
    }
    return orElse();
  }
}

abstract class LessonUninitialized implements LessonState {
  const factory LessonUninitialized() = _$LessonUninitialized;
}

/// @nodoc
abstract class $LessonLoadedCopyWith<$Res> {
  factory $LessonLoadedCopyWith(
          LessonLoaded value, $Res Function(LessonLoaded) then) =
      _$LessonLoadedCopyWithImpl<$Res>;
  $Res call({Lesson lesson});

  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class _$LessonLoadedCopyWithImpl<$Res> extends _$LessonStateCopyWithImpl<$Res>
    implements $LessonLoadedCopyWith<$Res> {
  _$LessonLoadedCopyWithImpl(
      LessonLoaded _value, $Res Function(LessonLoaded) _then)
      : super(_value, (v) => _then(v as LessonLoaded));

  @override
  LessonLoaded get _value => super._value as LessonLoaded;

  @override
  $Res call({
    Object lesson = freezed,
  }) {
    return _then(LessonLoaded(
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
class _$LessonLoaded with DiagnosticableTreeMixin implements LessonLoaded {
  const _$LessonLoaded({@required this.lesson}) : assert(lesson != null);

  @override
  final Lesson lesson;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonState.lessonLoaded(lesson: $lesson)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonState.lessonLoaded'))
      ..add(DiagnosticsProperty('lesson', lesson));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonLoaded &&
            (identical(other.lesson, lesson) ||
                const DeepCollectionEquality().equals(other.lesson, lesson)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lesson);

  @override
  $LessonLoadedCopyWith<LessonLoaded> get copyWith =>
      _$LessonLoadedCopyWithImpl<LessonLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result lessonUninitialized(),
    @required Result lessonLoaded(Lesson lesson),
  }) {
    assert(lessonUninitialized != null);
    assert(lessonLoaded != null);
    return lessonLoaded(lesson);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result lessonUninitialized(),
    Result lessonLoaded(Lesson lesson),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lessonLoaded != null) {
      return lessonLoaded(lesson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result lessonUninitialized(LessonUninitialized value),
    @required Result lessonLoaded(LessonLoaded value),
  }) {
    assert(lessonUninitialized != null);
    assert(lessonLoaded != null);
    return lessonLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result lessonUninitialized(LessonUninitialized value),
    Result lessonLoaded(LessonLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lessonLoaded != null) {
      return lessonLoaded(this);
    }
    return orElse();
  }
}

abstract class LessonLoaded implements LessonState {
  const factory LessonLoaded({@required Lesson lesson}) = _$LessonLoaded;

  Lesson get lesson;
  $LessonLoadedCopyWith<LessonLoaded> get copyWith;
}
