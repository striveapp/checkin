// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'graduation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GraduationEventTearOff {
  const _$GraduationEventTearOff();

  GraduationSystemUpdated graduationSystemUpdated(
      {required double forNextLevel,
      required int attendedLessonsForGrade,
      required Grade currentGrade,
      required Grade nextGrade,
      required bool isVisible}) {
    return GraduationSystemUpdated(
      forNextLevel: forNextLevel,
      attendedLessonsForGrade: attendedLessonsForGrade,
      currentGrade: currentGrade,
      nextGrade: nextGrade,
      isVisible: isVisible,
    );
  }

  Graduate graduate({required Grade newGrade}) {
    return Graduate(
      newGrade: newGrade,
    );
  }

  InitializeGraduation initializeGraduation() {
    return const InitializeGraduation();
  }
}

/// @nodoc
const $GraduationEvent = _$GraduationEventTearOff();

/// @nodoc
mixin _$GraduationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double forNextLevel, int attendedLessonsForGrade,
            Grade currentGrade, Grade nextGrade, bool isVisible)
        graduationSystemUpdated,
    required TResult Function(Grade newGrade) graduate,
    required TResult Function() initializeGraduation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double forNextLevel, int attendedLessonsForGrade,
            Grade currentGrade, Grade nextGrade, bool isVisible)?
        graduationSystemUpdated,
    TResult Function(Grade newGrade)? graduate,
    TResult Function()? initializeGraduation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GraduationSystemUpdated value)
        graduationSystemUpdated,
    required TResult Function(Graduate value) graduate,
    required TResult Function(InitializeGraduation value) initializeGraduation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraduationSystemUpdated value)? graduationSystemUpdated,
    TResult Function(Graduate value)? graduate,
    TResult Function(InitializeGraduation value)? initializeGraduation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraduationEventCopyWith<$Res> {
  factory $GraduationEventCopyWith(
          GraduationEvent value, $Res Function(GraduationEvent) then) =
      _$GraduationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GraduationEventCopyWithImpl<$Res>
    implements $GraduationEventCopyWith<$Res> {
  _$GraduationEventCopyWithImpl(this._value, this._then);

  final GraduationEvent _value;
  // ignore: unused_field
  final $Res Function(GraduationEvent) _then;
}

/// @nodoc
abstract class $GraduationSystemUpdatedCopyWith<$Res> {
  factory $GraduationSystemUpdatedCopyWith(GraduationSystemUpdated value,
          $Res Function(GraduationSystemUpdated) then) =
      _$GraduationSystemUpdatedCopyWithImpl<$Res>;
  $Res call(
      {double forNextLevel,
      int attendedLessonsForGrade,
      Grade currentGrade,
      Grade nextGrade,
      bool isVisible});
}

/// @nodoc
class _$GraduationSystemUpdatedCopyWithImpl<$Res>
    extends _$GraduationEventCopyWithImpl<$Res>
    implements $GraduationSystemUpdatedCopyWith<$Res> {
  _$GraduationSystemUpdatedCopyWithImpl(GraduationSystemUpdated _value,
      $Res Function(GraduationSystemUpdated) _then)
      : super(_value, (v) => _then(v as GraduationSystemUpdated));

  @override
  GraduationSystemUpdated get _value => super._value as GraduationSystemUpdated;

  @override
  $Res call({
    Object? forNextLevel = freezed,
    Object? attendedLessonsForGrade = freezed,
    Object? currentGrade = freezed,
    Object? nextGrade = freezed,
    Object? isVisible = freezed,
  }) {
    return _then(GraduationSystemUpdated(
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel // ignore: cast_nullable_to_non_nullable
              as double,
      attendedLessonsForGrade: attendedLessonsForGrade == freezed
          ? _value.attendedLessonsForGrade
          : attendedLessonsForGrade // ignore: cast_nullable_to_non_nullable
              as int,
      currentGrade: currentGrade == freezed
          ? _value.currentGrade
          : currentGrade // ignore: cast_nullable_to_non_nullable
              as Grade,
      nextGrade: nextGrade == freezed
          ? _value.nextGrade
          : nextGrade // ignore: cast_nullable_to_non_nullable
              as Grade,
      isVisible: isVisible == freezed
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GraduationSystemUpdated
    with DiagnosticableTreeMixin
    implements GraduationSystemUpdated {
  const _$GraduationSystemUpdated(
      {required this.forNextLevel,
      required this.attendedLessonsForGrade,
      required this.currentGrade,
      required this.nextGrade,
      required this.isVisible});

  @override
  final double forNextLevel;
  @override
  final int attendedLessonsForGrade;
  @override
  final Grade currentGrade;
  @override
  final Grade nextGrade;
  @override
  final bool isVisible;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationEvent.graduationSystemUpdated(forNextLevel: $forNextLevel, attendedLessonsForGrade: $attendedLessonsForGrade, currentGrade: $currentGrade, nextGrade: $nextGrade, isVisible: $isVisible)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'GraduationEvent.graduationSystemUpdated'))
      ..add(DiagnosticsProperty('forNextLevel', forNextLevel))
      ..add(DiagnosticsProperty(
          'attendedLessonsForGrade', attendedLessonsForGrade))
      ..add(DiagnosticsProperty('currentGrade', currentGrade))
      ..add(DiagnosticsProperty('nextGrade', nextGrade))
      ..add(DiagnosticsProperty('isVisible', isVisible));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GraduationSystemUpdated &&
            (identical(other.forNextLevel, forNextLevel) ||
                const DeepCollectionEquality()
                    .equals(other.forNextLevel, forNextLevel)) &&
            (identical(
                    other.attendedLessonsForGrade, attendedLessonsForGrade) ||
                const DeepCollectionEquality().equals(
                    other.attendedLessonsForGrade, attendedLessonsForGrade)) &&
            (identical(other.currentGrade, currentGrade) ||
                const DeepCollectionEquality()
                    .equals(other.currentGrade, currentGrade)) &&
            (identical(other.nextGrade, nextGrade) ||
                const DeepCollectionEquality()
                    .equals(other.nextGrade, nextGrade)) &&
            (identical(other.isVisible, isVisible) ||
                const DeepCollectionEquality()
                    .equals(other.isVisible, isVisible)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(forNextLevel) ^
      const DeepCollectionEquality().hash(attendedLessonsForGrade) ^
      const DeepCollectionEquality().hash(currentGrade) ^
      const DeepCollectionEquality().hash(nextGrade) ^
      const DeepCollectionEquality().hash(isVisible);

  @JsonKey(ignore: true)
  @override
  $GraduationSystemUpdatedCopyWith<GraduationSystemUpdated> get copyWith =>
      _$GraduationSystemUpdatedCopyWithImpl<GraduationSystemUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double forNextLevel, int attendedLessonsForGrade,
            Grade currentGrade, Grade nextGrade, bool isVisible)
        graduationSystemUpdated,
    required TResult Function(Grade newGrade) graduate,
    required TResult Function() initializeGraduation,
  }) {
    return graduationSystemUpdated(forNextLevel, attendedLessonsForGrade,
        currentGrade, nextGrade, isVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double forNextLevel, int attendedLessonsForGrade,
            Grade currentGrade, Grade nextGrade, bool isVisible)?
        graduationSystemUpdated,
    TResult Function(Grade newGrade)? graduate,
    TResult Function()? initializeGraduation,
    required TResult orElse(),
  }) {
    if (graduationSystemUpdated != null) {
      return graduationSystemUpdated(forNextLevel, attendedLessonsForGrade,
          currentGrade, nextGrade, isVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GraduationSystemUpdated value)
        graduationSystemUpdated,
    required TResult Function(Graduate value) graduate,
    required TResult Function(InitializeGraduation value) initializeGraduation,
  }) {
    return graduationSystemUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraduationSystemUpdated value)? graduationSystemUpdated,
    TResult Function(Graduate value)? graduate,
    TResult Function(InitializeGraduation value)? initializeGraduation,
    required TResult orElse(),
  }) {
    if (graduationSystemUpdated != null) {
      return graduationSystemUpdated(this);
    }
    return orElse();
  }
}

