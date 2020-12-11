// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lessons_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LessonsStateTearOff {
  const _$LessonsStateTearOff();

// ignore: unused_element
  LessonsUninitialized lessonsUninitialized() {
    return const LessonsUninitialized();
  }

// ignore: unused_element
  LessonsError lessonsError() {
    return const LessonsError();
  }

// ignore: unused_element
  LessonsLoaded lessonsLoaded(
      {List<Lesson> lessons,
      DateTime selectedDay,
      List<String> selectedFilterList = const []}) {
    return LessonsLoaded(
      lessons: lessons,
      selectedDay: selectedDay,
      selectedFilterList: selectedFilterList,
    );
  }

// ignore: unused_element
  LessonsLoadedEmpty lessonsLoadedEmpty(
      {DateTime selectedDay, List<String> selectedFilterList = const []}) {
    return LessonsLoadedEmpty(
      selectedDay: selectedDay,
      selectedFilterList: selectedFilterList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonsState = _$LessonsStateTearOff();

/// @nodoc
mixin _$LessonsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonsUninitialized(),
    @required TResult lessonsError(),
    @required
        TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
            List<String> selectedFilterList),
    @required
        TResult lessonsLoadedEmpty(
            DateTime selectedDay, List<String> selectedFilterList),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsUninitialized(),
    TResult lessonsError(),
    TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
        List<String> selectedFilterList),
    TResult lessonsLoadedEmpty(
        DateTime selectedDay, List<String> selectedFilterList),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsUninitialized(LessonsUninitialized value),
    @required TResult lessonsError(LessonsError value),
    @required TResult lessonsLoaded(LessonsLoaded value),
    @required TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsUninitialized(LessonsUninitialized value),
    TResult lessonsError(LessonsError value),
    TResult lessonsLoaded(LessonsLoaded value),
    TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
    @required TResult orElse(),
  });
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
  TResult when<TResult extends Object>({
    @required TResult lessonsUninitialized(),
    @required TResult lessonsError(),
    @required
        TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
            List<String> selectedFilterList),
    @required
        TResult lessonsLoadedEmpty(
            DateTime selectedDay, List<String> selectedFilterList),
  }) {
    assert(lessonsUninitialized != null);
    assert(lessonsError != null);
    assert(lessonsLoaded != null);
    assert(lessonsLoadedEmpty != null);
    return lessonsUninitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsUninitialized(),
    TResult lessonsError(),
    TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
        List<String> selectedFilterList),
    TResult lessonsLoadedEmpty(
        DateTime selectedDay, List<String> selectedFilterList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsUninitialized != null) {
      return lessonsUninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsUninitialized(LessonsUninitialized value),
    @required TResult lessonsError(LessonsError value),
    @required TResult lessonsLoaded(LessonsLoaded value),
    @required TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
  }) {
    assert(lessonsUninitialized != null);
    assert(lessonsError != null);
    assert(lessonsLoaded != null);
    assert(lessonsLoadedEmpty != null);
    return lessonsUninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsUninitialized(LessonsUninitialized value),
    TResult lessonsError(LessonsError value),
    TResult lessonsLoaded(LessonsLoaded value),
    TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $LessonsErrorCopyWith<$Res> {
  factory $LessonsErrorCopyWith(
          LessonsError value, $Res Function(LessonsError) then) =
      _$LessonsErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonsErrorCopyWithImpl<$Res> extends _$LessonsStateCopyWithImpl<$Res>
    implements $LessonsErrorCopyWith<$Res> {
  _$LessonsErrorCopyWithImpl(
      LessonsError _value, $Res Function(LessonsError) _then)
      : super(_value, (v) => _then(v as LessonsError));

  @override
  LessonsError get _value => super._value as LessonsError;
}

/// @nodoc
class _$LessonsError with DiagnosticableTreeMixin implements LessonsError {
  const _$LessonsError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsState.lessonsError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LessonsState.lessonsError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LessonsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonsUninitialized(),
    @required TResult lessonsError(),
    @required
        TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
            List<String> selectedFilterList),
    @required
        TResult lessonsLoadedEmpty(
            DateTime selectedDay, List<String> selectedFilterList),
  }) {
    assert(lessonsUninitialized != null);
    assert(lessonsError != null);
    assert(lessonsLoaded != null);
    assert(lessonsLoadedEmpty != null);
    return lessonsError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsUninitialized(),
    TResult lessonsError(),
    TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
        List<String> selectedFilterList),
    TResult lessonsLoadedEmpty(
        DateTime selectedDay, List<String> selectedFilterList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsError != null) {
      return lessonsError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsUninitialized(LessonsUninitialized value),
    @required TResult lessonsError(LessonsError value),
    @required TResult lessonsLoaded(LessonsLoaded value),
    @required TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
  }) {
    assert(lessonsUninitialized != null);
    assert(lessonsError != null);
    assert(lessonsLoaded != null);
    assert(lessonsLoadedEmpty != null);
    return lessonsError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsUninitialized(LessonsUninitialized value),
    TResult lessonsError(LessonsError value),
    TResult lessonsLoaded(LessonsLoaded value),
    TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsError != null) {
      return lessonsError(this);
    }
    return orElse();
  }
}

