// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'graduation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GraduationEventTearOff {
  const _$GraduationEventTearOff();

// ignore: unused_element
  GraduationSystemUpdated graduationSystemUpdated(
      {@required double forNextLevel,
      @required int attendedLessonsForGrade,
      @required Grade currentGrade,
      @required Grade nextGrade,
      @required bool isVisible}) {
    return GraduationSystemUpdated(
      forNextLevel: forNextLevel,
      attendedLessonsForGrade: attendedLessonsForGrade,
      currentGrade: currentGrade,
      nextGrade: nextGrade,
      isVisible: isVisible,
    );
  }

// ignore: unused_element
  Graduate graduate({@required Grade newGrade}) {
    return Graduate(
      newGrade: newGrade,
    );
  }

// ignore: unused_element
  InitializeGraduation initializeGraduation() {
    return const InitializeGraduation();
  }
}

/// @nodoc
// ignore: unused_element
const $GraduationEvent = _$GraduationEventTearOff();

/// @nodoc
mixin _$GraduationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult graduationSystemUpdated(
            double forNextLevel,
            int attendedLessonsForGrade,
            Grade currentGrade,
            Grade nextGrade,
            bool isVisible),
    @required TResult graduate(Grade newGrade),
    @required TResult initializeGraduation(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult graduationSystemUpdated(
        double forNextLevel,
        int attendedLessonsForGrade,
        Grade currentGrade,
        Grade nextGrade,
        bool isVisible),
    TResult graduate(Grade newGrade),
    TResult initializeGraduation(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult graduationSystemUpdated(GraduationSystemUpdated value),
    @required TResult graduate(Graduate value),
    @required TResult initializeGraduation(InitializeGraduation value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult graduationSystemUpdated(GraduationSystemUpdated value),
    TResult graduate(Graduate value),
    TResult initializeGraduation(InitializeGraduation value),
    @required TResult orElse(),
  });
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
    Object forNextLevel = freezed,
    Object attendedLessonsForGrade = freezed,
    Object currentGrade = freezed,
    Object nextGrade = freezed,
    Object isVisible = freezed,
  }) {
    return _then(GraduationSystemUpdated(
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel as double,
      attendedLessonsForGrade: attendedLessonsForGrade == freezed
          ? _value.attendedLessonsForGrade
          : attendedLessonsForGrade as int,
      currentGrade:
          currentGrade == freezed ? _value.currentGrade : currentGrade as Grade,
      nextGrade: nextGrade == freezed ? _value.nextGrade : nextGrade as Grade,
      isVisible: isVisible == freezed ? _value.isVisible : isVisible as bool,
    ));
  }
}

/// @nodoc
class _$GraduationSystemUpdated
    with DiagnosticableTreeMixin
    implements GraduationSystemUpdated {
  const _$GraduationSystemUpdated(
      {@required this.forNextLevel,
      @required this.attendedLessonsForGrade,
      @required this.currentGrade,
      @required this.nextGrade,
      @required this.isVisible})
      : assert(forNextLevel != null),
        assert(attendedLessonsForGrade != null),
        assert(currentGrade != null),
        assert(nextGrade != null),
        assert(isVisible != null);

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
  TResult when<TResult extends Object>({
    @required
        TResult graduationSystemUpdated(
            double forNextLevel,
            int attendedLessonsForGrade,
            Grade currentGrade,
            Grade nextGrade,
            bool isVisible),
    @required TResult graduate(Grade newGrade),
    @required TResult initializeGraduation(),
  }) {
    assert(graduationSystemUpdated != null);
    assert(graduate != null);
    assert(initializeGraduation != null);
    return graduationSystemUpdated(forNextLevel, attendedLessonsForGrade,
        currentGrade, nextGrade, isVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult graduationSystemUpdated(
        double forNextLevel,
        int attendedLessonsForGrade,
        Grade currentGrade,
        Grade nextGrade,
        bool isVisible),
    TResult graduate(Grade newGrade),
    TResult initializeGraduation(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduationSystemUpdated != null) {
      return graduationSystemUpdated(forNextLevel, attendedLessonsForGrade,
          currentGrade, nextGrade, isVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult graduationSystemUpdated(GraduationSystemUpdated value),
    @required TResult graduate(Graduate value),
    @required TResult initializeGraduation(InitializeGraduation value),
  }) {
    assert(graduationSystemUpdated != null);
    assert(graduate != null);
    assert(initializeGraduation != null);
    return graduationSystemUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult graduationSystemUpdated(GraduationSystemUpdated value),
    TResult graduate(Graduate value),
    TResult initializeGraduation(InitializeGraduation value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduationSystemUpdated != null) {
      return graduationSystemUpdated(this);
    }
    return orElse();
  }
}

abstract class GraduationSystemUpdated implements GraduationEvent {
  const factory GraduationSystemUpdated(
      {@required double forNextLevel,
      @required int attendedLessonsForGrade,
      @required Grade currentGrade,
      @required Grade nextGrade,
      @required bool isVisible}) = _$GraduationSystemUpdated;

  double get forNextLevel;
  int get attendedLessonsForGrade;
  Grade get currentGrade;
  Grade get nextGrade;
  bool get isVisible;
  @JsonKey(ignore: true)
  $GraduationSystemUpdatedCopyWith<GraduationSystemUpdated> get copyWith;
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
    Object newGrade = freezed,
  }) {
    return _then(Graduate(
      newGrade: newGrade == freezed ? _value.newGrade : newGrade as Grade,
    ));
  }
}

