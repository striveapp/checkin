// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'json_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
JsonModel _$JsonModelFromJson(Map<String, dynamic> json) {
  return _JsonModel.fromJson(json);
}

/// @nodoc
class _$JsonModelTearOff {
  const _$JsonModelTearOff();

// ignore: unused_element
  _JsonModel call(
      {String simpleField,
      @required String requiredField,
      bool defaultField = true,
      @GradeConverter() Grade grade}) {
    return _JsonModel(
      simpleField: simpleField,
      requiredField: requiredField,
      defaultField: defaultField,
      grade: grade,
    );
  }

// ignore: unused_element
  JsonModel fromJson(Map<String, Object> json) {
    return JsonModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $JsonModel = _$JsonModelTearOff();

/// @nodoc
mixin _$JsonModel {
  String get simpleField;
  String get requiredField;
  bool get defaultField;
  @GradeConverter()
  Grade get grade;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $JsonModelCopyWith<JsonModel> get copyWith;
}

/// @nodoc
abstract class $JsonModelCopyWith<$Res> {
  factory $JsonModelCopyWith(JsonModel value, $Res Function(JsonModel) then) =
      _$JsonModelCopyWithImpl<$Res>;
  $Res call(
      {String simpleField, String requiredField, bool defaultField, @GradeConverter() Grade grade});
}

/// @nodoc
class _$JsonModelCopyWithImpl<$Res> implements $JsonModelCopyWith<$Res> {
  _$JsonModelCopyWithImpl(this._value, this._then);

  final JsonModel _value;
  // ignore: unused_field
  final $Res Function(JsonModel) _then;

  @override
  $Res call({
    Object simpleField = freezed,
    Object requiredField = freezed,
    Object defaultField = freezed,
    Object grade = freezed,
  }) {
    return _then(_value.copyWith(
      simpleField: simpleField == freezed ? _value.simpleField : simpleField as String,
      requiredField: requiredField == freezed ? _value.requiredField : requiredField as String,
      defaultField: defaultField == freezed ? _value.defaultField : defaultField as bool,
      grade: grade == freezed ? _value.grade : grade as Grade,
    ));
  }
}

/// @nodoc
abstract class _$JsonModelCopyWith<$Res> implements $JsonModelCopyWith<$Res> {
  factory _$JsonModelCopyWith(_JsonModel value, $Res Function(_JsonModel) then) =
      __$JsonModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String simpleField, String requiredField, bool defaultField, @GradeConverter() Grade grade});
}

/// @nodoc
class __$JsonModelCopyWithImpl<$Res> extends _$JsonModelCopyWithImpl<$Res>
    implements _$JsonModelCopyWith<$Res> {
  __$JsonModelCopyWithImpl(_JsonModel _value, $Res Function(_JsonModel) _then)
      : super(_value, (v) => _then(v as _JsonModel));

  @override
  _JsonModel get _value => super._value as _JsonModel;

  @override
  $Res call({
    Object simpleField = freezed,
    Object requiredField = freezed,
    Object defaultField = freezed,
    Object grade = freezed,
  }) {
    return _then(_JsonModel(
      simpleField: simpleField == freezed ? _value.simpleField : simpleField as String,
      requiredField: requiredField == freezed ? _value.requiredField : requiredField as String,
      defaultField: defaultField == freezed ? _value.defaultField : defaultField as bool,
      grade: grade == freezed ? _value.grade : grade as Grade,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_JsonModel with DiagnosticableTreeMixin implements _JsonModel {
  _$_JsonModel(
      {this.simpleField,
      @required this.requiredField,
      this.defaultField = true,
      @GradeConverter() this.grade})
      : assert(requiredField != null),
        assert(defaultField != null);

  factory _$_JsonModel.fromJson(Map<String, dynamic> json) => _$_$_JsonModelFromJson(json);

  @override
  final String simpleField;
  @override
  final String requiredField;
  @JsonKey(defaultValue: true)
  @override
  final bool defaultField;
  @override
  @GradeConverter()
  final Grade grade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JsonModel(simpleField: $simpleField, requiredField: $requiredField, defaultField: $defaultField, grade: $grade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JsonModel'))
      ..add(DiagnosticsProperty('simpleField', simpleField))
      ..add(DiagnosticsProperty('requiredField', requiredField))
      ..add(DiagnosticsProperty('defaultField', defaultField))
      ..add(DiagnosticsProperty('grade', grade));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JsonModel &&
            (identical(other.simpleField, simpleField) ||
                const DeepCollectionEquality().equals(other.simpleField, simpleField)) &&
            (identical(other.requiredField, requiredField) ||
                const DeepCollectionEquality().equals(other.requiredField, requiredField)) &&
            (identical(other.defaultField, defaultField) ||
                const DeepCollectionEquality().equals(other.defaultField, defaultField)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(simpleField) ^
      const DeepCollectionEquality().hash(requiredField) ^
      const DeepCollectionEquality().hash(defaultField) ^
      const DeepCollectionEquality().hash(grade);

  @JsonKey(ignore: true)
  @override
  _$JsonModelCopyWith<_JsonModel> get copyWith =>
      __$JsonModelCopyWithImpl<_JsonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_JsonModelToJson(this);
  }
}

abstract class _JsonModel implements JsonModel {
  factory _JsonModel(
      {String simpleField,
      @required String requiredField,
      bool defaultField,
      @GradeConverter() Grade grade}) = _$_JsonModel;

  factory _JsonModel.fromJson(Map<String, dynamic> json) = _$_JsonModel.fromJson;

  @override
  String get simpleField;
  @override
  String get requiredField;
  @override
  bool get defaultField;
  @override
  @GradeConverter()
  Grade get grade;
  @override
  @JsonKey(ignore: true)
  _$JsonModelCopyWith<_JsonModel> get copyWith;
}
