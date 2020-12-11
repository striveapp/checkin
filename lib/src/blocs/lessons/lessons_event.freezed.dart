// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lessons_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LessonsEventTearOff {
  const _$LessonsEventTearOff();

// ignore: unused_element
  LessonsUpdated lessonsUpdated(
      {DateTime selectedDay,
      List<Lesson> lessons,
      List<String> selectedFilterList = const []}) {
    return LessonsUpdated(
      selectedDay: selectedDay,
      lessons: lessons,
      selectedFilterList: selectedFilterList,
    );
  }

// ignore: unused_element
  LoadLessons loadLessons(
      {DateTime selectedDay, List<String> selectedFilterList}) {
    return LoadLessons(
      selectedDay: selectedDay,
      selectedFilterList: selectedFilterList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonsEvent = _$LessonsEventTearOff();

/// @nodoc
mixin _$LessonsEvent {
  DateTime get selectedDay;
  List<String> get selectedFilterList;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    @required TResult orElse(),
  });

  $LessonsEventCopyWith<LessonsEvent> get copyWith;
}

/// @nodoc
abstract class $LessonsEventCopyWith<$Res> {
  factory $LessonsEventCopyWith(
          LessonsEvent value, $Res Function(LessonsEvent) then) =
      _$LessonsEventCopyWithImpl<$Res>;
  $Res call({DateTime selectedDay, List<String> selectedFilterList});
}

/// @nodoc
class _$LessonsEventCopyWithImpl<$Res> implements $LessonsEventCopyWith<$Res> {
  _$LessonsEventCopyWithImpl(this._value, this._then);

  final LessonsEvent _value;
  // ignore: unused_field
  final $Res Function(LessonsEvent) _then;

  @override
  $Res call({
    Object selectedDay = freezed,
    Object selectedFilterList = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDay:
          selectedDay == freezed ? _value.selectedDay : selectedDay as DateTime,
      selectedFilterList: selectedFilterList == freezed
          ? _value.selectedFilterList
          : selectedFilterList as List<String>,
    ));
  }
}

/// @nodoc
abstract class $LessonsUpdatedCopyWith<$Res>
    implements $LessonsEventCopyWith<$Res> {
  factory $LessonsUpdatedCopyWith(
          LessonsUpdated value, $Res Function(LessonsUpdated) then) =
      _$LessonsUpdatedCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime selectedDay,
      List<Lesson> lessons,
      List<String> selectedFilterList});
}

/// @nodoc
class _$LessonsUpdatedCopyWithImpl<$Res>
    extends _$LessonsEventCopyWithImpl<$Res>
    implements $LessonsUpdatedCopyWith<$Res> {
  _$LessonsUpdatedCopyWithImpl(
      LessonsUpdated _value, $Res Function(LessonsUpdated) _then)
      : super(_value, (v) => _then(v as LessonsUpdated));

  @override
  LessonsUpdated get _value => super._value as LessonsUpdated;

  @override
  $Res call({
    Object selectedDay = freezed,
    Object lessons = freezed,
    Object selectedFilterList = freezed,
  }) {
    return _then(LessonsUpdated(
      selectedDay:
          selectedDay == freezed ? _value.selectedDay : selectedDay as DateTime,
      lessons: lessons == freezed ? _value.lessons : lessons as List<Lesson>,
      selectedFilterList: selectedFilterList == freezed
          ? _value.selectedFilterList
          : selectedFilterList as List<String>,
    ));
  }
}

/// @nodoc
class _$LessonsUpdated with DiagnosticableTreeMixin implements LessonsUpdated {
  const _$LessonsUpdated(
      {this.selectedDay, this.lessons, this.selectedFilterList = const []})
      : assert(selectedFilterList != null);