abstract class GraduationSystemUpdated implements GraduationEvent {
  const factory GraduationSystemUpdated(
      {required double forNextLevel,
      required int attendedLessonsForGrade,
      required Grade currentGrade,
      required Grade nextGrade,
      required bool isVisible}) = _$GraduationSystemUpdated;

  double get forNextLevel => throw _privateConstructorUsedError;
  int get attendedLessonsForGrade => throw _privateConstructorUsedError;
  Grade get currentGrade => throw _privateConstructorUsedError;
  Grade get nextGrade => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraduationSystemUpdatedCopyWith<GraduationSystemUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraduateCopyWith<$Res> {
  factory $GraduateCopyWith(Graduate value, $Res Function(Graduate) then) =
      _$GraduateCopyWithImpl<$Res>;
  $Res call({Grade newGrade});
}

/// @nodoc
class _$GraduateCopyWithImpl<$Res> extends _$GraduationEventCopyWithImpl<$Res>
    implements $GraduateCopyWith<$Res> {
  _$GraduateCopyWithImpl(Graduate _value, $Res Function(Graduate) _then)
      : super(_value, (v) => _then(v as Graduate));

  @override
  Graduate get _value => super._value as Graduate;

  @override
  $Res call({
    Object? newGrade = freezed,
  }) {
    return _then(Graduate(
      newGrade: newGrade == freezed
          ? _value.newGrade
          : newGrade // ignore: cast_nullable_to_non_nullable
              as Grade,
    ));
  }
}

/// @nodoc

class _$Graduate with DiagnosticableTreeMixin implements Graduate {
  const _$Graduate({required this.newGrade});

