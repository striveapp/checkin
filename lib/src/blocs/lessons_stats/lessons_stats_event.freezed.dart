// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'lessons_stats_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LessonsStatsEventTearOff {
  const _$LessonsStatsEventTearOff();

  InitializeLessonsStats initializeLessonsStats() {
    return const InitializeLessonsStats();
  }

  UpdateLessonsStats updateLessonsStats({required List<Lesson> lessons}) {
    return UpdateLessonsStats(
      lessons: lessons,
    );
  }
}

/// @nodoc
const $LessonsStatsEvent = _$LessonsStatsEventTearOff();

/// @nodoc
mixin _$LessonsStatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeLessonsStats,
    required TResult Function(List<Lesson> lessons) updateLessonsStats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeLessonsStats,
    TResult Function(List<Lesson> lessons)? updateLessonsStats,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeLessonsStats value)
        initializeLessonsStats,
    required TResult Function(UpdateLessonsStats value) updateLessonsStats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeLessonsStats value)? initializeLessonsStats,
    TResult Function(UpdateLessonsStats value)? updateLessonsStats,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsStatsEventCopyWith<$Res> {
  factory $LessonsStatsEventCopyWith(
          LessonsStatsEvent value, $Res Function(LessonsStatsEvent) then) =
      _$LessonsStatsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonsStatsEventCopyWithImpl<$Res>
    implements $LessonsStatsEventCopyWith<$Res> {
  _$LessonsStatsEventCopyWithImpl(this._value, this._then);

  final LessonsStatsEvent _value;
  // ignore: unused_field
  final $Res Function(LessonsStatsEvent) _then;
}

/// @nodoc
abstract class $InitializeLessonsStatsCopyWith<$Res> {
  factory $InitializeLessonsStatsCopyWith(InitializeLessonsStats value,
          $Res Function(InitializeLessonsStats) then) =
      _$InitializeLessonsStatsCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeLessonsStatsCopyWithImpl<$Res>
    extends _$LessonsStatsEventCopyWithImpl<$Res>
    implements $InitializeLessonsStatsCopyWith<$Res> {
  _$InitializeLessonsStatsCopyWithImpl(InitializeLessonsStats _value,
      $Res Function(InitializeLessonsStats) _then)
      : super(_value, (v) => _then(v as InitializeLessonsStats));

  @override
  InitializeLessonsStats get _value => super._value as InitializeLessonsStats;
}

/// @nodoc

class _$InitializeLessonsStats
    with DiagnosticableTreeMixin
    implements InitializeLessonsStats {
  const _$InitializeLessonsStats();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsStatsEvent.initializeLessonsStats()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'LessonsStatsEvent.initializeLessonsStats'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeLessonsStats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeLessonsStats,
    required TResult Function(List<Lesson> lessons) updateLessonsStats,
  }) {
    return initializeLessonsStats();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeLessonsStats,
    TResult Function(List<Lesson> lessons)? updateLessonsStats,
    required TResult orElse(),
  }) {
    if (initializeLessonsStats != null) {
      return initializeLessonsStats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeLessonsStats value)
        initializeLessonsStats,
    required TResult Function(UpdateLessonsStats value) updateLessonsStats,
  }) {
    return initializeLessonsStats(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeLessonsStats value)? initializeLessonsStats,
    TResult Function(UpdateLessonsStats value)? updateLessonsStats,
    required TResult orElse(),
  }) {
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
class _$UpdateLessonsStatsCopyWithImpl<$Res>
    extends _$LessonsStatsEventCopyWithImpl<$Res>
    implements $UpdateLessonsStatsCopyWith<$Res> {
  _$UpdateLessonsStatsCopyWithImpl(
      UpdateLessonsStats _value, $Res Function(UpdateLessonsStats) _then)
      : super(_value, (v) => _then(v as UpdateLessonsStats));

  @override
  UpdateLessonsStats get _value => super._value as UpdateLessonsStats;

  @override
  $Res call({
    Object? lessons = freezed,
  }) {
    return _then(UpdateLessonsStats(
      lessons: lessons == freezed
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
    ));
  }
}

/// @nodoc

class _$UpdateLessonsStats
    with DiagnosticableTreeMixin
    implements UpdateLessonsStats {
  const _$UpdateLessonsStats({required this.lessons});

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
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lessons);

  @JsonKey(ignore: true)
  @override
  $UpdateLessonsStatsCopyWith<UpdateLessonsStats> get copyWith =>
      _$UpdateLessonsStatsCopyWithImpl<UpdateLessonsStats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeLessonsStats,
    required TResult Function(List<Lesson> lessons) updateLessonsStats,
  }) {
    return updateLessonsStats(lessons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeLessonsStats,
    TResult Function(List<Lesson> lessons)? updateLessonsStats,
    required TResult orElse(),
  }) {
    if (updateLessonsStats != null) {
      return updateLessonsStats(lessons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeLessonsStats value)
        initializeLessonsStats,
    required TResult Function(UpdateLessonsStats value) updateLessonsStats,
  }) {
    return updateLessonsStats(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeLessonsStats value)? initializeLessonsStats,
    TResult Function(UpdateLessonsStats value)? updateLessonsStats,
    required TResult orElse(),
  }) {
    if (updateLessonsStats != null) {
      return updateLessonsStats(this);
    }
    return orElse();
  }
}

abstract class UpdateLessonsStats implements LessonsStatsEvent {
  const factory UpdateLessonsStats({required List<Lesson> lessons}) =
      _$UpdateLessonsStats;

  List<Lesson> get lessons => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateLessonsStatsCopyWith<UpdateLessonsStats> get copyWith =>
      throw _privateConstructorUsedError;
}
