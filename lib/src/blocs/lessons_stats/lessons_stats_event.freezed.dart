// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lessons_stats_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LessonsStatsEventTearOff {
  const _$LessonsStatsEventTearOff();

// ignore: unused_element
  InitializeLessonsStats initializeLessonsStats() {
    return const InitializeLessonsStats();
  }

// ignore: unused_element
  UpdateLessonsStats updateLessonsStats({@required List<Lesson> lessons}) {
    return UpdateLessonsStats(
      lessons: lessons,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonsStatsEvent = _$LessonsStatsEventTearOff();

/// @nodoc
mixin _$LessonsStatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessonsStats(),
    @required TResult updateLessonsStats(List<Lesson> lessons),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessonsStats(),
    TResult updateLessonsStats(List<Lesson> lessons),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLessonsStats(InitializeLessonsStats value),
    @required TResult updateLessonsStats(UpdateLessonsStats value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessonsStats(InitializeLessonsStats value),
    TResult updateLessonsStats(UpdateLessonsStats value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LessonsStatsEventCopyWith<$Res> {
  factory $LessonsStatsEventCopyWith(
          LessonsStatsEvent value, $Res Function(LessonsStatsEvent) then) =
      _$LessonsStatsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonsStatsEventCopyWithImpl<$Res> implements $LessonsStatsEventCopyWith<$Res> {
  _$LessonsStatsEventCopyWithImpl(this._value, this._then);

  final LessonsStatsEvent _value;
  // ignore: unused_field
  final $Res Function(LessonsStatsEvent) _then;
}

/// @nodoc
abstract class $InitializeLessonsStatsCopyWith<$Res> {
  factory $InitializeLessonsStatsCopyWith(
          InitializeLessonsStats value, $Res Function(InitializeLessonsStats) then) =
      _$InitializeLessonsStatsCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeLessonsStatsCopyWithImpl<$Res> extends _$LessonsStatsEventCopyWithImpl<$Res>
    implements $InitializeLessonsStatsCopyWith<$Res> {
  _$InitializeLessonsStatsCopyWithImpl(
      InitializeLessonsStats _value, $Res Function(InitializeLessonsStats) _then)
      : super(_value, (v) => _then(v as InitializeLessonsStats));

  @override
  InitializeLessonsStats get _value => super._value as InitializeLessonsStats;
}

/// @nodoc
class _$InitializeLessonsStats with DiagnosticableTreeMixin implements InitializeLessonsStats {
  const _$InitializeLessonsStats();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsStatsEvent.initializeLessonsStats()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LessonsStatsEvent.initializeLessonsStats'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeLessonsStats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessonsStats(),
    @required TResult updateLessonsStats(List<Lesson> lessons),
  }) {
    assert(initializeLessonsStats != null);
    assert(updateLessonsStats != null);
    return initializeLessonsStats();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessonsStats(),
    TResult updateLessonsStats(List<Lesson> lessons),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeLessonsStats != null) {
      return initializeLessonsStats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLessonsStats(InitializeLessonsStats value),
    @required TResult updateLessonsStats(UpdateLessonsStats value),
  }) {
    assert(initializeLessonsStats != null);
    assert(updateLessonsStats != null);
    return initializeLessonsStats(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessonsStats(InitializeLessonsStats value),
    TResult updateLessonsStats(UpdateLessonsStats value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeLessonsStats != null) {
      return initializeLessonsStats(this);
    }
    return orElse();
  }
}

abstract class InitializeLessonsStats implements LessonsStatsEvent {
  const factory InitializeLessonsStats() = _$InitializeLessonsStats;
}

/// @nodoc
abstract class $UpdateLessonsStatsCopyWith<$Res> {
  factory $UpdateLessonsStatsCopyWith(
          UpdateLessonsStats value, $Res Function(UpdateLessonsStats) then) =
      _$UpdateLessonsStatsCopyWithImpl<$Res>;
  $Res call({List<Lesson> lessons});
}

/// @nodoc
class _$UpdateLessonsStatsCopyWithImpl<$Res> extends _$LessonsStatsEventCopyWithImpl<$Res>
    implements $UpdateLessonsStatsCopyWith<$Res> {
  _$UpdateLessonsStatsCopyWithImpl(
      UpdateLessonsStats _value, $Res Function(UpdateLessonsStats) _then)
      : super(_value, (v) => _then(v as UpdateLessonsStats));

  @override
  UpdateLessonsStats get _value => super._value as UpdateLessonsStats;

  @override
  $Res call({
    Object lessons = freezed,
  }) {
    return _then(UpdateLessonsStats(
      lessons: lessons == freezed ? _value.lessons : lessons as List<Lesson>,
    ));
  }
}

/// @nodoc
class _$UpdateLessonsStats with DiagnosticableTreeMixin implements UpdateLessonsStats {
  const _$UpdateLessonsStats({@required this.lessons}) : assert(lessons != null);

  @override
  final List<Lesson> lessons;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsStatsEvent.updateLessonsStats(lessons: $lessons)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsStatsEvent.updateLessonsStats'))
      ..add(DiagnosticsProperty('lessons', lessons));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateLessonsStats &&
            (identical(other.lessons, lessons) ||
                const DeepCollectionEquality().equals(other.lessons, lessons)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(lessons);

  @override
  $UpdateLessonsStatsCopyWith<UpdateLessonsStats> get copyWith =>
      _$UpdateLessonsStatsCopyWithImpl<UpdateLessonsStats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeLessonsStats(),
    @required TResult updateLessonsStats(List<Lesson> lessons),
  }) {
    assert(initializeLessonsStats != null);
    assert(updateLessonsStats != null);
    return updateLessonsStats(lessons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeLessonsStats(),
    TResult updateLessonsStats(List<Lesson> lessons),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateLessonsStats != null) {
      return updateLessonsStats(lessons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeLessonsStats(InitializeLessonsStats value),
    @required TResult updateLessonsStats(UpdateLessonsStats value),
  }) {
    assert(initializeLessonsStats != null);
    assert(updateLessonsStats != null);
    return updateLessonsStats(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeLessonsStats(InitializeLessonsStats value),
    TResult updateLessonsStats(UpdateLessonsStats value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateLessonsStats != null) {
      return updateLessonsStats(this);
    }
    return orElse();
  }
}

abstract class UpdateLessonsStats implements LessonsStatsEvent {
  const factory UpdateLessonsStats({@required List<Lesson> lessons}) = _$UpdateLessonsStats;

  List<Lesson> get lessons;
  $UpdateLessonsStatsCopyWith<UpdateLessonsStats> get copyWith;
}
