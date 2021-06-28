// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'lessons_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LessonsStateTearOff {
  const _$LessonsStateTearOff();

  LessonsUninitialized lessonsUninitialized() {
    return const LessonsUninitialized();
  }

  LessonsLoaded lessonsLoaded(
      {List<Lesson>? lessons,
      DateTime? selectedDay,
      List<String> selectedFilterList = const [],
      DateTime? nocache}) {
    return LessonsLoaded(
      lessons: lessons,
      selectedDay: selectedDay,
      selectedFilterList: selectedFilterList,
      nocache: nocache,
    );
  }
}

/// @nodoc
const $LessonsState = _$LessonsStateTearOff();

/// @nodoc
mixin _$LessonsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() lessonsUninitialized,
    required TResult Function(List<Lesson>? lessons, DateTime? selectedDay,
            List<String> selectedFilterList, DateTime? nocache)
        lessonsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? lessonsUninitialized,
    TResult Function(List<Lesson>? lessons, DateTime? selectedDay,
            List<String> selectedFilterList, DateTime? nocache)?
        lessonsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonsUninitialized value) lessonsUninitialized,
    required TResult Function(LessonsLoaded value) lessonsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonsUninitialized value)? lessonsUninitialized,
    TResult Function(LessonsLoaded value)? lessonsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsStateCopyWith<$Res> {
  factory $LessonsStateCopyWith(
          LessonsState value, $Res Function(LessonsState) then) =
      _$LessonsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonsStateCopyWithImpl<$Res> implements $LessonsStateCopyWith<$Res> {
  _$LessonsStateCopyWithImpl(this._value, this._then);

  final LessonsState _value;
  // ignore: unused_field
  final $Res Function(LessonsState) _then;
}

/// @nodoc
abstract class $LessonsUninitializedCopyWith<$Res> {
  factory $LessonsUninitializedCopyWith(LessonsUninitialized value,
          $Res Function(LessonsUninitialized) then) =
      _$LessonsUninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonsUninitializedCopyWithImpl<$Res>
    extends _$LessonsStateCopyWithImpl<$Res>
    implements $LessonsUninitializedCopyWith<$Res> {
  _$LessonsUninitializedCopyWithImpl(
      LessonsUninitialized _value, $Res Function(LessonsUninitialized) _then)
      : super(_value, (v) => _then(v as LessonsUninitialized));

  @override
  LessonsUninitialized get _value => super._value as LessonsUninitialized;
}

/// @nodoc

class _$LessonsUninitialized
    with DiagnosticableTreeMixin
    implements LessonsUninitialized {
  const _$LessonsUninitialized();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsState.lessonsUninitialized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsState.lessonsUninitialized'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LessonsUninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() lessonsUninitialized,
    required TResult Function(List<Lesson>? lessons, DateTime? selectedDay,
            List<String> selectedFilterList, DateTime? nocache)
        lessonsLoaded,
  }) {
    return lessonsUninitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? lessonsUninitialized,
    TResult Function(List<Lesson>? lessons, DateTime? selectedDay,
            List<String> selectedFilterList, DateTime? nocache)?
        lessonsLoaded,
    required TResult orElse(),
  }) {
    if (lessonsUninitialized != null) {
      return lessonsUninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonsUninitialized value) lessonsUninitialized,
    required TResult Function(LessonsLoaded value) lessonsLoaded,
  }) {
    return lessonsUninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonsUninitialized value)? lessonsUninitialized,
    TResult Function(LessonsLoaded value)? lessonsLoaded,
    required TResult orElse(),
  }) {
    if (lessonsUninitialized != null) {
      return lessonsUninitialized(this);
    }
    return orElse();
  }
}

abstract class LessonsUninitialized implements LessonsState {
  const factory LessonsUninitialized() = _$LessonsUninitialized;
}

/// @nodoc
abstract class $LessonsLoadedCopyWith<$Res> {
  factory $LessonsLoadedCopyWith(
          LessonsLoaded value, $Res Function(LessonsLoaded) then) =
      _$LessonsLoadedCopyWithImpl<$Res>;
  $Res call(
      {List<Lesson>? lessons,
      DateTime? selectedDay,
      List<String> selectedFilterList,
      DateTime? nocache});
}

