// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'graduation_system.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GraduationSystemTearOff {
  const _$GraduationSystemTearOff();

// ignore: unused_element
  _GraduationSystem call(
      {@required Map<String, GraduationRequirement> system}) {
    return _GraduationSystem(
      system: system,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GraduationSystem = _$GraduationSystemTearOff();

/// @nodoc
mixin _$GraduationSystem {
  Map<String, GraduationRequirement> get system;

  $GraduationSystemCopyWith<GraduationSystem> get copyWith;
}

/// @nodoc
abstract class $GraduationSystemCopyWith<$Res> {
  factory $GraduationSystemCopyWith(
          GraduationSystem value, $Res Function(GraduationSystem) then) =
      _$GraduationSystemCopyWithImpl<$Res>;
  $Res call({Map<String, GraduationRequirement> system});
}

/// @nodoc
class _$GraduationSystemCopyWithImpl<$Res>
    implements $GraduationSystemCopyWith<$Res> {
  _$GraduationSystemCopyWithImpl(this._value, this._then);

  final GraduationSystem _value;
  // ignore: unused_field
  final $Res Function(GraduationSystem) _then;

  @override
  $Res call({
    Object system = freezed,
  }) {
    return _then(_value.copyWith(
      system: system == freezed
          ? _value.system
          : system as Map<String, GraduationRequirement>,
    ));
  }
}

/// @nodoc
abstract class _$GraduationSystemCopyWith<$Res>
    implements $GraduationSystemCopyWith<$Res> {
  factory _$GraduationSystemCopyWith(
          _GraduationSystem value, $Res Function(_GraduationSystem) then) =
      __$GraduationSystemCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, GraduationRequirement> system});
}

/// @nodoc
class __$GraduationSystemCopyWithImpl<$Res>
    extends _$GraduationSystemCopyWithImpl<$Res>
    implements _$GraduationSystemCopyWith<$Res> {
  __$GraduationSystemCopyWithImpl(
      _GraduationSystem _value, $Res Function(_GraduationSystem) _then)
      : super(_value, (v) => _then(v as _GraduationSystem));

  @override
  _GraduationSystem get _value => super._value as _GraduationSystem;

  @override
  $Res call({
    Object system = freezed,
  }) {
    return _then(_GraduationSystem(
      system: system == freezed
          ? _value.system
          : system as Map<String, GraduationRequirement>,
    ));
  }
}

/// @nodoc
class _$_GraduationSystem
    with DiagnosticableTreeMixin
    implements _GraduationSystem {
  _$_GraduationSystem({@required this.system}) : assert(system != null);

  @override
  final Map<String, GraduationRequirement> system;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationSystem(system: $system)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GraduationSystem'))
      ..add(DiagnosticsProperty('system', system));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GraduationSystem &&
            (identical(other.system, system) ||
                const DeepCollectionEquality().equals(other.system, system)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(system);

  @override
  _$GraduationSystemCopyWith<_GraduationSystem> get copyWith =>
      __$GraduationSystemCopyWithImpl<_GraduationSystem>(this, _$identity);
}

abstract class _GraduationSystem implements GraduationSystem {
  factory _GraduationSystem(
          {@required Map<String, GraduationRequirement> system}) =
      _$_GraduationSystem;

  @override
  Map<String, GraduationRequirement> get system;
  @override
  _$GraduationSystemCopyWith<_GraduationSystem> get copyWith;
}

/// @nodoc
class _$GraduationRequirementTearOff {
  const _$GraduationRequirementTearOff();

// ignore: unused_element
  _GraduationRequirement call(
      {@required String grade, @required double forNextLevel}) {
    return _GraduationRequirement(
      grade: grade,
      forNextLevel: forNextLevel,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GraduationRequirement = _$GraduationRequirementTearOff();

/// @nodoc
mixin _$GraduationRequirement {
  String get grade;
  double get forNextLevel;

  $GraduationRequirementCopyWith<GraduationRequirement> get copyWith;
}

/// @nodoc
abstract class $GraduationRequirementCopyWith<$Res> {
  factory $GraduationRequirementCopyWith(GraduationRequirement value,
          $Res Function(GraduationRequirement) then) =
      _$GraduationRequirementCopyWithImpl<$Res>;
  $Res call({String grade, double forNextLevel});
}

/// @nodoc
class _$GraduationRequirementCopyWithImpl<$Res>
    implements $GraduationRequirementCopyWith<$Res> {
  _$GraduationRequirementCopyWithImpl(this._value, this._then);

  final GraduationRequirement _value;
  // ignore: unused_field
  final $Res Function(GraduationRequirement) _then;

  @override
  $Res call({
    Object grade = freezed,
    Object forNextLevel = freezed,
  }) {
    return _then(_value.copyWith(
      grade: grade == freezed ? _value.grade : grade as String,
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel as double,
    ));
  }
}

/// @nodoc
abstract class _$GraduationRequirementCopyWith<$Res>
    implements $GraduationRequirementCopyWith<$Res> {
  factory _$GraduationRequirementCopyWith(_GraduationRequirement value,
          $Res Function(_GraduationRequirement) then) =
      __$GraduationRequirementCopyWithImpl<$Res>;
  @override
  $Res call({String grade, double forNextLevel});
}

/// @nodoc
class __$GraduationRequirementCopyWithImpl<$Res>
    extends _$GraduationRequirementCopyWithImpl<$Res>
    implements _$GraduationRequirementCopyWith<$Res> {
  __$GraduationRequirementCopyWithImpl(_GraduationRequirement _value,
      $Res Function(_GraduationRequirement) _then)
      : super(_value, (v) => _then(v as _GraduationRequirement));

  @override
  _GraduationRequirement get _value => super._value as _GraduationRequirement;

  @override
  $Res call({
    Object grade = freezed,
    Object forNextLevel = freezed,
  }) {
    return _then(_GraduationRequirement(
      grade: grade == freezed ? _value.grade : grade as String,
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel as double,
    ));
  }
}

/// @nodoc
class _$_GraduationRequirement
    with DiagnosticableTreeMixin
    implements _GraduationRequirement {
  _$_GraduationRequirement({@required this.grade, @required this.forNextLevel})
      : assert(grade != null),
        assert(forNextLevel != null);

  @override
  final String grade;
  @override
  final double forNextLevel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationRequirement(grade: $grade, forNextLevel: $forNextLevel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GraduationRequirement'))
      ..add(DiagnosticsProperty('grade', grade))
      ..add(DiagnosticsProperty('forNextLevel', forNextLevel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GraduationRequirement &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)) &&
            (identical(other.forNextLevel, forNextLevel) ||
                const DeepCollectionEquality()
                    .equals(other.forNextLevel, forNextLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(grade) ^
      const DeepCollectionEquality().hash(forNextLevel);

  @override
  _$GraduationRequirementCopyWith<_GraduationRequirement> get copyWith =>
      __$GraduationRequirementCopyWithImpl<_GraduationRequirement>(
          this, _$identity);
}

abstract class _GraduationRequirement implements GraduationRequirement {
  factory _GraduationRequirement(
      {@required String grade,
      @required double forNextLevel}) = _$_GraduationRequirement;

  @override
  String get grade;
  @override
  double get forNextLevel;
  @override
  _$GraduationRequirementCopyWith<_GraduationRequirement> get copyWith;
}
