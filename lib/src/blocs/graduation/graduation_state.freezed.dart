// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'graduation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GraduationStateTearOff {
  const _$GraduationStateTearOff();

  InitialGraduationState initialGraduationState() {
    return const InitialGraduationState();
  }

  GraduationLoaded graduationLoaded(
      {required Grade currentGrade,
      required Grade nextGrade,
      required int attendedLessonsForGrade,
      required double forNextLevel,
      required bool isVisible}) {
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
const $GraduationState = _$GraduationStateTearOff();

/// @nodoc
mixin _$GraduationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialGraduationState,
    required TResult Function(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible)
        graduationLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialGraduationState,
    TResult Function(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible)?
        graduationLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialGraduationState value)
        initialGraduationState,
    required TResult Function(GraduationLoaded value) graduationLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGraduationState value)? initialGraduationState,
    TResult Function(GraduationLoaded value)? graduationLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function() initialGraduationState,
    required TResult Function(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible)
        graduationLoaded,
  }) {
    return initialGraduationState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialGraduationState,
    TResult Function(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible)?
        graduationLoaded,
    required TResult orElse(),
  }) {
    if (initialGraduationState != null) {
      return initialGraduationState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialGraduationState value)
        initialGraduationState,
    required TResult Function(GraduationLoaded value) graduationLoaded,
  }) {
    return initialGraduationState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGraduationState value)? initialGraduationState,
    TResult Function(GraduationLoaded value)? graduationLoaded,
    required TResult orElse(),
  }) {
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
    Object? currentGrade = freezed,
    Object? nextGrade = freezed,
    Object? attendedLessonsForGrade = freezed,
    Object? forNextLevel = freezed,
    Object? isVisible = freezed,
  }) {
    return _then(GraduationLoaded(
      currentGrade: currentGrade == freezed
          ? _value.currentGrade
          : currentGrade // ignore: cast_nullable_to_non_nullable
              as Grade,
      nextGrade: nextGrade == freezed
          ? _value.nextGrade
          : nextGrade // ignore: cast_nullable_to_non_nullable
              as Grade,
      attendedLessonsForGrade: attendedLessonsForGrade == freezed
          ? _value.attendedLessonsForGrade
          : attendedLessonsForGrade // ignore: cast_nullable_to_non_nullable
              as int,
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel // ignore: cast_nullable_to_non_nullable
              as double,
      isVisible: isVisible == freezed
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GraduationLoaded
    with DiagnosticableTreeMixin
    implements GraduationLoaded {
  const _$GraduationLoaded(
      {required this.currentGrade,
      required this.nextGrade,
      required this.attendedLessonsForGrade,
      required this.forNextLevel,
      required this.isVisible});

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
  TResult when<TResult extends Object?>({
    required TResult Function() initialGraduationState,
    required TResult Function(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible)
        graduationLoaded,
  }) {
    return graduationLoaded(currentGrade, nextGrade, attendedLessonsForGrade,
        forNextLevel, isVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialGraduationState,
    TResult Function(Grade currentGrade, Grade nextGrade,
            int attendedLessonsForGrade, double forNextLevel, bool isVisible)?
        graduationLoaded,
    required TResult orElse(),
  }) {
    if (graduationLoaded != null) {
      return graduationLoaded(currentGrade, nextGrade, attendedLessonsForGrade,
          forNextLevel, isVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialGraduationState value)
        initialGraduationState,
    required TResult Function(GraduationLoaded value) graduationLoaded,
  }) {
    return graduationLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialGraduationState value)? initialGraduationState,
    TResult Function(GraduationLoaded value)? graduationLoaded,
    required TResult orElse(),
  }) {
    if (graduationLoaded != null) {
      return graduationLoaded(this);
    }
    return orElse();
  }
}

abstract class GraduationLoaded implements GraduationState {
  const factory GraduationLoaded(
      {required Grade currentGrade,
      required Grade nextGrade,
      required int attendedLessonsForGrade,
      required double forNextLevel,
      required bool isVisible}) = _$GraduationLoaded;

  Grade get currentGrade => throw _privateConstructorUsedError;
  Grade get nextGrade => throw _privateConstructorUsedError;
  int get attendedLessonsForGrade => throw _privateConstructorUsedError;
  double get forNextLevel => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraduationLoadedCopyWith<GraduationLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
