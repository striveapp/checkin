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
  InitializeLessons initializeLessons() {
    return const InitializeLessons();
  }

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

// ignore: unused_element
  CreateLesson createLesson({DateTime selectedDay}) {
    return CreateLesson(
      selectedDay: selectedDay,
    );
  }

// ignore: unused_element
  UpdateCalendar updateCalendar({bool fromNextWeek}) {
    return UpdateCalendar(
      fromNextWeek: fromNextWeek,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonsEvent = _$LessonsEventTearOff();

/// @nodoc
mixin _$LessonsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessons(),
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
    @required TResult createLesson(DateTime selectedDay),
    @required TResult updateCalendar(bool fromNextWeek),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessons(),
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    TResult createLesson(DateTime selectedDay),
    TResult updateCalendar(bool fromNextWeek),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLessons(InitializeLessons value),
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
    @required TResult createLesson(CreateLesson value),
    @required TResult updateCalendar(UpdateCalendar value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessons(InitializeLessons value),
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    TResult createLesson(CreateLesson value),
    TResult updateCalendar(UpdateCalendar value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LessonsEventCopyWith<$Res> {
  factory $LessonsEventCopyWith(
          LessonsEvent value, $Res Function(LessonsEvent) then) =
      _$LessonsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonsEventCopyWithImpl<$Res> implements $LessonsEventCopyWith<$Res> {
  _$LessonsEventCopyWithImpl(this._value, this._then);

  final LessonsEvent _value;
  // ignore: unused_field
  final $Res Function(LessonsEvent) _then;
}

/// @nodoc
abstract class $InitializeLessonsCopyWith<$Res> {
  factory $InitializeLessonsCopyWith(
          InitializeLessons value, $Res Function(InitializeLessons) then) =
      _$InitializeLessonsCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeLessonsCopyWithImpl<$Res>
    extends _$LessonsEventCopyWithImpl<$Res>
    implements $InitializeLessonsCopyWith<$Res> {
  _$InitializeLessonsCopyWithImpl(
      InitializeLessons _value, $Res Function(InitializeLessons) _then)
      : super(_value, (v) => _then(v as InitializeLessons));

  @override
  InitializeLessons get _value => super._value as InitializeLessons;
}

/// @nodoc
class _$InitializeLessons
    with DiagnosticableTreeMixin
    implements InitializeLessons {
  const _$InitializeLessons();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsEvent.initializeLessons()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsEvent.initializeLessons'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeLessons);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessons(),
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
    @required TResult createLesson(DateTime selectedDay),
    @required TResult updateCalendar(bool fromNextWeek),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return initializeLessons();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessons(),
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    TResult createLesson(DateTime selectedDay),
    TResult updateCalendar(bool fromNextWeek),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeLessons != null) {
      return initializeLessons();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLessons(InitializeLessons value),
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
    @required TResult createLesson(CreateLesson value),
    @required TResult updateCalendar(UpdateCalendar value),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return initializeLessons(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessons(InitializeLessons value),
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    TResult createLesson(CreateLesson value),
    TResult updateCalendar(UpdateCalendar value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeLessons != null) {
      return initializeLessons(this);
    }
    return orElse();
  }
}

abstract class InitializeLessons implements LessonsEvent {
  const factory InitializeLessons() = _$InitializeLessons;
}

/// @nodoc
abstract class $LessonsUpdatedCopyWith<$Res> {
  factory $LessonsUpdatedCopyWith(
          LessonsUpdated value, $Res Function(LessonsUpdated) then) =
      _$LessonsUpdatedCopyWithImpl<$Res>;
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

  @JsonKey(ignore: true)
  @override
  $LessonsUpdatedCopyWith<LessonsUpdated> get copyWith =>
      _$LessonsUpdatedCopyWithImpl<LessonsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessons(),
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
    @required TResult createLesson(DateTime selectedDay),
    @required TResult updateCalendar(bool fromNextWeek),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return lessonsUpdated(selectedDay, lessons, selectedFilterList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessons(),
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    TResult createLesson(DateTime selectedDay),
    TResult updateCalendar(bool fromNextWeek),
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
    @required TResult initializeLessons(InitializeLessons value),
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
    @required TResult createLesson(CreateLesson value),
    @required TResult updateCalendar(UpdateCalendar value),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return lessonsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessons(InitializeLessons value),
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    TResult createLesson(CreateLesson value),
    TResult updateCalendar(UpdateCalendar value),
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

  DateTime get selectedDay;
  List<Lesson> get lessons;
  List<String> get selectedFilterList;
  @JsonKey(ignore: true)
  $LessonsUpdatedCopyWith<LessonsUpdated> get copyWith;
}

/// @nodoc
abstract class $LoadLessonsCopyWith<$Res> {
  factory $LoadLessonsCopyWith(
          LoadLessons value, $Res Function(LoadLessons) then) =
      _$LoadLessonsCopyWithImpl<$Res>;
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

  @JsonKey(ignore: true)
  @override
  $LoadLessonsCopyWith<LoadLessons> get copyWith =>
      _$LoadLessonsCopyWithImpl<LoadLessons>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessons(),
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
    @required TResult createLesson(DateTime selectedDay),
    @required TResult updateCalendar(bool fromNextWeek),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return loadLessons(selectedDay, selectedFilterList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessons(),
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    TResult createLesson(DateTime selectedDay),
    TResult updateCalendar(bool fromNextWeek),
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
    @required TResult initializeLessons(InitializeLessons value),
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
    @required TResult createLesson(CreateLesson value),
    @required TResult updateCalendar(UpdateCalendar value),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return loadLessons(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessons(InitializeLessons value),
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    TResult createLesson(CreateLesson value),
    TResult updateCalendar(UpdateCalendar value),
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

  DateTime get selectedDay;
  List<String> get selectedFilterList;
  @JsonKey(ignore: true)
  $LoadLessonsCopyWith<LoadLessons> get copyWith;
}

/// @nodoc
abstract class $CreateLessonCopyWith<$Res> {
  factory $CreateLessonCopyWith(
          CreateLesson value, $Res Function(CreateLesson) then) =
      _$CreateLessonCopyWithImpl<$Res>;
  $Res call({DateTime selectedDay});
}

/// @nodoc
class _$CreateLessonCopyWithImpl<$Res> extends _$LessonsEventCopyWithImpl<$Res>
    implements $CreateLessonCopyWith<$Res> {
  _$CreateLessonCopyWithImpl(
      CreateLesson _value, $Res Function(CreateLesson) _then)
      : super(_value, (v) => _then(v as CreateLesson));

  @override
  CreateLesson get _value => super._value as CreateLesson;

  @override
  $Res call({
    Object selectedDay = freezed,
  }) {
    return _then(CreateLesson(
      selectedDay:
          selectedDay == freezed ? _value.selectedDay : selectedDay as DateTime,
    ));
  }
}

/// @nodoc
class _$CreateLesson with DiagnosticableTreeMixin implements CreateLesson {
  const _$CreateLesson({this.selectedDay});

  @override
  final DateTime selectedDay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsEvent.createLesson(selectedDay: $selectedDay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsEvent.createLesson'))
      ..add(DiagnosticsProperty('selectedDay', selectedDay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateLesson &&
            (identical(other.selectedDay, selectedDay) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDay, selectedDay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selectedDay);

  @JsonKey(ignore: true)
  @override
  $CreateLessonCopyWith<CreateLesson> get copyWith =>
      _$CreateLessonCopyWithImpl<CreateLesson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessons(),
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
    @required TResult createLesson(DateTime selectedDay),
    @required TResult updateCalendar(bool fromNextWeek),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return createLesson(selectedDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessons(),
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    TResult createLesson(DateTime selectedDay),
    TResult updateCalendar(bool fromNextWeek),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (createLesson != null) {
      return createLesson(selectedDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLessons(InitializeLessons value),
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
    @required TResult createLesson(CreateLesson value),
    @required TResult updateCalendar(UpdateCalendar value),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return createLesson(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessons(InitializeLessons value),
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    TResult createLesson(CreateLesson value),
    TResult updateCalendar(UpdateCalendar value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (createLesson != null) {
      return createLesson(this);
    }
    return orElse();
  }
}

abstract class CreateLesson implements LessonsEvent {
  const factory CreateLesson({DateTime selectedDay}) = _$CreateLesson;

  DateTime get selectedDay;
  @JsonKey(ignore: true)
  $CreateLessonCopyWith<CreateLesson> get copyWith;
}

/// @nodoc
abstract class $UpdateCalendarCopyWith<$Res> {
  factory $UpdateCalendarCopyWith(
          UpdateCalendar value, $Res Function(UpdateCalendar) then) =
      _$UpdateCalendarCopyWithImpl<$Res>;
  $Res call({bool fromNextWeek});
}

/// @nodoc
class _$UpdateCalendarCopyWithImpl<$Res>
    extends _$LessonsEventCopyWithImpl<$Res>
    implements $UpdateCalendarCopyWith<$Res> {
  _$UpdateCalendarCopyWithImpl(
      UpdateCalendar _value, $Res Function(UpdateCalendar) _then)
      : super(_value, (v) => _then(v as UpdateCalendar));

  @override
  UpdateCalendar get _value => super._value as UpdateCalendar;

  @override
  $Res call({
    Object fromNextWeek = freezed,
  }) {
    return _then(UpdateCalendar(
      fromNextWeek:
          fromNextWeek == freezed ? _value.fromNextWeek : fromNextWeek as bool,
    ));
  }
}

/// @nodoc
class _$UpdateCalendar with DiagnosticableTreeMixin implements UpdateCalendar {
  const _$UpdateCalendar({this.fromNextWeek});

  @override
  final bool fromNextWeek;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsEvent.updateCalendar(fromNextWeek: $fromNextWeek)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsEvent.updateCalendar'))
      ..add(DiagnosticsProperty('fromNextWeek', fromNextWeek));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateCalendar &&
            (identical(other.fromNextWeek, fromNextWeek) ||
                const DeepCollectionEquality()
                    .equals(other.fromNextWeek, fromNextWeek)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(fromNextWeek);

  @JsonKey(ignore: true)
  @override
  $UpdateCalendarCopyWith<UpdateCalendar> get copyWith =>
      _$UpdateCalendarCopyWithImpl<UpdateCalendar>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessons(),
    @required
        TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
            List<String> selectedFilterList),
    @required
        TResult loadLessons(
            DateTime selectedDay, List<String> selectedFilterList),
    @required TResult createLesson(DateTime selectedDay),
    @required TResult updateCalendar(bool fromNextWeek),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return updateCalendar(fromNextWeek);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessons(),
    TResult lessonsUpdated(DateTime selectedDay, List<Lesson> lessons,
        List<String> selectedFilterList),
    TResult loadLessons(DateTime selectedDay, List<String> selectedFilterList),
    TResult createLesson(DateTime selectedDay),
    TResult updateCalendar(bool fromNextWeek),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateCalendar != null) {
      return updateCalendar(fromNextWeek);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLessons(InitializeLessons value),
    @required TResult lessonsUpdated(LessonsUpdated value),
    @required TResult loadLessons(LoadLessons value),
    @required TResult createLesson(CreateLesson value),
    @required TResult updateCalendar(UpdateCalendar value),
  }) {
    assert(initializeLessons != null);
    assert(lessonsUpdated != null);
    assert(loadLessons != null);
    assert(createLesson != null);
    assert(updateCalendar != null);
    return updateCalendar(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessons(InitializeLessons value),
    TResult lessonsUpdated(LessonsUpdated value),
    TResult loadLessons(LoadLessons value),
    TResult createLesson(CreateLesson value),
    TResult updateCalendar(UpdateCalendar value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateCalendar != null) {
      return updateCalendar(this);
    }
    return orElse();
  }
}

abstract class UpdateCalendar implements LessonsEvent {
  const factory UpdateCalendar({bool fromNextWeek}) = _$UpdateCalendar;

  bool get fromNextWeek;
  @JsonKey(ignore: true)
  $UpdateCalendarCopyWith<UpdateCalendar> get copyWith;
}