  @override
  final Grade newGrade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationEvent.graduate(newGrade: $newGrade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GraduationEvent.graduate'))
      ..add(DiagnosticsProperty('newGrade', newGrade));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Graduate &&
            (identical(other.newGrade, newGrade) ||
                const DeepCollectionEquality()
                    .equals(other.newGrade, newGrade)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newGrade);

  @JsonKey(ignore: true)
  @override
  $GraduateCopyWith<Graduate> get copyWith =>
      _$GraduateCopyWithImpl<Graduate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double forNextLevel, int attendedLessonsForGrade,
            Grade currentGrade, Grade nextGrade, bool isVisible)
        graduationSystemUpdated,
    required TResult Function(Grade newGrade) graduate,
    required TResult Function() initializeGraduation,
  }) {
    return graduate(newGrade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double forNextLevel, int attendedLessonsForGrade,
            Grade currentGrade, Grade nextGrade, bool isVisible)?
        graduationSystemUpdated,
    TResult Function(Grade newGrade)? graduate,
    TResult Function()? initializeGraduation,
    required TResult orElse(),
  }) {
    if (graduate != null) {
      return graduate(newGrade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GraduationSystemUpdated value)
        graduationSystemUpdated,
    required TResult Function(Graduate value) graduate,
    required TResult Function(InitializeGraduation value) initializeGraduation,
  }) {
    return graduate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraduationSystemUpdated value)? graduationSystemUpdated,
    TResult Function(Graduate value)? graduate,
    TResult Function(InitializeGraduation value)? initializeGraduation,
    required TResult orElse(),
  }) {
    if (graduate != null) {
      return graduate(this);
    }
    return orElse();
  }
}

abstract class Graduate implements GraduationEvent {
  const factory Graduate({required Grade newGrade}) = _$Graduate;

  Grade get newGrade => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraduateCopyWith<Graduate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializeGraduationCopyWith<$Res> {
  factory $InitializeGraduationCopyWith(InitializeGraduation value,
          $Res Function(InitializeGraduation) then) =
      _$InitializeGraduationCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeGraduationCopyWithImpl<$Res>
    extends _$GraduationEventCopyWithImpl<$Res>
    implements $InitializeGraduationCopyWith<$Res> {
  _$InitializeGraduationCopyWithImpl(
      InitializeGraduation _value, $Res Function(InitializeGraduation) _then)
      : super(_value, (v) => _then(v as InitializeGraduation));

  @override
  InitializeGraduation get _value => super._value as InitializeGraduation;
}

/// @nodoc

class _$InitializeGraduation
    with DiagnosticableTreeMixin
    implements InitializeGraduation {
  const _$InitializeGraduation();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationEvent.initializeGraduation()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'GraduationEvent.initializeGraduation'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeGraduation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double forNextLevel, int attendedLessonsForGrade,
            Grade currentGrade, Grade nextGrade, bool isVisible)
        graduationSystemUpdated,
    required TResult Function(Grade newGrade) graduate,
    required TResult Function() initializeGraduation,
  }) {
    return initializeGraduation();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double forNextLevel, int attendedLessonsForGrade,
            Grade currentGrade, Grade nextGrade, bool isVisible)?
        graduationSystemUpdated,
    TResult Function(Grade newGrade)? graduate,
    TResult Function()? initializeGraduation,
    required TResult orElse(),
  }) {
    if (initializeGraduation != null) {
      return initializeGraduation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GraduationSystemUpdated value)
        graduationSystemUpdated,
    required TResult Function(Graduate value) graduate,
    required TResult Function(InitializeGraduation value) initializeGraduation,
  }) {
    return initializeGraduation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GraduationSystemUpdated value)? graduationSystemUpdated,
    TResult Function(Graduate value)? graduate,
    TResult Function(InitializeGraduation value)? initializeGraduation,
    required TResult orElse(),
  }) {
    if (initializeGraduation != null) {
      return initializeGraduation(this);
    }
    return orElse();
  }
}

abstract class InitializeGraduation implements GraduationEvent {
  const factory InitializeGraduation() = _$InitializeGraduation;
}
