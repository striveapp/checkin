// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'graduation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GraduationStateTearOff {
  const _$GraduationStateTearOff();

// ignore: unused_element
  InitialGraduationState initialGraduationState() {
    return const InitialGraduationState();
  }

// ignore: unused_element
  NotReadyForGraduation notReadyForGraduation({@required Grade nextGrade}) {
    return NotReadyForGraduation(
      nextGrade: nextGrade,
    );
  }

// ignore: unused_element
  GraduationLoaded graduationLoaded(
      {@required Grade nextGrade,
      @required int attendedLessonsForGrade,
      @required double forNextLevel}) {
    return GraduationLoaded(
      nextGrade: nextGrade,
      attendedLessonsForGrade: attendedLessonsForGrade,
      forNextLevel: forNextLevel,
    );
  }

// ignore: unused_element
  GraduationLoading graduationLoading() {
    return const GraduationLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $GraduationState = _$GraduationStateTearOff();

/// @nodoc
mixin _$GraduationState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialGraduationState(),
    @required TResult notReadyForGraduation(Grade nextGrade),
    @required
        TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    @required TResult graduationLoading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialGraduationState(),
    TResult notReadyForGraduation(Grade nextGrade),
    TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    TResult graduationLoading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialGraduationState(InitialGraduationState value),
    @required TResult notReadyForGraduation(NotReadyForGraduation value),
    @required TResult graduationLoaded(GraduationLoaded value),
    @required TResult graduationLoading(GraduationLoading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialGraduationState(InitialGraduationState value),
    TResult notReadyForGraduation(NotReadyForGraduation value),
    TResult graduationLoaded(GraduationLoaded value),
    TResult graduationLoading(GraduationLoading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $GraduationStateCopyWith<$Res> {
  factory $GraduationStateCopyWith(GraduationState value, $Res Function(GraduationState) then) =
      _$GraduationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GraduationStateCopyWithImpl<$Res> implements $GraduationStateCopyWith<$Res> {
  _$GraduationStateCopyWithImpl(this._value, this._then);

  final GraduationState _value;
  // ignore: unused_field
  final $Res Function(GraduationState) _then;
}

/// @nodoc
abstract class $InitialGraduationStateCopyWith<$Res> {
  factory $InitialGraduationStateCopyWith(
          InitialGraduationState value, $Res Function(InitialGraduationState) then) =
      _$InitialGraduationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialGraduationStateCopyWithImpl<$Res> extends _$GraduationStateCopyWithImpl<$Res>
    implements $InitialGraduationStateCopyWith<$Res> {
  _$InitialGraduationStateCopyWithImpl(
      InitialGraduationState _value, $Res Function(InitialGraduationState) _then)
      : super(_value, (v) => _then(v as InitialGraduationState));

  @override
  InitialGraduationState get _value => super._value as InitialGraduationState;
}

/// @nodoc
class _$InitialGraduationState with DiagnosticableTreeMixin implements InitialGraduationState {
  const _$InitialGraduationState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationState.initialGraduationState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GraduationState.initialGraduationState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialGraduationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialGraduationState(),
    @required TResult notReadyForGraduation(Grade nextGrade),
    @required
        TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    @required TResult graduationLoading(),
  }) {
    assert(initialGraduationState != null);
    assert(notReadyForGraduation != null);
    assert(graduationLoaded != null);
    assert(graduationLoading != null);
    return initialGraduationState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialGraduationState(),
    TResult notReadyForGraduation(Grade nextGrade),
    TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    TResult graduationLoading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialGraduationState != null) {
      return initialGraduationState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialGraduationState(InitialGraduationState value),
    @required TResult notReadyForGraduation(NotReadyForGraduation value),
    @required TResult graduationLoaded(GraduationLoaded value),
    @required TResult graduationLoading(GraduationLoading value),
  }) {
    assert(initialGraduationState != null);
    assert(notReadyForGraduation != null);
    assert(graduationLoaded != null);
    assert(graduationLoading != null);
    return initialGraduationState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialGraduationState(InitialGraduationState value),
    TResult notReadyForGraduation(NotReadyForGraduation value),
    TResult graduationLoaded(GraduationLoaded value),
    TResult graduationLoading(GraduationLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialGraduationState != null) {
      return initialGraduationState(this);
    }
    return orElse();
  }
}

abstract class InitialGraduationState implements GraduationState {
  const factory InitialGraduationState() = _$InitialGraduationState;
}

/// @nodoc
abstract class $NotReadyForGraduationCopyWith<$Res> {
  factory $NotReadyForGraduationCopyWith(
          NotReadyForGraduation value, $Res Function(NotReadyForGraduation) then) =
      _$NotReadyForGraduationCopyWithImpl<$Res>;
  $Res call({Grade nextGrade});
}

/// @nodoc
class _$NotReadyForGraduationCopyWithImpl<$Res> extends _$GraduationStateCopyWithImpl<$Res>
    implements $NotReadyForGraduationCopyWith<$Res> {
  _$NotReadyForGraduationCopyWithImpl(
      NotReadyForGraduation _value, $Res Function(NotReadyForGraduation) _then)
      : super(_value, (v) => _then(v as NotReadyForGraduation));

  @override
  NotReadyForGraduation get _value => super._value as NotReadyForGraduation;

  @override
  $Res call({
    Object nextGrade = freezed,
  }) {
    return _then(NotReadyForGraduation(
      nextGrade: nextGrade == freezed ? _value.nextGrade : nextGrade as Grade,
    ));
  }
}

/// @nodoc
class _$NotReadyForGraduation with DiagnosticableTreeMixin implements NotReadyForGraduation {
  const _$NotReadyForGraduation({@required this.nextGrade}) : assert(nextGrade != null);

  @override
  final Grade nextGrade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationState.notReadyForGraduation(nextGrade: $nextGrade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GraduationState.notReadyForGraduation'))
      ..add(DiagnosticsProperty('nextGrade', nextGrade));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotReadyForGraduation &&
            (identical(other.nextGrade, nextGrade) ||
                const DeepCollectionEquality().equals(other.nextGrade, nextGrade)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(nextGrade);

  @JsonKey(ignore: true)
  @override
  $NotReadyForGraduationCopyWith<NotReadyForGraduation> get copyWith =>
      _$NotReadyForGraduationCopyWithImpl<NotReadyForGraduation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialGraduationState(),
    @required TResult notReadyForGraduation(Grade nextGrade),
    @required
        TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    @required TResult graduationLoading(),
  }) {
    assert(initialGraduationState != null);
    assert(notReadyForGraduation != null);
    assert(graduationLoaded != null);
    assert(graduationLoading != null);
    return notReadyForGraduation(nextGrade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialGraduationState(),
    TResult notReadyForGraduation(Grade nextGrade),
    TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    TResult graduationLoading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (notReadyForGraduation != null) {
      return notReadyForGraduation(nextGrade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialGraduationState(InitialGraduationState value),
    @required TResult notReadyForGraduation(NotReadyForGraduation value),
    @required TResult graduationLoaded(GraduationLoaded value),
    @required TResult graduationLoading(GraduationLoading value),
  }) {
    assert(initialGraduationState != null);
    assert(notReadyForGraduation != null);
    assert(graduationLoaded != null);
    assert(graduationLoading != null);
    return notReadyForGraduation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialGraduationState(InitialGraduationState value),
    TResult notReadyForGraduation(NotReadyForGraduation value),
    TResult graduationLoaded(GraduationLoaded value),
    TResult graduationLoading(GraduationLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (notReadyForGraduation != null) {
      return notReadyForGraduation(this);
    }
    return orElse();
  }
}

abstract class NotReadyForGraduation implements GraduationState {
  const factory NotReadyForGraduation({@required Grade nextGrade}) = _$NotReadyForGraduation;

  Grade get nextGrade;
  @JsonKey(ignore: true)
  $NotReadyForGraduationCopyWith<NotReadyForGraduation> get copyWith;
}

/// @nodoc
abstract class $GraduationLoadedCopyWith<$Res> {
  factory $GraduationLoadedCopyWith(GraduationLoaded value, $Res Function(GraduationLoaded) then) =
      _$GraduationLoadedCopyWithImpl<$Res>;
  $Res call({Grade nextGrade, int attendedLessonsForGrade, double forNextLevel});
}

/// @nodoc
class _$GraduationLoadedCopyWithImpl<$Res> extends _$GraduationStateCopyWithImpl<$Res>
    implements $GraduationLoadedCopyWith<$Res> {
  _$GraduationLoadedCopyWithImpl(GraduationLoaded _value, $Res Function(GraduationLoaded) _then)
      : super(_value, (v) => _then(v as GraduationLoaded));

  @override
  GraduationLoaded get _value => super._value as GraduationLoaded;

  @override
  $Res call({
    Object nextGrade = freezed,
    Object attendedLessonsForGrade = freezed,
    Object forNextLevel = freezed,
  }) {
    return _then(GraduationLoaded(
      nextGrade: nextGrade == freezed ? _value.nextGrade : nextGrade as Grade,
      attendedLessonsForGrade: attendedLessonsForGrade == freezed
          ? _value.attendedLessonsForGrade
          : attendedLessonsForGrade as int,
      forNextLevel: forNextLevel == freezed ? _value.forNextLevel : forNextLevel as double,
    ));
  }
}

/// @nodoc
class _$GraduationLoaded with DiagnosticableTreeMixin implements GraduationLoaded {
  const _$GraduationLoaded(
      {@required this.nextGrade,
      @required this.attendedLessonsForGrade,
      @required this.forNextLevel})
      : assert(nextGrade != null),
        assert(attendedLessonsForGrade != null),
        assert(forNextLevel != null);

  @override
  final Grade nextGrade;
  @override
  final int attendedLessonsForGrade;
  @override
  final double forNextLevel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationState.graduationLoaded(nextGrade: $nextGrade, attendedLessonsForGrade: $attendedLessonsForGrade, forNextLevel: $forNextLevel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GraduationState.graduationLoaded'))
      ..add(DiagnosticsProperty('nextGrade', nextGrade))
      ..add(DiagnosticsProperty('attendedLessonsForGrade', attendedLessonsForGrade))
      ..add(DiagnosticsProperty('forNextLevel', forNextLevel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GraduationLoaded &&
            (identical(other.nextGrade, nextGrade) ||
                const DeepCollectionEquality().equals(other.nextGrade, nextGrade)) &&
            (identical(other.attendedLessonsForGrade, attendedLessonsForGrade) ||
                const DeepCollectionEquality()
                    .equals(other.attendedLessonsForGrade, attendedLessonsForGrade)) &&
            (identical(other.forNextLevel, forNextLevel) ||
                const DeepCollectionEquality().equals(other.forNextLevel, forNextLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nextGrade) ^
      const DeepCollectionEquality().hash(attendedLessonsForGrade) ^
      const DeepCollectionEquality().hash(forNextLevel);

  @JsonKey(ignore: true)
  @override
  $GraduationLoadedCopyWith<GraduationLoaded> get copyWith =>
      _$GraduationLoadedCopyWithImpl<GraduationLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialGraduationState(),
    @required TResult notReadyForGraduation(Grade nextGrade),
    @required
        TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    @required TResult graduationLoading(),
  }) {
    assert(initialGraduationState != null);
    assert(notReadyForGraduation != null);
    assert(graduationLoaded != null);
    assert(graduationLoading != null);
    return graduationLoaded(nextGrade, attendedLessonsForGrade, forNextLevel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialGraduationState(),
    TResult notReadyForGraduation(Grade nextGrade),
    TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    TResult graduationLoading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduationLoaded != null) {
      return graduationLoaded(nextGrade, attendedLessonsForGrade, forNextLevel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialGraduationState(InitialGraduationState value),
    @required TResult notReadyForGraduation(NotReadyForGraduation value),
    @required TResult graduationLoaded(GraduationLoaded value),
    @required TResult graduationLoading(GraduationLoading value),
  }) {
    assert(initialGraduationState != null);
    assert(notReadyForGraduation != null);
    assert(graduationLoaded != null);
    assert(graduationLoading != null);
    return graduationLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialGraduationState(InitialGraduationState value),
    TResult notReadyForGraduation(NotReadyForGraduation value),
    TResult graduationLoaded(GraduationLoaded value),
    TResult graduationLoading(GraduationLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduationLoaded != null) {
      return graduationLoaded(this);
    }
    return orElse();
  }
}

abstract class GraduationLoaded implements GraduationState {
  const factory GraduationLoaded(
      {@required Grade nextGrade,
      @required int attendedLessonsForGrade,
      @required double forNextLevel}) = _$GraduationLoaded;

  Grade get nextGrade;
  int get attendedLessonsForGrade;
  double get forNextLevel;
  @JsonKey(ignore: true)
  $GraduationLoadedCopyWith<GraduationLoaded> get copyWith;
}

/// @nodoc
abstract class $GraduationLoadingCopyWith<$Res> {
  factory $GraduationLoadingCopyWith(
          GraduationLoading value, $Res Function(GraduationLoading) then) =
      _$GraduationLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$GraduationLoadingCopyWithImpl<$Res> extends _$GraduationStateCopyWithImpl<$Res>
    implements $GraduationLoadingCopyWith<$Res> {
  _$GraduationLoadingCopyWithImpl(GraduationLoading _value, $Res Function(GraduationLoading) _then)
      : super(_value, (v) => _then(v as GraduationLoading));

  @override
  GraduationLoading get _value => super._value as GraduationLoading;
}

/// @nodoc
class _$GraduationLoading with DiagnosticableTreeMixin implements GraduationLoading {
  const _$GraduationLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationState.graduationLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GraduationState.graduationLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GraduationLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialGraduationState(),
    @required TResult notReadyForGraduation(Grade nextGrade),
    @required
        TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    @required TResult graduationLoading(),
  }) {
    assert(initialGraduationState != null);
    assert(notReadyForGraduation != null);
    assert(graduationLoaded != null);
    assert(graduationLoading != null);
    return graduationLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialGraduationState(),
    TResult notReadyForGraduation(Grade nextGrade),
    TResult graduationLoaded(Grade nextGrade, int attendedLessonsForGrade, double forNextLevel),
    TResult graduationLoading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduationLoading != null) {
      return graduationLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialGraduationState(InitialGraduationState value),
    @required TResult notReadyForGraduation(NotReadyForGraduation value),
    @required TResult graduationLoaded(GraduationLoaded value),
    @required TResult graduationLoading(GraduationLoading value),
  }) {
    assert(initialGraduationState != null);
    assert(notReadyForGraduation != null);
    assert(graduationLoaded != null);
    assert(graduationLoading != null);
    return graduationLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialGraduationState(InitialGraduationState value),
    TResult notReadyForGraduation(NotReadyForGraduation value),
    TResult graduationLoaded(GraduationLoaded value),
    TResult graduationLoading(GraduationLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduationLoading != null) {
      return graduationLoading(this);
    }
    return orElse();
  }
}

abstract class GraduationLoading implements GraduationState {
  const factory GraduationLoading() = _$GraduationLoading;
}
