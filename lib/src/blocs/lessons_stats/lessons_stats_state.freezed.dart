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
      {@required Map<Attendee, int> acceptedAttendeesWithCounter, @required int totalAttendees}) {
    return LessonsStatsUpdated(
      acceptedAttendeesWithCounter: acceptedAttendeesWithCounter,
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
            Map<Attendee, int> acceptedAttendeesWithCounter, int totalAttendees),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsStatsInitial(),
    TResult lessonsStatsUpdated(
        Map<Attendee, int> acceptedAttendeesWithCounter, int totalAttendees),
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
            Map<Attendee, int> acceptedAttendeesWithCounter, int totalAttendees),
  }) {
    assert(lessonsStatsInitial != null);
    assert(lessonsStatsUpdated != null);
    return lessonsStatsInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsStatsInitial(),
    TResult lessonsStatsUpdated(
        Map<Attendee, int> acceptedAttendeesWithCounter, int totalAttendees),
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
  $Res call({Map<Attendee, int> acceptedAttendeesWithCounter, int totalAttendees});
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
    Object acceptedAttendeesWithCounter = freezed,
    Object totalAttendees = freezed,
  }) {
    return _then(LessonsStatsUpdated(
      acceptedAttendeesWithCounter: acceptedAttendeesWithCounter == freezed
          ? _value.acceptedAttendeesWithCounter
          : acceptedAttendeesWithCounter as Map<Attendee, int>,
      totalAttendees: totalAttendees == freezed ? _value.totalAttendees : totalAttendees as int,
    ));
  }
}

/// @nodoc
class _$LessonsStatsUpdated with DiagnosticableTreeMixin implements LessonsStatsUpdated {
  const _$LessonsStatsUpdated(
      {@required this.acceptedAttendeesWithCounter, @required this.totalAttendees})
      : assert(acceptedAttendeesWithCounter != null),
        assert(totalAttendees != null);

  @override
  final Map<Attendee, int> acceptedAttendeesWithCounter;
  @override
  final int totalAttendees;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonsStatsState.lessonsStatsUpdated(acceptedAttendeesWithCounter: $acceptedAttendeesWithCounter, totalAttendees: $totalAttendees)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonsStatsState.lessonsStatsUpdated'))
      ..add(DiagnosticsProperty('acceptedAttendeesWithCounter', acceptedAttendeesWithCounter))
      ..add(DiagnosticsProperty('totalAttendees', totalAttendees));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LessonsStatsUpdated &&
            (identical(other.acceptedAttendeesWithCounter, acceptedAttendeesWithCounter) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedAttendeesWithCounter, acceptedAttendeesWithCounter)) &&
            (identical(other.totalAttendees, totalAttendees) ||
                const DeepCollectionEquality().equals(other.totalAttendees, totalAttendees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(acceptedAttendeesWithCounter) ^
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
            Map<Attendee, int> acceptedAttendeesWithCounter, int totalAttendees),
  }) {
    assert(lessonsStatsInitial != null);
    assert(lessonsStatsUpdated != null);
    return lessonsStatsUpdated(acceptedAttendeesWithCounter, totalAttendees);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult lessonsStatsInitial(),
    TResult lessonsStatsUpdated(
        Map<Attendee, int> acceptedAttendeesWithCounter, int totalAttendees),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (lessonsStatsUpdated != null) {
      return lessonsStatsUpdated(acceptedAttendeesWithCounter, totalAttendees);
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
      {@required Map<Attendee, int> acceptedAttendeesWithCounter,
      @required int totalAttendees}) = _$LessonsStatsUpdated;

  Map<Attendee, int> get acceptedAttendeesWithCounter;
  int get totalAttendees;
  @JsonKey(ignore: true)
  $LessonsStatsUpdatedCopyWith<LessonsStatsUpdated> get copyWith;
}
