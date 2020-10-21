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
      {@required Grade grade, @required double forNextLevel}) {
    return _GraduationSystem(
      grade: grade,
      forNextLevel: forNextLevel,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GraduationSystem = _$GraduationSystemTearOff();

/// @nodoc
mixin _$GraduationSystem {
  Grade get grade;
  double get forNextLevel;

  $GraduationSystemCopyWith<GraduationSystem> get copyWith;
}

/// @nodoc
abstract class $GraduationSystemCopyWith<$Res> {
  factory $GraduationSystemCopyWith(
          GraduationSystem value, $Res Function(GraduationSystem) then) =
      _$GraduationSystemCopyWithImpl<$Res>;
  $Res call({Grade grade, double forNextLevel});
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
    Object grade = freezed,
    Object forNextLevel = freezed,
  }) {
    return _then(_value.copyWith(
      grade: grade == freezed ? _value.grade : grade as Grade,
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel as double,
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
  $Res call({Grade grade, double forNextLevel});
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
    Object grade = freezed,
    Object forNextLevel = freezed,
  }) {
    return _then(_GraduationSystem(
      grade: grade == freezed ? _value.grade : grade as Grade,
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel as double,
    ));
  }
}

/// @nodoc
class _$_GraduationSystem
    with DiagnosticableTreeMixin
    implements _GraduationSystem {
  _$_GraduationSystem({@required this.grade, @required this.forNextLevel})
      : assert(grade != null),
        assert(forNextLevel != null);

  @override
  final Grade grade;
  @override
  final double forNextLevel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationSystem(grade: $grade, forNextLevel: $forNextLevel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GraduationSystem'))
      ..add(DiagnosticsProperty('grade', grade))
      ..add(DiagnosticsProperty('forNextLevel', forNextLevel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GraduationSystem &&
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
  _$GraduationSystemCopyWith<_GraduationSystem> get copyWith =>
      __$GraduationSystemCopyWithImpl<_GraduationSystem>(this, _$identity);
}

abstract class _GraduationSystem implements GraduationSystem {
  factory _GraduationSystem(
      {@required Grade grade,
      @required double forNextLevel}) = _$_GraduationSystem;

  @override
  Grade get grade;
  @override
  double get forNextLevel;
  @override
  _$GraduationSystemCopyWith<_GraduationSystem> get copyWith;
}
