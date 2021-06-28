// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'lesson_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LessonFilterStateTearOff {
  const _$LessonFilterStateTearOff();

  InitialLessonFilterState initialLessonFilterState() {
    return const InitialLessonFilterState();
  }

  LessonFilterLoaded lessonFilterLoaded(
      {required List<String?> availableLessonTypes}) {
    return LessonFilterLoaded(
      availableLessonTypes: availableLessonTypes,
    );
  }
}

/// @nodoc
const $LessonFilterState = _$LessonFilterStateTearOff();

/// @nodoc
mixin _$LessonFilterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialLessonFilterState,
    required TResult Function(List<String?> availableLessonTypes)
        lessonFilterLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialLessonFilterState,
    TResult Function(List<String?> availableLessonTypes)? lessonFilterLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialLessonFilterState value)
        initialLessonFilterState,
    required TResult Function(LessonFilterLoaded value) lessonFilterLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLessonFilterState value)? initialLessonFilterState,
    TResult Function(LessonFilterLoaded value)? lessonFilterLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonFilterStateCopyWith<$Res> {
  factory $LessonFilterStateCopyWith(
          LessonFilterState value, $Res Function(LessonFilterState) then) =
      _$LessonFilterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonFilterStateCopyWithImpl<$Res>
    implements $LessonFilterStateCopyWith<$Res> {
  _$LessonFilterStateCopyWithImpl(this._value, this._then);

  final LessonFilterState _value;
  // ignore: unused_field
  final $Res Function(LessonFilterState) _then;
}

/// @nodoc
abstract class $InitialLessonFilterStateCopyWith<$Res> {
  factory $InitialLessonFilterStateCopyWith(InitialLessonFilterState value,
          $Res Function(InitialLessonFilterState) then) =
      _$InitialLessonFilterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialLessonFilterStateCopyWithImpl<$Res>
    extends _$LessonFilterStateCopyWithImpl<$Res>
    implements $InitialLessonFilterStateCopyWith<$Res> {
  _$InitialLessonFilterStateCopyWithImpl(InitialLessonFilterState _value,
      $Res Function(InitialLessonFilterState) _then)
      : super(_value, (v) => _then(v as InitialLessonFilterState));

  @override
  InitialLessonFilterState get _value =>
      super._value as InitialLessonFilterState;
}

/// @nodoc

class _$InitialLessonFilterState
    with DiagnosticableTreeMixin
    implements InitialLessonFilterState {
  const _$InitialLessonFilterState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonFilterState.initialLessonFilterState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'LessonFilterState.initialLessonFilterState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialLessonFilterState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialLessonFilterState,
    required TResult Function(List<String?> availableLessonTypes)
        lessonFilterLoaded,
  }) {
    return initialLessonFilterState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialLessonFilterState,
    TResult Function(List<String?> availableLessonTypes)? lessonFilterLoaded,
    required TResult orElse(),
  }) {
    if (initialLessonFilterState != null) {
      return initialLessonFilterState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialLessonFilterState value)
        initialLessonFilterState,
    required TResult Function(LessonFilterLoaded value) lessonFilterLoaded,
  }) {
    return initialLessonFilterState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLessonFilterState value)? initialLessonFilterState,
    TResult Function(LessonFilterLoaded value)? lessonFilterLoaded,
    required TResult orElse(),
  }) {
    if (initialLessonFilterState != null) {
      return initialLessonFilterState(this);
    }
    return orElse();
  }
}

abstract class InitialLessonFilterState implements LessonFilterState {
  const factory InitialLessonFilterState() = _$InitialLessonFilterState;
}

/// @nodoc
abstract class $LessonFilterLoadedCopyWith<$Res> {
  factory $LessonFilterLoadedCopyWith(
          LessonFilterLoaded value, $Res Function(LessonFilterLoaded) then) =
      _$LessonFilterLoadedCopyWithImpl<$Res>;
  $Res call({List<String?> availableLessonTypes});
}

/// @nodoc
class _$LessonFilterLoadedCopyWithImpl<$Res>
    extends _$LessonFilterStateCopyWithImpl<$Res>
    implements $LessonFilterLoadedCopyWith<$Res> {
  _$LessonFilterLoadedCopyWithImpl(
      LessonFilterLoaded _value, $Res Function(LessonFilterLoaded) _then)
      : super(_value, (v) => _then(v as LessonFilterLoaded));

  @override
  LessonFilterLoaded get _value => super._value as LessonFilterLoaded;

  @override
  $Res call({
    Object? availableLessonTypes = freezed,
  }) {
    return _then(LessonFilterLoaded(
      availableLessonTypes: availableLessonTypes == freezed
          ? _value.availableLessonTypes
          : availableLessonTypes // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc

class _$LessonFilterLoaded
    with DiagnosticableTreeMixin
    implements LessonFilterLoaded {
  const _$LessonFilterLoaded({required this.availableLessonTypes});

  @override
  final List<String?> availableLessonTypes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonFilterState.lessonFilterLoaded(availableLessonTypes: $availableLessonTypes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonFilterState.lessonFilterLoaded'))
      ..add(DiagnosticsProperty('availableLessonTypes', availableLessonTypes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonFilterLoaded &&
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
  $LessonFilterLoadedCopyWith<LessonFilterLoaded> get copyWith =>
      _$LessonFilterLoadedCopyWithImpl<LessonFilterLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialLessonFilterState,
    required TResult Function(List<String?> availableLessonTypes)
        lessonFilterLoaded,
  }) {
    return lessonFilterLoaded(availableLessonTypes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialLessonFilterState,
    TResult Function(List<String?> availableLessonTypes)? lessonFilterLoaded,
    required TResult orElse(),
  }) {
    if (lessonFilterLoaded != null) {
      return lessonFilterLoaded(availableLessonTypes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialLessonFilterState value)
        initialLessonFilterState,
    required TResult Function(LessonFilterLoaded value) lessonFilterLoaded,
  }) {
    return lessonFilterLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLessonFilterState value)? initialLessonFilterState,
    TResult Function(LessonFilterLoaded value)? lessonFilterLoaded,
    required TResult orElse(),
  }) {
    if (lessonFilterLoaded != null) {
      return lessonFilterLoaded(this);
    }
    return orElse();
  }
}

abstract class LessonFilterLoaded implements LessonFilterState {
  const factory LessonFilterLoaded(
      {required List<String?> availableLessonTypes}) = _$LessonFilterLoaded;

  List<String?> get availableLessonTypes => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonFilterLoadedCopyWith<LessonFilterLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