/// @nodoc
class _$Graduate with DiagnosticableTreeMixin implements Graduate {
  const _$Graduate({@required this.newGrade}) : assert(newGrade != null);

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
  TResult when<TResult extends Object>({
    @required
        TResult graduationSystemUpdated(
            double forNextLevel,
            int attendedLessonsForGrade,
            Grade currentGrade,
            Grade nextGrade,
            bool isVisible),
    @required TResult graduate(Grade newGrade),
    @required TResult initializeGraduation(),
  }) {
    assert(graduationSystemUpdated != null);
    assert(graduate != null);
    assert(initializeGraduation != null);
    return graduate(newGrade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult graduationSystemUpdated(
        double forNextLevel,
        int attendedLessonsForGrade,
        Grade currentGrade,
        Grade nextGrade,
        bool isVisible),
    TResult graduate(Grade newGrade),
    TResult initializeGraduation(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduate != null) {
      return graduate(newGrade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult graduationSystemUpdated(GraduationSystemUpdated value),
    @required TResult graduate(Graduate value),
    @required TResult initializeGraduation(InitializeGraduation value),
  }) {
    assert(graduationSystemUpdated != null);
    assert(graduate != null);
    assert(initializeGraduation != null);
    return graduate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult graduationSystemUpdated(GraduationSystemUpdated value),
    TResult graduate(Graduate value),
    TResult initializeGraduation(InitializeGraduation value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (graduate != null) {
      return graduate(this);
    }
    return orElse();
  }
}

abstract class Graduate implements GraduationEvent {
  const factory Graduate({@required Grade newGrade}) = _$Graduate;

  Grade get newGrade;
  @JsonKey(ignore: true)
  $GraduateCopyWith<Graduate> get copyWith;
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
  TResult when<TResult extends Object>({
    @required
        TResult graduationSystemUpdated(
            double forNextLevel,
            int attendedLessonsForGrade,
            Grade currentGrade,
            Grade nextGrade,
            bool isVisible),
    @required TResult graduate(Grade newGrade),
    @required TResult initializeGraduation(),
  }) {
    assert(graduationSystemUpdated != null);
    assert(graduate != null);
    assert(initializeGraduation != null);
    return initializeGraduation();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult graduationSystemUpdated(
        double forNextLevel,
        int attendedLessonsForGrade,
        Grade currentGrade,
        Grade nextGrade,
        bool isVisible),
    TResult graduate(Grade newGrade),
    TResult initializeGraduation(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeGraduation != null) {
      return initializeGraduation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult graduationSystemUpdated(GraduationSystemUpdated value),
    @required TResult graduate(Graduate value),
    @required TResult initializeGraduation(InitializeGraduation value),
  }) {
    assert(graduationSystemUpdated != null);
    assert(graduate != null);
    assert(initializeGraduation != null);
    return initializeGraduation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult graduationSystemUpdated(GraduationSystemUpdated value),
    TResult graduate(Graduate value),
    TResult initializeGraduation(InitializeGraduation value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeGraduation != null) {
      return initializeGraduation(this);
    }
    return orElse();
  }
}

abstract class InitializeGraduation implements GraduationEvent {
  const factory InitializeGraduation() = _$InitializeGraduation;
}
