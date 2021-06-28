// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'graduation_system.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GraduationSystem _$GraduationSystemFromJson(Map<String, dynamic> json) {
  return _GraduationSystem.fromJson(json);
}

/// @nodoc
class _$GraduationSystemTearOff {
  const _$GraduationSystemTearOff();

  _GraduationSystem call(
      {@GradeConverter() required Grade grade, required double forNextLevel}) {
    return _GraduationSystem(
      grade: grade,
      forNextLevel: forNextLevel,
    );
  }

  GraduationSystem fromJson(Map<String, Object> json) {
    return GraduationSystem.fromJson(json);
  }
}

/// @nodoc
const $GraduationSystem = _$GraduationSystemTearOff();

/// @nodoc
mixin _$GraduationSystem {
  @GradeConverter()
  Grade get grade =>
      throw _privateConstructorUsedError; //NOTE: this is double because we need to support Infinity
  double get forNextLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraduationSystemCopyWith<GraduationSystem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraduationSystemCopyWith<$Res> {
  factory $GraduationSystemCopyWith(
          GraduationSystem value, $Res Function(GraduationSystem) then) =
      _$GraduationSystemCopyWithImpl<$Res>;
  $Res call({@GradeConverter() Grade grade, double forNextLevel});
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
    Object? grade = freezed,
    Object? forNextLevel = freezed,
  }) {
    return _then(_value.copyWith(
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade,
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel // ignore: cast_nullable_to_non_nullable
              as double,
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
  $Res call({@GradeConverter() Grade grade, double forNextLevel});
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
    Object? grade = freezed,
    Object? forNextLevel = freezed,
  }) {
    return _then(_GraduationSystem(
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade,
      forNextLevel: forNextLevel == freezed
          ? _value.forNextLevel
          : forNextLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GraduationSystem
    with DiagnosticableTreeMixin
    implements _GraduationSystem {
  _$_GraduationSystem(
      {@GradeConverter() required this.grade, required this.forNextLevel});

  factory _$_GraduationSystem.fromJson(Map<String, dynamic> json) =>
      _$_$_GraduationSystemFromJson(json);

  @override
  @GradeConverter()
  final Grade grade;
  @override //NOTE: this is double because we need to support Infinity
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

  @JsonKey(ignore: true)
  @override
  _$GraduationSystemCopyWith<_GraduationSystem> get copyWith =>
      __$GraduationSystemCopyWithImpl<_GraduationSystem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GraduationSystemToJson(this);
  }
}

abstract class _GraduationSystem implements GraduationSystem {
  factory _GraduationSystem(
      {@GradeConverter() required Grade grade,
      required double forNextLevel}) = _$_GraduationSystem;

  factory _GraduationSystem.fromJson(Map<String, dynamic> json) =
      _$_GraduationSystem.fromJson;

  @override
  @GradeConverter()
  Grade get grade => throw _privateConstructorUsedError;
  @override //NOTE: this is double because we need to support Infinity
  double get forNextLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GraduationSystemCopyWith<_GraduationSystem> get copyWith =>
      throw _privateConstructorUsedError;
}