/// @nodoc
class _$LessonsLoadedCopyWithImpl<$Res> extends _$LessonsStateCopyWithImpl<$Res>
    implements $LessonsLoadedCopyWith<$Res> {
  _$LessonsLoadedCopyWithImpl(
      LessonsLoaded _value, $Res Function(LessonsLoaded) _then)
      : super(_value, (v) => _then(v as LessonsLoaded));

  @override
  LessonsLoaded get _value => super._value as LessonsLoaded;

  @override
  $Res call({
    Object? lessons = freezed,
    Object? selectedDay = freezed,
    Object? selectedFilterList = freezed,
    Object? nocache = freezed,
  }) {
    return _then(LessonsLoaded(
      lessons: lessons == freezed
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      selectedDay: selectedDay == freezed
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedFilterList: selectedFilterList == freezed
          ? _value.selectedFilterList
          : selectedFilterList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nocache: nocache == freezed
          ? _value.nocache
          : nocache // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LessonsLoaded with DiagnosticableTreeMixin implements LessonsLoaded {
  const _$LessonsLoaded(
      {this.lessons,
      this.selectedDay,
      this.selectedFilterList = const [],
      this.nocache});

  @override
  final List<Lesson>? lessons;
  @override
  final DateTime? selectedDay;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> selectedFilterList;
  @override
  final DateTime? nocache;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsState.lessonsLoaded(lessons: $lessons, selectedDay: $selectedDay, selectedFilterList: $selectedFilterList, nocache: $nocache)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsState.lessonsLoaded'))
      ..add(DiagnosticsProperty('lessons', lessons))
      ..add(DiagnosticsProperty('selectedDay', selectedDay))
      ..add(DiagnosticsProperty('selectedFilterList', selectedFilterList))
      ..add(DiagnosticsProperty('nocache', nocache));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonsLoaded &&
            (identical(other.lessons, lessons) ||
                const DeepCollectionEquality()
                    .equals(other.lessons, lessons)) &&
            (identical(other.selectedDay, selectedDay) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDay, selectedDay)) &&
            (identical(other.selectedFilterList, selectedFilterList) ||
                const DeepCollectionEquality()
                    .equals(other.selectedFilterList, selectedFilterList)) &&
            (identical(other.nocache, nocache) ||
                const DeepCollectionEquality().equals(other.nocache, nocache)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lessons) ^
      const DeepCollectionEquality().hash(selectedDay) ^
      const DeepCollectionEquality().hash(selectedFilterList) ^
      const DeepCollectionEquality().hash(nocache);

  @JsonKey(ignore: true)
  @override
  $LessonsLoadedCopyWith<LessonsLoaded> get copyWith =>
      _$LessonsLoadedCopyWithImpl<LessonsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() lessonsUninitialized,
    required TResult Function(List<Lesson>? lessons, DateTime? selectedDay,
            List<String> selectedFilterList, DateTime? nocache)
        lessonsLoaded,
  }) {
    return lessonsLoaded(lessons, selectedDay, selectedFilterList, nocache);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? lessonsUninitialized,
    TResult Function(List<Lesson>? lessons, DateTime? selectedDay,
            List<String> selectedFilterList, DateTime? nocache)?
        lessonsLoaded,
    required TResult orElse(),
  }) {
    if (lessonsLoaded != null) {
      return lessonsLoaded(lessons, selectedDay, selectedFilterList, nocache);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LessonsUninitialized value) lessonsUninitialized,
    required TResult Function(LessonsLoaded value) lessonsLoaded,
  }) {
    return lessonsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LessonsUninitialized value)? lessonsUninitialized,
    TResult Function(LessonsLoaded value)? lessonsLoaded,
    required TResult orElse(),
  }) {
    if (lessonsLoaded != null) {
      return lessonsLoaded(this);
    }
    return orElse();
  }
}

abstract class LessonsLoaded implements LessonsState {
  const factory LessonsLoaded(
      {List<Lesson>? lessons,
      DateTime? selectedDay,
      List<String> selectedFilterList,
      DateTime? nocache}) = _$LessonsLoaded;

  List<Lesson>? get lessons => throw _privateConstructorUsedError;
  DateTime? get selectedDay => throw _privateConstructorUsedError;
  List<String> get selectedFilterList => throw _privateConstructorUsedError;
  DateTime? get nocache => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonsLoadedCopyWith<LessonsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
