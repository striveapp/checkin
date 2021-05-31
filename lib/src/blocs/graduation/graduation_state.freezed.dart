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
  GraduationLoaded graduationLoaded(
      {@required Grade currentGrade,
      @required Grade nextGrade,
      @required int attendedLessonsForGrade,
      @required double forNextLevel,
      @required bool isVisible}) {
    return GraduationLoaded(
      currentGrade: currentGrade,
      nextGrade: nextGrade,
      attendedLessonsForGrade: attendedLessonsForGrade,
      forNextLevel: forNextLevel,
      isVisible: isVisible,
    );
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
    @required
        TResult graduationLoaded(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialGraduationState(),
    TResult graduationLoaded(Grade currentGrade, Grade nextGrade,
        int attendedLessonsForGrade, double forNextLevel, bool isVisible),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialGraduationState(InitialGraduationState value),
    @required TResult graduationLoaded(GraduationLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialGraduationState(InitialGraduationState value),
    TResult graduationLoaded(GraduationLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $GraduationStateCopyWith<$Res> {
  factory $GraduationStateCopyWith(
          GraduationState value, $Res Function(GraduationState) then) =
      _$GraduationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GraduationStateCopyWithImpl<$Res>
    implements $GraduationStateCopyWith<$Res> {
  _$GraduationStateCopyWithImpl(this._value, this._then);

  final GraduationState _value;
  // ignore: unused_field
  final $Res Function(GraduationState) _then;
}

/// @nodoc
abstract class $InitialGraduationStateCopyWith<$Res> {
  factory $InitialGraduationStateCopyWith(InitialGraduationState value,
          $Res Function(InitialGraduationState) then) =
      _$InitialGraduationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialGraduationStateCopyWithImpl<$Res>
    extends _$GraduationStateCopyWithImpl<$Res>
    implements $InitialGraduationStateCopyWith<$Res> {
  _$InitialGraduationStateCopyWithImpl(InitialGraduationState _value,
      $Res Function(InitialGraduationState) _then)
      : super(_value, (v) => _then(v as InitialGraduationState));

  @override
  InitialGraduationState get _value => super._value as InitialGraduationState;
}

/// @nodoc
class _$InitialGraduationState
    with DiagnosticableTreeMixin
    implements InitialGraduationState {
  const _$InitialGraduationState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationState.initialGraduationState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'GraduationState.initialGraduationState'));
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
    @required
        TResult graduationLoaded(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible),
  }) {
    assert(initialGraduationState != null);
    assert(graduationLoaded != null);
    return initialGraduationState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialGraduationState(),
    TResult graduationLoaded(Grade currentGrade, Grade nextGrade,
        int attendedLessonsForGrade, double forNextLevel, bool isVisible),
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
    @required TResult graduationLoaded(GraduationLoaded value),
  }) {
    assert(initialGraduationState != null);
    assert(graduationLoaded != null);
    return initialGraduationState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialGraduationState(InitialGraduationState value),
    TResult graduationLoaded(GraduationLoaded value),
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
abstract class $GraduationLoadedCopyWith<$Res> {
  factory $GraduationLoadedCopyWith(
          GraduationLoaded value, $Res Function(GraduationLoaded) then) =
      _$GraduationLoadedCopyWithImpl<$Res>;
  $Res call(
      {Grade currentGrade,
      Grade nextGrade,
      int attendedLessonsForGrade,
      double forNextLevel,
      bool isVisible});
}

/// @nodoc
class _$GraduationLoadedCopyWithImpl<$Res>
    extends _$GraduationStateCopyWithImpl<$Res>
    implements $GraduationLoadedCopyWith<$Res> {
  _$GraduationLoadedCopyWithImpl(
      GraduationLoaded _value, $Res Function(GraduationLoaded) _then)
      : super(_value, (v) => _then(v as GraduationLoaded));

  @override
  GraduationLoaded get _value => super._value as GraduationLoaded;

  @override
  $Res call({
    Object currentGrade = freezed,
    Object nextGrade = freezed,
    Object attendedLessonsForGrade = freezed,
    Object forNextLevel = freezed,
    Object isVisible = freezed,
  }) {
    return _then(GraduationLoaded(
      currentGrade:
          currentGrade == freezed ? _value.currentGrade : currentGrade as Grade,
      nextGrade: nextGrade == freezed ? _value.nextGrade : nextGrade as Grade,
      attendedLessonsForGrade: attendedLessonsForGrade == freezed
          ? _value.attendedLessonsForGrade
          : attendedLessonsForGrade as int,
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel as double,
      isVisible: isVisible == freezed ? _value.isVisible : isVisible as bool,
    ));
  }
}

/// @nodoc
class _$GraduationLoaded
    with DiagnosticableTreeMixin
    implements GraduationLoaded {
  const _$GraduationLoaded(
      {@required this.currentGrade,
      @required this.nextGrade,
      @required this.attendedLessonsForGrade,
      @required this.forNextLevel,
      @required this.isVisible})
      : assert(currentGrade != null),
        assert(nextGrade != null),
        assert(attendedLessonsForGrade != null),
        assert(forNextLevel != null),
        assert(isVisible != null);

  @override
  final Grade currentGrade;
  @override
  final Grade nextGrade;
  @override
  final int attendedLessonsForGrade;
  @override
  final double forNextLevel;
  @override
  final bool isVisible;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationState.graduationLoaded(currentGrade: $currentGrade, nextGrade: $nextGrade, attendedLessonsForGrade: $attendedLessonsForGrade, forNextLevel: $forNextLevel, isVisible: $isVisible)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GraduationState.graduationLoaded'))
      ..add(DiagnosticsProperty('currentGrade', currentGrade))
      ..add(DiagnosticsProperty('nextGrade', nextGrade))
      ..add(DiagnosticsProperty(
          'attendedLessonsForGrade', attendedLessonsForGrade))
      ..add(DiagnosticsProperty('forNextLevel', forNextLevel))
      ..add(DiagnosticsProperty('isVisible', isVisible));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GraduationLoaded &&
            (identical(other.currentGrade, currentGrade) ||
                const DeepCollectionEquality()
                    .equals(other.currentGrade, currentGrade)) &&
            (identical(other.nextGrade, nextGrade) ||
                const DeepCollectionEquality()
                    .equals(other.nextGrade, nextGrade)) &&
            (identical(
                    other.attendedLessonsForGrade, attendedLessonsForGrade) ||
                const DeepCollectionEquality().equals(
                    other.attendedLessonsForGrade, attendedLessonsForGrade)) &&
            (identical(other.forNextLevel, forNextLevel) ||
                const DeepCollectionEquality()
                    .equals(other.forNextLevel, forNextLevel)) &&
            (identical(other.isVisible, isVisible) ||
                const DeepCollectionEquality()
                    .equals(other.isVisible, isVisible)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentGrade) ^
      const DeepCollectionEquality().hash(nextGrade) ^
      const DeepCollectionEquality().hash(attendedLessonsForGrade) ^
      const DeepCollectionEquality().hash(forNextLevel) ^
      const DeepCollectionEquality().hash(isVisible);

  @JsonKey(ignore: true)
  @override
  $GraduationLoadedCopyWith<GraduationLoaded> get copyWith =>
      _$GraduationLoadedCopyWithImpl<GraduationLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialGraduationState(),
    @required
        TResult graduationLoaded(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible),
  }) {
    assert(initialGraduationState != null);
    assert(graduationLoaded != null);
    return graduationLoaded(currentGrade, nextGrade, attendedLessonsForGrade,
        forNextLevel, isVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialGraduationState(),
    TResult graduationLoaded(Grade currentGrade, Grade nextGrade,
        int attendedLessonsForGrade, double forNextLevel, bool isVisible),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduationLoaded != null) {
      return graduationLoaded(currentGrade, nextGrade, attendedLessonsForGrade,
          forNextLevel, isVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialGraduationState(InitialGraduationState value),
    @required TResult graduationLoaded(GraduationLoaded value),
  }) {
    assert(initialGraduationState != null);
    assert(graduationLoaded != null);
    return graduationLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialGraduationState(InitialGraduationState value),
    TResult graduationLoaded(GraduationLoaded value),
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
      {@required Grade currentGrade,
      @required Grade nextGrade,
      @required int attendedLessonsForGrade,
      @required double forNextLevel,
      @required bool isVisible}) = _$GraduationLoaded;

  Grade get currentGrade;
  Grade get nextGrade;
  int get attendedLessonsForGrade;
  double get forNextLevel;
  bool get isVisible;
  @JsonKey(ignore: true)
  $GraduationLoadedCopyWith<GraduationLoaded> get copyWith;
}