abstract class LessonsError implements LessonsState {
  const factory LessonsError() = _$LessonsError;
}

/// @nodoc
abstract class $LessonsLoadedCopyWith<$Res> {
  factory $LessonsLoadedCopyWith(
          LessonsLoaded value, $Res Function(LessonsLoaded) then) =
      _$LessonsLoadedCopyWithImpl<$Res>;
  $Res call(
      {List<Lesson> lessons,
      DateTime selectedDay,
      List<String> selectedFilterList});
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
    Object lessons = freezed,
    Object selectedDay = freezed,
    Object selectedFilterList = freezed,
  }) {
    return _then(LessonsLoaded(
      lessons: lessons == freezed ? _value.lessons : lessons as List<Lesson>,
      selectedDay:
          selectedDay == freezed ? _value.selectedDay : selectedDay as DateTime,
      selectedFilterList: selectedFilterList == freezed
          ? _value.selectedFilterList
          : selectedFilterList as List<String>,
    ));
  }
}

/// @nodoc
class _$LessonsLoaded with DiagnosticableTreeMixin implements LessonsLoaded {
  const _$LessonsLoaded(
      {this.lessons, this.selectedDay, this.selectedFilterList = const []})
      : assert(selectedFilterList != null);

  @override
  final List<Lesson> lessons;
  @override
  final DateTime selectedDay;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> selectedFilterList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsState.lessonsLoaded(lessons: $lessons, selectedDay: $selectedDay, selectedFilterList: $selectedFilterList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsState.lessonsLoaded'))
      ..add(DiagnosticsProperty('lessons', lessons))
      ..add(DiagnosticsProperty('selectedDay', selectedDay))
      ..add(DiagnosticsProperty('selectedFilterList', selectedFilterList));
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
                    .equals(other.selectedFilterList, selectedFilterList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lessons) ^
      const DeepCollectionEquality().hash(selectedDay) ^
      const DeepCollectionEquality().hash(selectedFilterList);

  @override
  $LessonsLoadedCopyWith<LessonsLoaded> get copyWith =>
      _$LessonsLoadedCopyWithImpl<LessonsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonsUninitialized(),
    @required TResult lessonsError(),
    @required
        TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
            List<String> selectedFilterList),
    @required
        TResult lessonsLoadedEmpty(
            DateTime selectedDay, List<String> selectedFilterList),
  }) {
    assert(lessonsUninitialized != null);
    assert(lessonsError != null);
    assert(lessonsLoaded != null);
    assert(lessonsLoadedEmpty != null);
    return lessonsLoaded(lessons, selectedDay, selectedFilterList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsUninitialized(),
    TResult lessonsError(),
    TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
        List<String> selectedFilterList),
    TResult lessonsLoadedEmpty(
        DateTime selectedDay, List<String> selectedFilterList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsLoaded != null) {
      return lessonsLoaded(lessons, selectedDay, selectedFilterList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsUninitialized(LessonsUninitialized value),
    @required TResult lessonsError(LessonsError value),
    @required TResult lessonsLoaded(LessonsLoaded value),
    @required TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
  }) {
    assert(lessonsUninitialized != null);
    assert(lessonsError != null);
    assert(lessonsLoaded != null);
    assert(lessonsLoadedEmpty != null);
    return lessonsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsUninitialized(LessonsUninitialized value),
    TResult lessonsError(LessonsError value),
    TResult lessonsLoaded(LessonsLoaded value),
    TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsLoaded != null) {
      return lessonsLoaded(this);
    }
    return orElse();
  }
}

abstract class LessonsLoaded implements LessonsState {
  const factory LessonsLoaded(
      {List<Lesson> lessons,
      DateTime selectedDay,
      List<String> selectedFilterList}) = _$LessonsLoaded;

  List<Lesson> get lessons;
  DateTime get selectedDay;
  List<String> get selectedFilterList;
  $LessonsLoadedCopyWith<LessonsLoaded> get copyWith;
}