  @override
  final DateTime selectedDay;
  @override
  final List<Lesson> lessons;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> selectedFilterList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsEvent.lessonsUpdated(selectedDay: $selectedDay, lessons: $lessons, selectedFilterList: $selectedFilterList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsEvent.lessonsUpdated'))
      ..add(DiagnosticsProperty('selectedDay', selectedDay))
      ..add(DiagnosticsProperty('lessons', lessons))
      ..add(DiagnosticsProperty('selectedFilterList', selectedFilterList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonsUpdated &&
            (identical(other.selectedDay, selectedDay) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDay, selectedDay)) &&
            (identical(other.lessons, lessons) ||
                const DeepCollectionEquality()
                    .equals(other.lessons, lessons)) &&
            (identical(other.selectedFilterList, selectedFilterList) ||
                const DeepCollectionEquality()
                    .equals(other.selectedFilterList, selectedFilterList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedDay) ^
      const DeepCollectionEquality().hash(lessons) ^
      const DeepCollectionEquality().hash(selectedFilterList);

  @override
  $LessonsUpdatedCopyWith<LessonsUpdated> get copyWith =>
      _$LessonsUpdatedCopyWithImpl<LessonsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
  }) {
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    return lessonsUpdated(selectedDay, lessons, selectedFilterList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsUpdated != null) {
      return lessonsUpdated(selectedDay, lessons, selectedFilterList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
  }) {
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    return lessonsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsUpdated != null) {
      return lessonsUpdated(this);
    }
    return orElse();
  }
}

abstract class LessonsUpdated implements LessonsEvent {
  const factory LessonsUpdated(
      {DateTime selectedDay,
      List<Lesson> lessons,
      List<String> selectedFilterList}) = _$LessonsUpdated;

  @override
  DateTime get selectedDay;
  List<Lesson> get lessons;
  @override
  List<String> get selectedFilterList;
  @override
  $LessonsUpdatedCopyWith<LessonsUpdated> get copyWith;
}

/// @nodoc
abstract class $LoadLessonsCopyWith<$Res>
    implements $LessonsEventCopyWith<$Res> {
  factory $LoadLessonsCopyWith(
          LoadLessons value, $Res Function(LoadLessons) then) =
      _$LoadLessonsCopyWithImpl<$Res>;
  @override
  $Res call({DateTime selectedDay, List<String> selectedFilterList});
}

/// @nodoc
class _$LoadLessonsCopyWithImpl<$Res> extends _$LessonsEventCopyWithImpl<$Res>
    implements $LoadLessonsCopyWith<$Res> {
  _$LoadLessonsCopyWithImpl(
      LoadLessons _value, $Res Function(LoadLessons) _then)
      : super(_value, (v) => _then(v as LoadLessons));

  @override
  LoadLessons get _value => super._value as LoadLessons;

  @override
  $Res call({
    Object selectedDay = freezed,
    Object selectedFilterList = freezed,
  }) {
    return _then(LoadLessons(
      selectedDay:
          selectedDay == freezed ? _value.selectedDay : selectedDay as DateTime,
      selectedFilterList: selectedFilterList == freezed
          ? _value.selectedFilterList
          : selectedFilterList as List<String>,
    ));
  }
}

/// @nodoc
class _$LoadLessons with DiagnosticableTreeMixin implements LoadLessons {
  const _$LoadLessons({this.selectedDay, this.selectedFilterList});

  @override
  final DateTime selectedDay;
  @override
  final List<String> selectedFilterList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsEvent.loadLessons(selectedDay: $selectedDay, selectedFilterList: $selectedFilterList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsEvent.loadLessons'))
      ..add(DiagnosticsProperty('selectedDay', selectedDay))
      ..add(DiagnosticsProperty('selectedFilterList', selectedFilterList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadLessons &&
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
  $LoadLessonsCopyWith<LoadLessons> get copyWith =>
      _$LoadLessonsCopyWithImpl<LoadLessons>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
  }) {
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    return loadLessons(selectedDay, selectedFilterList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadLessons != null) {
      return loadLessons(selectedDay, selectedFilterList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
  }) {
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    return loadLessons(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadLessons != null) {
      return loadLessons(this);
    }
    return orElse();
  }
}

abstract class LoadLessons implements LessonsEvent {
  const factory LoadLessons(
      {DateTime selectedDay, List<String> selectedFilterList}) = _$LoadLessons;

  @override
  DateTime get selectedDay;
  @override
  List<String> get selectedFilterList;
  @override
  $LoadLessonsCopyWith<LoadLessons> get copyWith;
}
