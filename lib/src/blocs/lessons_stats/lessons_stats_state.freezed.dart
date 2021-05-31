// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lessons_stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LessonsStatsStateTearOff {
  const _$LessonsStatsStateTearOff();

// ignore: unused_element
  LessonsStatsInitial lessonsStatsInitial() {
    return const LessonsStatsInitial();
  }

// ignore: unused_element
  LessonsStatsUpdated lessonsStatsUpdated(
      {@required List<AttendeeWithCounter> attendeesWithCounter, @required int totalAttendees}) {
    return LessonsStatsUpdated(
      attendeesWithCounter: attendeesWithCounter,
      totalAttendees: totalAttendees,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LessonsStatsState = _$LessonsStatsStateTearOff();

/// @nodoc
mixin _$LessonsStatsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonsStatsInitial(),
    @required
        TResult lessonsStatsUpdated(
            List<AttendeeWithCounter> attendeesWithCounter, int totalAttendees),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsStatsInitial(),
    TResult lessonsStatsUpdated(List<AttendeeWithCounter> attendeesWithCounter, int totalAttendees),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsStatsInitial(LessonsStatsInitial value),
    @required TResult lessonsStatsUpdated(LessonsStatsUpdated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsStatsInitial(LessonsStatsInitial value),
    TResult lessonsStatsUpdated(LessonsStatsUpdated value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LessonsStatsStateCopyWith<$Res> {
  factory $LessonsStatsStateCopyWith(
          LessonsStatsState value, $Res Function(LessonsStatsState) then) =
      _$LessonsStatsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonsStatsStateCopyWithImpl<$Res> implements $LessonsStatsStateCopyWith<$Res> {
  _$LessonsStatsStateCopyWithImpl(this._value, this._then);

  final LessonsStatsState _value;
  // ignore: unused_field
  final $Res Function(LessonsStatsState) _then;
}

/// @nodoc
abstract class $LessonsStatsInitialCopyWith<$Res> {
  factory $LessonsStatsInitialCopyWith(
          LessonsStatsInitial value, $Res Function(LessonsStatsInitial) then) =
      _$LessonsStatsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$LessonsStatsInitialCopyWithImpl<$Res> extends _$LessonsStatsStateCopyWithImpl<$Res>
    implements $LessonsStatsInitialCopyWith<$Res> {
  _$LessonsStatsInitialCopyWithImpl(
      LessonsStatsInitial _value, $Res Function(LessonsStatsInitial) _then)
      : super(_value, (v) => _then(v as LessonsStatsInitial));

  @override
  LessonsStatsInitial get _value => super._value as LessonsStatsInitial;
}

/// @nodoc
class _$LessonsStatsInitial with DiagnosticableTreeMixin implements LessonsStatsInitial {
  const _$LessonsStatsInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsStatsState.lessonsStatsInitial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LessonsStatsState.lessonsStatsInitial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LessonsStatsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonsStatsInitial(),
    @required
        TResult lessonsStatsUpdated(
            List<AttendeeWithCounter> attendeesWithCounter, int totalAttendees),
  }) {
    assert(lessonsStatsInitial != null);
    assert(lessonsStatsUpdated != null);
    return lessonsStatsInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsStatsInitial(),
    TResult lessonsStatsUpdated(List<AttendeeWithCounter> attendeesWithCounter, int totalAttendees),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsStatsInitial != null) {
      return lessonsStatsInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsStatsInitial(LessonsStatsInitial value),
    @required TResult lessonsStatsUpdated(LessonsStatsUpdated value),
  }) {
    assert(lessonsStatsInitial != null);
    assert(lessonsStatsUpdated != null);
    return lessonsStatsInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsStatsInitial(LessonsStatsInitial value),
    TResult lessonsStatsUpdated(LessonsStatsUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsStatsInitial != null) {
      return lessonsStatsInitial(this);
    }
    return orElse();
  }
}

abstract class LessonsStatsInitial implements LessonsStatsState {
  const factory LessonsStatsInitial() = _$LessonsStatsInitial;
}

/// @nodoc
abstract class $LessonsStatsUpdatedCopyWith<$Res> {
  factory $LessonsStatsUpdatedCopyWith(
          LessonsStatsUpdated value, $Res Function(LessonsStatsUpdated) then) =
      _$LessonsStatsUpdatedCopyWithImpl<$Res>;
  $Res call({List<AttendeeWithCounter> attendeesWithCounter, int totalAttendees});
}

/// @nodoc
class _$LessonsStatsUpdatedCopyWithImpl<$Res> extends _$LessonsStatsStateCopyWithImpl<$Res>
    implements $LessonsStatsUpdatedCopyWith<$Res> {
  _$LessonsStatsUpdatedCopyWithImpl(
      LessonsStatsUpdated _value, $Res Function(LessonsStatsUpdated) _then)
      : super(_value, (v) => _then(v as LessonsStatsUpdated));

  @override
  LessonsStatsUpdated get _value => super._value as LessonsStatsUpdated;

  @override
  $Res call({
    Object attendeesWithCounter = freezed,
    Object totalAttendees = freezed,
  }) {
    return _then(LessonsStatsUpdated(
      attendeesWithCounter: attendeesWithCounter == freezed
          ? _value.attendeesWithCounter
          : attendeesWithCounter as List<AttendeeWithCounter>,
      totalAttendees: totalAttendees == freezed ? _value.totalAttendees : totalAttendees as int,
    ));
  }
}

/// @nodoc
class _$LessonsStatsUpdated with DiagnosticableTreeMixin implements LessonsStatsUpdated {
  const _$LessonsStatsUpdated({@required this.attendeesWithCounter, @required this.totalAttendees})
      : assert(attendeesWithCounter != null),
        assert(totalAttendees != null);

  @override
  final List<AttendeeWithCounter> attendeesWithCounter;
  @override
  final int totalAttendees;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsStatsState.lessonsStatsUpdated(attendeesWithCounter: $attendeesWithCounter, totalAttendees: $totalAttendees)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsStatsState.lessonsStatsUpdated'))
      ..add(DiagnosticsProperty('attendeesWithCounter', attendeesWithCounter))
      ..add(DiagnosticsProperty('totalAttendees', totalAttendees));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonsStatsUpdated &&
            (identical(other.attendeesWithCounter, attendeesWithCounter) ||
                const DeepCollectionEquality()
                    .equals(other.attendeesWithCounter, attendeesWithCounter)) &&
            (identical(other.totalAttendees, totalAttendees) ||
                const DeepCollectionEquality().equals(other.totalAttendees, totalAttendees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(attendeesWithCounter) ^
      const DeepCollectionEquality().hash(totalAttendees);

  @JsonKey(ignore: true)
  @override
  $LessonsStatsUpdatedCopyWith<LessonsStatsUpdated> get copyWith =>
      _$LessonsStatsUpdatedCopyWithImpl<LessonsStatsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult lessonsStatsInitial(),
    @required
        TResult lessonsStatsUpdated(
            List<AttendeeWithCounter> attendeesWithCounter, int totalAttendees),
  }) {
    assert(lessonsStatsInitial != null);
    assert(lessonsStatsUpdated != null);
    return lessonsStatsUpdated(attendeesWithCounter, totalAttendees);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsStatsInitial(),
    TResult lessonsStatsUpdated(List<AttendeeWithCounter> attendeesWithCounter, int totalAttendees),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsStatsUpdated != null) {
      return lessonsStatsUpdated(attendeesWithCounter, totalAttendees);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult lessonsStatsInitial(LessonsStatsInitial value),
    @required TResult lessonsStatsUpdated(LessonsStatsUpdated value),
  }) {
    assert(lessonsStatsInitial != null);
    assert(lessonsStatsUpdated != null);
    return lessonsStatsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult lessonsStatsInitial(LessonsStatsInitial value),
    TResult lessonsStatsUpdated(LessonsStatsUpdated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsStatsUpdated != null) {
      return lessonsStatsUpdated(this);
    }
    return orElse();
  }
}

abstract class LessonsStatsUpdated implements LessonsStatsState {
  const factory LessonsStatsUpdated(
      {@required List<AttendeeWithCounter> attendeesWithCounter,
      @required int totalAttendees}) = _$LessonsStatsUpdated;

  List<AttendeeWithCounter> get attendeesWithCounter;
  int get totalAttendees;
  @JsonKey(ignore: true)
  $LessonsStatsUpdatedCopyWith<LessonsStatsUpdated> get copyWith;
}