/// @nodoc
abstract class $LessonsLoadedEmptyCopyWith<$Res> {
  factory $LessonsLoadedEmptyCopyWith(
          LessonsLoadedEmpty value, $Res Function(LessonsLoadedEmpty) then) =
      _$LessonsLoadedEmptyCopyWithImpl<$Res>;
  $Res call({DateTime selectedDay, List<String> selectedFilterList});
}

/// @nodoc
class _$LessonsLoadedEmptyCopyWithImpl<$Res>
    extends _$LessonsStateCopyWithImpl<$Res>
    implements $LessonsLoadedEmptyCopyWith<$Res> {
  _$LessonsLoadedEmptyCopyWithImpl(
      LessonsLoadedEmpty _value, $Res Function(LessonsLoadedEmpty) _then)
      : super(_value, (v) => _then(v as LessonsLoadedEmpty));

  @override
  LessonsLoadedEmpty get _value => super._value as LessonsLoadedEmpty;

  @override
  $Res call({
    Object selectedDay = freezed,
    Object selectedFilterList = freezed,
  }) {
    return _then(LessonsLoadedEmpty(
      selectedDay:
          selectedDay == freezed ? _value.selectedDay : selectedDay as DateTime,
      selectedFilterList: selectedFilterList == freezed
          ? _value.selectedFilterList
          : selectedFilterList as List<String>,
    ));
  }
}

/// @nodoc
class _$LessonsLoadedEmpty
    with DiagnosticableTreeMixin
    implements LessonsLoadedEmpty {
  const _$LessonsLoadedEmpty(
      {this.selectedDay, this.selectedFilterList = const []})
      : assert(selectedFilterList != null);

  @override
  final DateTime selectedDay;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> selectedFilterList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsState.lessonsLoadedEmpty(selectedDay: $selectedDay, selectedFilterList: $selectedFilterList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsState.lessonsLoadedEmpty'))
      ..add(DiagnosticsProperty('selectedDay', selectedDay))
      ..add(DiagnosticsProperty('selectedFilterList', selectedFilterList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonsLoadedEmpty &&
            (identical(other.selectedDay, selectedDay) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDay, selectedDay)) &&
            (identical(other.selectedFilterList, selectedFilterList) ||
                const DeepCollectionEquality()
                    .equals(other.selectedFilterList, selectedFilterList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedDay) ^
      const DeepCollectionEquality().hash(selectedFilterList);

  @override
  $LessonsLoadedEmptyCopyWith<LessonsLoadedEmpty> get copyWith =>
      _$LessonsLoadedEmptyCopyWithImpl<LessonsLoadedEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonsUninitialized(),
    @required TResult lessonsError(),
    @required
        TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
            List<String> selectedFilterList),
    @required
        TResult lessonsLoadedEmpty(
            DateTime selectedDay, List<String> selectedFilterList),
  }) {
    assert(lessonsUninitialized != null);
    assert(lessonsError != null);
    assert(lessonsLoaded != null);
    assert(lessonsLoadedEmpty != null);
    return lessonsLoadedEmpty(selectedDay, selectedFilterList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsUninitialized(),
    TResult lessonsError(),
    TResult lessonsLoaded(List<Lesson> lessons, DateTime selectedDay,
        List<String> selectedFilterList),
    TResult lessonsLoadedEmpty(
        DateTime selectedDay, List<String> selectedFilterList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsLoadedEmpty != null) {
      return lessonsLoadedEmpty(selectedDay, selectedFilterList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsUninitialized(LessonsUninitialized value),
    @required TResult lessonsError(LessonsError value),
    @required TResult lessonsLoaded(LessonsLoaded value),
    @required TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
  }) {
    assert(lessonsUninitialized != null);
    assert(lessonsError != null);
    assert(lessonsLoaded != null);
    assert(lessonsLoadedEmpty != null);
    return lessonsLoadedEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsUninitialized(LessonsUninitialized value),
    TResult lessonsError(LessonsError value),
    TResult lessonsLoaded(LessonsLoaded value),
    TResult lessonsLoadedEmpty(LessonsLoadedEmpty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsLoadedEmpty != null) {
      return lessonsLoadedEmpty(this);
    }
    return orElse();
  }
}

abstract class LessonsLoadedEmpty implements LessonsState {
  const factory LessonsLoadedEmpty(
      {DateTime selectedDay,
      List<String> selectedFilterList}) = _$LessonsLoadedEmpty;

  DateTime get selectedDay;
  List<String> get selectedFilterList;
  $LessonsLoadedEmptyCopyWith<LessonsLoadedEmpty> get copyWith;
}
