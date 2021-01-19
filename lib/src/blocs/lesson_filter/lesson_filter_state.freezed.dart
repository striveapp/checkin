// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lesson_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LessonFilterStateTearOff {
  const _$LessonFilterStateTearOff();

// ignore: unused_element
  InitialLessonFilterState initialLessonFilterState() {
    return const InitialLessonFilterState();
  }

// ignore: unused_element
  LessonFilterLoaded lessonFilterLoaded({@required List<String> availableLessonTypes}) {
    return LessonFilterLoaded(
      availableLessonTypes: availableLessonTypes,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonFilterState = _$LessonFilterStateTearOff();

/// @nodoc
mixin _$LessonFilterState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialLessonFilterState(),
    @required TResult lessonFilterLoaded(List<String> availableLessonTypes),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialLessonFilterState(),
    TResult lessonFilterLoaded(List<String> availableLessonTypes),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialLessonFilterState(InitialLessonFilterState value),
    @required TResult lessonFilterLoaded(LessonFilterLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialLessonFilterState(InitialLessonFilterState value),
    TResult lessonFilterLoaded(LessonFilterLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LessonFilterStateCopyWith<$Res> {
  factory $LessonFilterStateCopyWith(
          LessonFilterState value, $Res Function(LessonFilterState) then) =
      _$LessonFilterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonFilterStateCopyWithImpl<$Res> implements $LessonFilterStateCopyWith<$Res> {
  _$LessonFilterStateCopyWithImpl(this._value, this._then);

  final LessonFilterState _value;
  // ignore: unused_field
  final $Res Function(LessonFilterState) _then;
}

/// @nodoc
abstract class $InitialLessonFilterStateCopyWith<$Res> {
  factory $InitialLessonFilterStateCopyWith(
          InitialLessonFilterState value, $Res Function(InitialLessonFilterState) then) =
      _$InitialLessonFilterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialLessonFilterStateCopyWithImpl<$Res> extends _$LessonFilterStateCopyWithImpl<$Res>
    implements $InitialLessonFilterStateCopyWith<$Res> {
  _$InitialLessonFilterStateCopyWithImpl(
      InitialLessonFilterState _value, $Res Function(InitialLessonFilterState) _then)
      : super(_value, (v) => _then(v as InitialLessonFilterState));

  @override
  InitialLessonFilterState get _value => super._value as InitialLessonFilterState;
}

/// @nodoc
class _$InitialLessonFilterState with DiagnosticableTreeMixin implements InitialLessonFilterState {
  const _$InitialLessonFilterState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonFilterState.initialLessonFilterState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LessonFilterState.initialLessonFilterState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialLessonFilterState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialLessonFilterState(),
    @required TResult lessonFilterLoaded(List<String> availableLessonTypes),
  }) {
    assert(initialLessonFilterState != null);
    assert(lessonFilterLoaded != null);
    return initialLessonFilterState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialLessonFilterState(),
    TResult lessonFilterLoaded(List<String> availableLessonTypes),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialLessonFilterState != null) {
      return initialLessonFilterState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialLessonFilterState(InitialLessonFilterState value),
    @required TResult lessonFilterLoaded(LessonFilterLoaded value),
  }) {
    assert(initialLessonFilterState != null);
    assert(lessonFilterLoaded != null);
    return initialLessonFilterState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialLessonFilterState(InitialLessonFilterState value),
    TResult lessonFilterLoaded(LessonFilterLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
  $Res call({List<String> availableLessonTypes});
}

/// @nodoc
class _$LessonFilterLoadedCopyWithImpl<$Res> extends _$LessonFilterStateCopyWithImpl<$Res>
    implements $LessonFilterLoadedCopyWith<$Res> {
  _$LessonFilterLoadedCopyWithImpl(
      LessonFilterLoaded _value, $Res Function(LessonFilterLoaded) _then)
      : super(_value, (v) => _then(v as LessonFilterLoaded));

  @override
  LessonFilterLoaded get _value => super._value as LessonFilterLoaded;

  @override
  $Res call({
    Object availableLessonTypes = freezed,
  }) {
    return _then(LessonFilterLoaded(
      availableLessonTypes: availableLessonTypes == freezed
          ? _value.availableLessonTypes
          : availableLessonTypes as List<String>,
    ));
  }
}

/// @nodoc
class _$LessonFilterLoaded with DiagnosticableTreeMixin implements LessonFilterLoaded {
  const _$LessonFilterLoaded({@required this.availableLessonTypes})
      : assert(availableLessonTypes != null);

  @override
  final List<String> availableLessonTypes;

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
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(availableLessonTypes);

  @override
  $LessonFilterLoadedCopyWith<LessonFilterLoaded> get copyWith =>
      _$LessonFilterLoadedCopyWithImpl<LessonFilterLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialLessonFilterState(),
    @required TResult lessonFilterLoaded(List<String> availableLessonTypes),
  }) {
    assert(initialLessonFilterState != null);
    assert(lessonFilterLoaded != null);
    return lessonFilterLoaded(availableLessonTypes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialLessonFilterState(),
    TResult lessonFilterLoaded(List<String> availableLessonTypes),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonFilterLoaded != null) {
      return lessonFilterLoaded(availableLessonTypes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialLessonFilterState(InitialLessonFilterState value),
    @required TResult lessonFilterLoaded(LessonFilterLoaded value),
  }) {
    assert(initialLessonFilterState != null);
    assert(lessonFilterLoaded != null);
    return lessonFilterLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialLessonFilterState(InitialLessonFilterState value),
    TResult lessonFilterLoaded(LessonFilterLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonFilterLoaded != null) {
      return lessonFilterLoaded(this);
    }
    return orElse();
  }
}

abstract class LessonFilterLoaded implements LessonFilterState {
  const factory LessonFilterLoaded({@required List<String> availableLessonTypes}) =
      _$LessonFilterLoaded;

  List<String> get availableLessonTypes;
  $LessonFilterLoadedCopyWith<LessonFilterLoaded> get copyWith;
}
